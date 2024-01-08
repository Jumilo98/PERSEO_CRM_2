<?php

namespace App\Models\PerseoPc;

use Illuminate\Database\Eloquent\Model;

class ClientesPotencialPc extends Model {

    /**
     * @primaryKey string - primry key column.
     * @dateFormat string - date storage format
     * @guarded string - allow mass assignment except specified
     * @CREATED_AT string - creation date column
     * @UPDATED_AT string - updated date column
     */
    protected $table = 'clientes_prospectos';
    protected $primaryKey = 'clientes_prospectosid';
    protected $dateFormat = 'Y-m-d H:i:s';
    protected $guarded = ['clientes_prospectosid'];
    const CREATED_AT = 'fechacreacion';
    const UPDATED_AT = 'fechamodificacion';

    protected $incrementig = false;

    public static function boot() {
      parent::boot();

      static::creating(function ($lead) {
       $lastLead = ClientesPotencialPc::orderBy('clientes_prospectosid', 'desc')->first();
       if (!$lastLead) {
          $lead->clientes_prospectosid = 1;
        return;
       }
       $lead->clientes_prospectosid = $lastLead->clientes_prospectosid + 1;
     });
     
    }
}
