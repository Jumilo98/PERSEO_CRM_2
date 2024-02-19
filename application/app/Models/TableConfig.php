<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TableConfig extends Model {

    /**
     * @primaryKey string - primry key column.
     * @dateFormat string - date storage format
     * @guarded string - allow mass assignment except specified
     * @CREATED_AT string - creation date column
     * @UPDATED_AT string - updated date column
     */
    
    protected $table = 'crm_tabladeconfig';
    protected $primaryKey = 'tableconfig_id';
    protected $dateFormat = 'Y-m-d H:i:s';
    protected $guarded = ['tableconfig_id'];
    const CREATED_AT = 'tableconfig_created';
    const UPDATED_AT = 'tableconfig_updated';

}
