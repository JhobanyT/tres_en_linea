<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Resultado extends Model
{
    use HasFactory;
    protected $table = 'resultados';
        public $timestamps = false;
        protected $primaryKey = 'id_resultado';
        protected $fillable = ['id_resultado', 'nombre_partida', 'nombre_jugador1', 
        'nombre_jugador2', 'ganador', 'punto', 'estado'];
}
