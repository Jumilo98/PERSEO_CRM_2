<?php

/** --------------------------------------------------------------------------------
 * This repository class manages all the data absctration for clients
 *
 * @package    Grow CRM
 * @author     NextLoop
 *----------------------------------------------------------------------------------*/

namespace App\Repositories;

use App\Models\Client;
use App\Models\Lead;
use App\Models\PerseoPc\ClientesPc;
//use App\Repositories\TagRepository;
use App\Models\PerseoPc\ClientesPotencialPc;
use App\Repositories\UserRepository;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;
use Log;

class ClientRepository
{

    /**
     * The clients repository instance.
     */
    protected $clients;

    /**
     * The tag repository instance.
     */
    protected $tagrepo;

    /**
     * The user repository instance.
     */
    protected $userrepo;


    protected $clientesPc;

    /**
     * Inject dependecies
     */
    public function __construct(Client $clients, TagRepository $tagrepo, UserRepository $userrepo, ClientesPc $clientesPc)
    {
        $this->clients = $clients;
        $this->tagrepo = $tagrepo;
        $this->userrepo = $userrepo;
        $this->clientesPc = $clientesPc;
    }

    /**
     * Search model
     * @param int $id optional for getting a single, specified record
     * @return object clients collection
     */
    public function search($id = '', $data = [])
    {

        $clients = $this->clients->newQuery();

        // all client fields
        $clients->selectRaw('*');

        //count: clients projects by status
        foreach (config('settings.project_statuses') as $key => $value) {
            $clients->countProjects($key);
        }
        $clients->countProjects('all');
        $clients->countProjects('pending');

        //count: clients invoices by status
        foreach (config('settings.invoice_statuses') as $key => $value) {
            $clients->countInvoices($key);
        }
        $clients->countInvoices('all');

        //sum: clients invoices by status
        foreach (config('settings.invoice_statuses') as $key => $value) {
            $clients->sumInvoices($key);
        }
        $clients->sumInvoices('all');

        //sum payments
        $clients->selectRaw("(SELECT SUM(payment_amount)
                                     FROM crm_pagos
                                     WHERE crm_pagos.payment_clientid = crm_clientes.client_id
                                     ) AS sum_all_payments");

        //join: primary contact
        $clients->leftJoin('crm_usuarios', function ($join) {
            $join->on('crm_usuarios.clientid', '=', 'crm_clientes.client_id');
            $join->on('crm_usuarios.account_owner', '=', DB::raw("'yes'"));
        });

        //join: client category
        $clients->leftJoin('crm_categorias', 'crm_categorias.category_id', '=', 'crm_clientes.client_categoryid');

        //join: users reminders - do not do this for cronjobs
        if (auth()->check()) {
            $clients->leftJoin('crm_recordatorios', function ($join) {
                $join->on('crm_recordatorios.reminderresource_id', '=', 'crm_clientes.client_id')
                    ->where('crm_recordatorios.reminderresource_type', '=', 'client')
                    ->where('crm_recordatorios.reminder_userid', '=', auth()->id());
            });
        }

        //default where
        $clients->whereRaw("1 = 1");

        //ignore system client
        $clients->where('client_id', '>', 0);

        //filters: id
        if (request()->filled('filter_client_id')) {
            $clients->where('client_id', request('filter_client_id'));
        }
        if (is_numeric($id)) {
            $clients->where('client_id', $id);
        }

        //filter: status
        if (request()->filled('filter_client_status')) {
            $clients->where('client_status', request('filter_client_status'));
        }

        //filter: created date (start)
        if (request()->filled('filter_date_created_start')) {
            $clients->whereDate('client_created', '>=', request('filter_date_created_start'));
        }

        //filter: created date (end)
        if (request()->filled('filter_date_created_end')) {
            $clients->whereDate('client_created', '<=', request('filter_date_created_end'));
        }

        //filter: contacts
        if (is_array(request('filter_client_contacts')) && !empty(array_filter(request('filter_client_contacts'))) && !empty(array_filter(request('filter_client_contacts')))) {
            $clients->whereHas('users', function ($query) {
                $query->whereIn('id', request('filter_client_contacts'));
            });
        }

        //filter: catagories
        if (is_array(request('filter_client_categoryid')) && !empty(array_filter(request('filter_client_categoryid'))) && !empty(array_filter(request('filter_client_categoryid')))) {
            $clients->whereHas('category', function ($query) {
                $query->whereIn('category_id', request('filter_client_categoryid'));
            });
        }

        //filter: tags
        if (is_array(request('filter_tags')) && !empty(array_filter(request('filter_tags'))) && !empty(array_filter(request('filter_tags')))) {
            $clients->whereHas('tags', function ($query) {
                $query->whereIn('tag_title', request('filter_tags'));
            });
        }

        //custom fields filtering
        if (request('action') == 'search') {
            if ($fields = \App\Models\CustomField::Where('customfields_type', 'clients')->Where('customfields_show_filter_panel', 'yes')->get()) {
                foreach ($fields as $field) {
                    //field name, as posted by the filter panel (e.g. filter_ticket_custom_field_70)
                    $field_name = 'filter_' . $field->customfields_name;
                    if ($field->customfields_name != '' && request()->filled($field_name)) {
                        if (in_array($field->customfields_datatype, ['number', 'decimal', 'dropdown', 'date', 'checkbox'])) {
                            $clients->Where($field->customfields_name, request($field_name));
                        }
                        if (in_array($field->customfields_datatype, ['text', 'paragraph'])) {
                            $clients->Where($field->customfields_name, 'LIKE', '%' . request($field_name) . '%');
                        }
                    }
                }
            }
        }

        //search: various client columns and relationships (where first, then wherehas)
        if (request()->filled('search_query')) {
            $clients->where(function ($query) {
                $query->Where('client_id', '=', request('search_query'));
                $query->orwhere('client_company_name', 'LIKE', '%' . request('search_query') . '%');
                $query->orWhere('client_created', 'LIKE', '%' . request('search_query') . '%');
                $query->orWhere('client_status', '=', request('search_query'));
                $query->orWhereHas('tags', function ($query) {
                    $query->where('tag_title', 'LIKE', '%' . request('search_query') . '%');
                });
                $query->orWhereHas('category', function ($query) {
                    $query->where('category_name', 'LIKE', '%' . request('search_query') . '%');
                });
            });

        }

        //sorting
        if (in_array(request('sortorder'), array('desc', 'asc')) && request('orderby') != '') {
            //direct column name
            if (Schema::hasColumn('crm_clientes', request('orderby'))) {
                $clients->orderBy(request('orderby'), request('sortorder'));
            }
            //others
            switch (request('orderby')) {
                case 'contact':
                    $clients->orderBy('first_name', request('sortorder'));
                    break;
                case 'count_projects':
                    $clients->orderBy('count_projects_all', request('sortorder'));
                    break;
                case 'sum_invoices':
                    $clients->orderBy('sum_invoices_all', request('sortorder'));
                    break;
                case 'category':
                    $clients->orderBy('category_name', request('sortorder'));
                    break;
            }
        } else {
            //default sorting
            $clients->orderBy('client_company_name', 'asc');
        }

        //eager load
        $clients->with([
            'tags',
            'users',
        ]);

        //we are not paginating (e.g. when doing exports)
        if (isset($data['no_pagination']) && $data['no_pagination'] === true) {
            return $clients->get();
        }

        // Get the results and return them.
        return $clients->paginate(config('system.settings_system_pagination_limits'));
    }

    /**
     * Create a new client record [API]
     * @return mixed object|bool  object or process outcome
     */
    public function create($data = [])
    {
        //save new user
        $client = null;
        $clientPc = null;

        $leadConvert = request('convert_lead') ? true : false;

        $defaultClientData = [
            'codigocontable' => '1.1.02.05.01',
            'provinciasid' => '01',
            'ciudadesid' => '0101',
            'parroquiasid' => '010101',
            'clientes_rutasid' => 1,
            'clientes_zonasid' => 1,
            'vendedoresid' => 1,
            'cobradoresid' => 1,
            'sri_contribuyenteespecial' => 0,
            'creditocupo' => 0,
            'sri_tiporegimen' => 0,
            'creditodias' => 0,
            'descuento' => 0,
            'sri_codigo_impuestosrenta' => 0,
            'estado' => 0,
            'entidadbancaria' => 0,
            'sri_relacionado' => 0,
            'sri_tipo_cliente' => 0,
            'sri_llevacontabilidad' => 0,
            'tarifasid' => 0,
            'forma_pago_empresaid' => 0,
            'ordenvisita' => 0,
            'ecommerceid' => 0,
            'sexo' => 'M',
            'estadocivil' => 'S',
            'origeningresos' => 'V',
            'estado_sync' => '0',
        ];

        if ($leadConvert) {
            $leadAux = Lead::where('lead_identification', request('client_identification') ? request('client_identification') : request('identification'))->first();
            $leadPcAux = ClientesPotencialPc::where('identificacion', request('client_identification') ? request('client_identification') : request('identification'))->first();

            $client = Client::create([
                'client_creatorid' => Auth()->user()->id,
                'client_identification' => $leadAux->lead_identification,
                'client_company_name' => $leadAux->lead_company_name,
                'client_description' => $leadAux->description,
                'client_phone' => $leadAux->lead_phone,
                'client_website' => $leadAux->lead_website,
                'client_billing_street' => $leadAux->lead_street,
                'client_billing_city' => $leadAux->lead_city,
                'client_billing_state' => $leadAux->lead_state,
                'client_billing_zip' => $leadAux->lead_zip,
                'client_billing_country' => $leadAux->lead_country,
                'client_categoryid' => (request()->filled('client_categoryid')) ? request('client_categoryid') : 2,
            ]);

            if ($client) {
                $clientPc = ClientesPc::create(array_merge($defaultClientData,  [
                    'razonsocial' => $leadPcAux->razonsocial,
                    'nombrecomercial' => $leadPcAux->nombrecomercial,
                    'direccion' => $leadPcAux->direccion,
                    'identificacion' => $leadPcAux->identificacion,
                    'tipoidentificacion' => $leadPcAux->tipoidentificacion,
                    'email' => $leadPcAux->email,
                    'telefono1' => $leadPcAux->telefono1
                ]));

                if (!$clientPc) {
                    Log::error("record could not be saved - database error", ['process' => '[ClientRepository]', config('app.debug_ref'), 'function' => __FUNCTION__, 'file' => basename(__FILE__), 'line' => __LINE__, 'path' => __FILE__]);
                    return false;
                }

                if (request('delete_lead') == 'on') {
                    $leadAux->delete();
                    $leadPcAux->delete();
                }

            } else {
                Log::error("record could not be saved - database error", ['process' => '[ClientRepository]', config('app.debug_ref'), 'function' => __FUNCTION__, 'file' => basename(__FILE__), 'line' => __LINE__, 'path' => __FILE__]);
                return false;
            }
        } else {
            $findClientPc = ClientesPc::where('identificacion', request('identification'))->first();
            
            $identificationType = 'C';
            if (is_numeric(request('client_identification') ? request('client_identification') : request('identification')))
                $identificationType = (strlen(request('client_identification') ? request('client_identification') : request('identification')) == 10) ? 'C' : 'R';
            else
                $identificationType = 'P';

            /** ----------------------------------------------
             * create the client
            * ----------------------------------------------*/
            if ($findClientPc) {
                $client = Client::create([
                    'client_creatorid' => Auth()->user()->id,
                    'client_identification' => $findClientPc->identificacion,
                    'client_company_name' => $findClientPc->razonsocial,
                    'client_description' => $findClientPc->observacion,
                    'client_phone' => $findClientPc->telefono1,
                    //'client_website' => $findClientPc->lead_website,
                    'client_billing_street' => $findClientPc->direccion,
                    //'client_billing_city' => $findClientPc->lead_city,
                    //'client_billing_state' => $findClientPc->lead_state,
                    //'client_billing_zip' => $findClientPc->lead_zip,
                    //'client_billing_country' => $findClientPc->lead_country,
                    'client_categoryid' => (request()->filled('client_categoryid')) ? request('client_categoryid') : 2,
                ]);

                if (!$client) {
                    Log::error("record could not be saved - database error", ['process' => '[ClientRepository]', config('app.debug_ref'), 'function' => __FUNCTION__, 'file' => basename(__FILE__), 'line' => __LINE__, 'path' => __FILE__]);
                    return false;
                }
            } else {
                $client = Client::create([
                    'client_creatorid' => Auth()->user()->id,
                    'client_identification' => request('client_identification') ? request('client_identification') : request('identification'),
                    'client_company_name' => request('client_company_name') ? request('client_company_name') : request('company_name'),
                    'client_description' => request('client_description') ? request('client_description') : request('description'),
                    'client_phone' => request('client_phone') ? request('client_phone') : request('phone'),
                    'client_website' => request('client_website') ? request('client_website') : request('lead_website'),
                    'client_vat' => request('client_vat') ? request('client_vat') : request('vat'),
                    'client_billing_street' => request('client_billing_street') ? request('client_billing_street') : request('client_billing_street'),
                    'client_billing_city' => request('client_billing_city') ? request('client_billing_city') : request('city'),
                    'client_billing_state' => request('client_billing_state') ? request('client_billing_state') : request('state'),
                    'client_billing_zip' => request('client_billing_zip') ? request('client_billing_zip') : request('zip'),
                    'client_billing_country' => request('client_billing_country') ? request('client_billing_country') : request('country'),
                    'client_categoryid' => (request()->filled('client_categoryid')) ? request('client_categoryid') : 2,
                ]);

                if ($client) {
                    $clientPc = ClientesPc::create(array_merge($defaultClientData,  [
                        'razonsocial' => request('last_name').' '.request('first_name'),
                        'nombrecomercial' => request('client_company_name'),
                        'direccion' => request('client_billing_street').', '.request('client_billing_city').', '.request('client_billing_state').', '.request('client_billing_zip').', '.request('lead_client_billing_countrycountry'),
                        'identificacion' => request('identification'),
                        'tipoidentificacion' => $identificationType,
                        'email' => request('email'),
                        'telefono1' => request('client_phone')
                    ]));
                    
                    if (!$clientPc) {
                        $client->delete();
                        Log::error("record could not be saved - database error", ['process' => '[ClientRepository]', config('app.debug_ref'), 'function' => __FUNCTION__, 'file' => basename(__FILE__), 'line' => __LINE__, 'path' => __FILE__]);
                        return false;
                    }
                } else {
                    Log::error("record could not be saved - database error", ['process' => '[ClientRepository]', config('app.debug_ref'), 'function' => __FUNCTION__, 'file' => basename(__FILE__), 'line' => __LINE__, 'path' => __FILE__]);
                    return false;
                }
            }
        }

        //module settings
        $client->client_app_modules = request('client_app_modules');
        if (request('client_app_modules') == 'custom') {
            if (config('system.settings_modules_projects') == 'enabled') {
                $client->client_settings_modules_projects = (request('client_settings_modules_projects') == 'on') ? 'enabled' : 'disabled';
            }
            if (config('system.settings_modules_invoices') == 'enabled') {
                $client->client_settings_modules_invoices = (request('client_settings_modules_invoices') == 'on') ? 'enabled' : 'disabled';
            }
            if (config('system.settings_modules_payments') == 'enabled') {
                $client->client_settings_modules_payments = (request('client_settings_modules_payments') == 'on') ? 'enabled' : 'disabled';
            }
            if (config('system.settings_modules_knowledgebase') == 'enabled') {
                $client->client_settings_modules_knowledgebase = (request('client_settings_modules_knowledgebase') == 'on') ? 'enabled' : 'disabled';
            }
            if (config('system.settings_modules_estimates') == 'enabled') {
                $client->client_settings_modules_estimates = (request('client_settings_modules_estimates') == 'on') ? 'enabled' : 'disabled';
            }
            if (config('system.settings_modules_subscriptions') == 'enabled') {
                $client->client_settings_modules_subscriptions = (request('client_settings_modules_subscriptions') == 'on') ? 'enabled' : 'disabled';
            }
            if (config('system.settings_modules_tickets') == 'enabled') {
                $client->client_settings_modules_tickets = (request('client_settings_modules_tickets') == 'on') ? 'enabled' : 'disabled';
            }
        }

        //save
        if (!$client->save()) {
            Log::error("record could not be saved - database error", ['process' => '[ClientRepository]', config('app.debug_ref'), 'function' => __FUNCTION__, 'file' => basename(__FILE__), 'line' => __LINE__, 'path' => __FILE__]);
            return false;
        }

        //apply custom fields data
        $this->applyCustomFields($client->client_id);

        /** ----------------------------------------------
         * add client tags
         * ----------------------------------------------*/
        $this->tagrepo->add('client', $client->client_id);

        /** ----------------------------------------------
         * create the default user
         * ----------------------------------------------*/
        request()->merge([
            'account_owner' => 'yes',
            'role_id' => 2,
            'type' => 'client',
            'clientid' => $client->client_id,
        ]);
        $password = str_random(7);
        if (!$user = $this->userrepo->create(bcrypt($password), 'user')) {
            Log::error("default client user could not be added - database error", ['process' => '[ClientRepository]', config('app.debug_ref'), 'function' => __FUNCTION__, 'file' => basename(__FILE__), 'line' => __LINE__, 'path' => __FILE__]);
            abort(409);
        }

        /** ----------------------------------------------
         * send welcome email
         * ----------------------------------------------*/
        if (isset($data['send_email']) && $data['send_email'] == 'yes') {
            $emaildata = [
                'password' => $password,
            ];
            $mail = new \App\Mail\UserWelcome($user, $emaildata);
            $mail->build();
        }

        //return client id
        return (isset($data['return']) && $data['return'] == 'id') ? $client->client_id : $client;
    }

    /**
     * Create a new client
     * @return mixed object|bool client object or failed
     */
    public function signUp()
    {

        //save new user
        $client = new $this->clients;

        //data
        $client->client_company_name = request('client_company_name');
        $client->client_creatorid = 0;

        //save and return id
        if ($client->save()) {
            return $client;
        } else {
            Log::error("record could not be saved - database error", ['process' => '[ClientRepository]', config('app.debug_ref'), 'function' => __FUNCTION__, 'file' => basename(__FILE__), 'line' => __LINE__, 'path' => __FILE__]);
            return false;
        }
    }

    /**
     * update a record
     * @param int $id client id
     * @return mixed int|bool client id or failed
     */
    public function update($id)
    {

        //get the record
        if (!$client = $this->clients->find($id)) {
            Log::error("client record could not be found", ['process' => '[ClientRepository]', config('app.debug_ref'), 'function' => __FUNCTION__, 'file' => basename(__FILE__), 'line' => __LINE__, 'path' => __FILE__, 'client_id' => $id ?? '']);
            return false;
        }

        //get the record clientesPc
        if (!$clientesPc = $this->clientesPc->find($id)) {
            Log::error("client record could not be found", ['process' => '[ClientRepository]', config('app.debug_ref'), 'function' => __FUNCTION__, 'file' => basename(__FILE__), 'line' => __LINE__, 'path' => __FILE__, 'client_id' => $id ?? '']);
            return false;
        }

        //general
        $client->client_company_name = request('client_company_name');
        $client->client_phone = request('client_phone');
        $client->client_website = request('client_website');
        $client->client_vat = request('client_vat');



        //description
        if (auth()->user()->is_team) {
            $client->client_description = request('client_description');
            $client->client_categoryid = request('client_categoryid');
        }

        //billing address
        $client->client_billing_street = request('client_billing_street');
        $client->client_billing_city = request('client_billing_city');
        $client->client_billing_state = request('client_billing_state');
        $client->client_billing_zip = request('client_billing_zip');
        $client->client_billing_country = request('client_billing_country');

        //shipping address
        if (config('system.settings_clients_shipping_address') == 'enabled') {
            $client->client_shipping_street = request('client_shipping_street');
            $client->client_shipping_city = request('client_shipping_city');
            $client->client_shipping_state = request('client_shipping_state');
            $client->client_shipping_zip = request('client_shipping_zip');
            $client->client_shipping_country = request('client_shipping_country');
        }

        //module permissions
        $client->client_app_modules = request('client_app_modules');
        if (auth()->user()->is_team) {
            if (config('system.settings_modules_projects') == 'enabled') {
                $client->client_settings_modules_projects = (request('client_settings_modules_projects') == 'on') ? 'enabled' : 'disabled';
            }
            if (config('system.settings_modules_invoices') == 'enabled') {
                $client->client_settings_modules_invoices = (request('client_settings_modules_invoices') == 'on') ? 'enabled' : 'disabled';
            }
            if (config('system.settings_modules_payments') == 'enabled') {
                $client->client_settings_modules_payments = (request('client_settings_modules_payments') == 'on') ? 'enabled' : 'disabled';
            }
            if (config('system.settings_modules_knowledgebase') == 'enabled') {
                $client->client_settings_modules_knowledgebase = (request('client_settings_modules_knowledgebase') == 'on') ? 'enabled' : 'disabled';
            }
            if (config('system.settings_modules_estimates') == 'enabled') {
                $client->client_settings_modules_estimates = (request('client_settings_modules_estimates') == 'on') ? 'enabled' : 'disabled';
            }
            if (config('system.settings_modules_subscriptions') == 'enabled') {
                $client->client_settings_modules_subscriptions = (request('client_settings_modules_subscriptions') == 'on') ? 'enabled' : 'disabled';
            }
            if (config('system.settings_modules_tickets') == 'enabled') {
                $client->client_settings_modules_tickets = (request('client_settings_modules_tickets') == 'on') ? 'enabled' : 'disabled';
            }
        }

        //status
        if (auth()->user()->is_team) {
            $client->client_status = request('client_status');
        }

        //save
        if ($client->save()) {

            //$clientesPc->clientesid = $client->client_id;
            //$clientesPc->clientescodigo = ('CRM100000');
            $clientesPc->codigocontable = ('1.1.02.05.02');
            $clientesPc->clientes_gruposid = ('1');
            $clientesPc->provinciasid = ('90');
            $clientesPc->ciudadesid = ('0602');
            $clientesPc->razonsocial = ('2');
            $clientesPc->parroquiasid = ('210160');
            $clientesPc->clientes_rutasid = ('1');
            $clientesPc->clientes_zonasid = ('1');
            $clientesPc->nombrecomercial = ('1');
            $clientesPc->direccion = ('1');
            $clientesPc->identificacion = ('1');
            $clientesPc->tipoidentificacion = ('1');
            $clientesPc->tipodestino = ('1');
            $clientesPc->vendedoresid = ('1');
            $clientesPc->cobradoresid = ('1');
            $clientesPc->sri_contribuyenteespecial = ('1');
            $clientesPc->creditocupo = ('1');
            $clientesPc->sri_tiporegimen = ('1');
            $clientesPc->creditodias = ('1');
            $clientesPc->descuento = ('1');
            $clientesPc->sri_codigo_impuestosrenta = ('1');
            $clientesPc->estado = ('1');
            $clientesPc->entidadbancaria = ('1');
            $clientesPc->sri_relacionado = ('1');
            $clientesPc->sri_tipo_cliente = ('1');
            $clientesPc->sri_llevacontabilidad = ('1');
            $clientesPc->tarifasid = ('1');
            $clientesPc->forma_pago_empresaid = ('1');
            $clientesPc->ordenvisita = ('1');
            $clientesPc->ecommerceid = ('1');
            $clientesPc->sexo = ('M');
            $clientesPc->estadocivil = ('S');
            $clientesPc->origeningresos = ('V');
            $clientesPc->estado_sync = ('0');

            $clientesPc->save();

            //apply custom fields data
            if (auth()->user()->is_team) {
                $this->applyCustomFields($client->client_id);
            }

            return $client->client_id;
        } else {
            Log::error("record could not be updated - database error", ['process' => '[ClientRepository]', config('app.debug_ref'), 'function' => __FUNCTION__, 'file' => basename(__FILE__), 'line' => __LINE__, 'path' => __FILE__]);
            return false;
        }
    }

    /**
     * various feeds for ajax auto complete
     * @param string $type (company_name)
     * @param string $searchterm
     * @return object client model object
     */
    public function autocompleteFeed($type = '', $searchterm = '')
    {

        //validation
        if ($type == '' || $searchterm == '') {
            return [];
        }

        //start
        $query = $this->clients->newQuery();

        //ignore system client
        $query->where('client_id', '>', 0);

        //feed: company names
        if ($type == 'company_name') {
            $query->selectRaw('client_company_name AS value, client_id AS id');
            $query->where('client_company_name', 'LIKE', '%' . $searchterm . '%');
        }

        //return
        return $query->get();
    }

    /**
     * update a record
     * @param int $id record id
     * @return bool process outcome
     */
    public function updateLogo($id)
    {

        //get the user
        if (!$client = $this->clients->find($id)) {
            return false;
        }

        //update logo
        $client->client_logo_folder = request('logo_directory');
        $client->client_logo_filename = request('logo_filename');

        //save
        if ($client->save()) {
            return true;
        } else {
            Log::error("record could not be updated - database error", ['process' => '[ClientRepository]', config('app.debug_ref'), 'function' => __FUNCTION__, 'file' => basename(__FILE__), 'line' => __LINE__, 'path' => __FILE__]);
            return false;
        }
    }

    /**
     * update model wit custom fields data (where enabled)
     */
    public function applyCustomFields($id = '')
    {

        //custom fields
        $fields = \App\Models\CustomField::Where('customfields_type', 'clients')->get();
        foreach ($fields as $field) {
            if ($field->customfields_standard_form_status == 'enabled') {
                $field_name = $field->customfields_name;
                \App\Models\Client::where('client_id', $id)
                    ->update([
                        "$field_name" => request($field_name),
                    ]);
            }
        }
    }

}