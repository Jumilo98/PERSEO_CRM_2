<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Unit extends Model {

    /**
     * @primaryKey string - primry key column.
     * @dateFormat string - date storage format
     * @guarded string - allow mass assignment except specified
     * @CREATED_AT string - creation date column
     * @UPDATED_AT string - updated date column
     */
    
    protected $table = 'crm_unidades';
    protected $primaryKey = 'unit_id';
    protected $dateFormat = 'Y-m-d H:i:s';
    protected $guarded = ['unit_id'];
    const CREATED_AT = 'unit_created';
    const UPDATED_AT = 'unit_update';
}
