<?php

namespace App\Models\Perseo;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClientesPc extends Model
{
    use HasFactory;

    protected $table = 'clientes';
    protected $primaryKey = 'clientesid';
}
