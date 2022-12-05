class ResultadoModel {
  final String? nombre_partida, nombre_jugador1, nombre_jugador2, ganador, estado;
  final int? id_resultado, punto;

  ResultadoModel({
    required this.id_resultado,
    required this.nombre_partida,
    required this.nombre_jugador1,
    required this.nombre_jugador2,
    required this.ganador,
    required this.punto,
    required this.estado,
  });

  factory ResultadoModel.fromJson(Map<String, dynamic> json) {
    return ResultadoModel(
      id_resultado: json['id_resultado'],
      nombre_partida: json['nombre_partida'],
      nombre_jugador1: json['nombre_jugador1'],
      nombre_jugador2: json['nombre_jugador2'],
      ganador: json['ganador'],
      punto: json['punto'],
      estado: json['estado'],
    );
  }
}
