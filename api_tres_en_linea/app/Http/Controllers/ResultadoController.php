<?php

namespace App\Http\Controllers;
use App\Models\Resultado;
use Illuminate\Http\Request;

class ResultadoController extends Controller
{
    public function __construct() {
        $this->middleware('api');
        }
    public function index(Request $request){
        return response()->json(['success' => true,
        'data' => Resultado::all(),
        'message' => 'Lista de Resultados'], 200);
        }

    public function store(Request $request){
        $input = $request->all();
        Resultado::create($input);
        return response()->json(['success' => true,
        'data' => Resultado::all(),
        'message' => 'Lista de Resultados store'], 200);
    }

    public function update(Request $request, Resultado $resultado){
        $input = $request->all();
        $resultado->nombre_partida = $input['nombre_partida'];
        $resultado->nombre_jugador1 = $input['nombre_jugador1'];
        $resultado->nombre_jugador2 = $input['nombre_jugador2'];
        $resultado->ganador = $input['ganador'];
        $resultado->punto = $input['punto'];
        $resultado->estado = $input['estado'];
        $resultado->save();
        return response()->json(['success' => true,
        'data' => Resultado::all(),
        'message' => 'Lista de resultados'], 200);
        }   

        public function destroy(Resultado $resultado){
            $resultado->delete();
            return response()->json(['success' => true,
            'data' => Resultado::all(),
            'message' => 'Lista de resultados'], 200);
            } 

    //Manejo de Error
    public function sendError($error, $errorMessages = [], $code = 404){
        $response = [
        'success' => false,
        'message' => $error,
        ];
        if(!empty($errorMessages)){
        $response['data'] = $errorMessages;
        }
        return response()->json($response, $code);
        } 
}
