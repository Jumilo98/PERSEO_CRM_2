<?php

namespace App\Models\PerseoPc;

use Illuminate\Database\Eloquent\Model;

class ClientesPc extends Model {

    /**
     * @primaryKey string - primry key column.
     * @dateFormat string - date storage format
     * @guarded string - allow mass assignment except specified
     * @CREATED_AT string - creation date column
     * @UPDATED_AT string - updated date column
     */
    protected $table = 'clientes';
    protected $primaryKey = 'clientesid';
    protected $dateFormat = 'Y-m-d H:i:s';
    protected $guarded = ['clientesid'];
    const CREATED_AT = 'fechacreacion';
    const UPDATED_AT = 'fechamodificacion';

    protected $incrementig = false;

    public static function boot() {
        parent::boot();
        
        static::creating(function ($client) {
          $lastClient = ClientesPc::orderBy('clientescodigo', 'desc')->first();
          $lastNum = substr($lastClient->clientescodigo, 3);
          $newNum = str_pad($lastNum + 1, 7, 0, STR_PAD_LEFT); 
          $client->clientescodigo = 'CRM' . $newNum;
        });
      }
}
