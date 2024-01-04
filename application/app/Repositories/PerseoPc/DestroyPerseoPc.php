<?php

/** --------------------------------------------------------------------------------
 * This repository class manages all the data absctration for deleting records
 *
 * @package    Grow CRM
 * @author     NextLoop
 *----------------------------------------------------------------------------------*/

namespace App\Repositories\PerseoPc;
use Illuminate\Support\Facades\Storage;
use Log;

class DestroyPerseoPc {

    public function destroyClient($clientesid) {

        //validate client
        if (!is_numeric($clientesid)) {
            Log::error("validation error - invalid params", ['process' => '[destroy][client]', config('app.debug_ref'), 'function' => __function__, 'file' => basename(__FILE__), 'line' => __line__, 'path' => __file__]);
            return false;
        }

        //get client and validate
        if (!$clientesPc = \App\Models\PerseoPc\ClientesPc::Where('clientesid', $clientesid)->first()) {
            Log::error("record could not be found", ['process' => '[destroy][client]', config('app.debug_ref'), 'function' => __function__, 'file' => basename(__FILE__), 'line' => __line__, 'path' => __file__]);
            return false;
        }

        //delete client
        $clientesPc->delete();

        return true;
    }
}