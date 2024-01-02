<?php

namespace App\Http\Controllers\PerseoPC;

use App\Http\Controllers\Controller;
use App\Models\Perseo\ClientesPc;
use Illuminate\Http\Request;

class Prueba extends Controller
{
    //
    public function pruebaF (){
        
        $nombre = ClientesPc::all();
        return $nombre;
    }
}
