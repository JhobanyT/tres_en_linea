import 'dart:convert';

import 'package:tres_en_linea/models/partida_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  var photoList = <ResultadoModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPartidaData();
  }

  Future<void> fetchPartidaData() async {
    final response = await http
        .get(Uri.parse('http://192.168.1.28:8000/api/resultado'));

    if (response.statusCode == 200) {
      ResultadoModel _resultadoModel = ResultadoModel.fromJson(jsonDecode(response.body));

      photoList.add(
        ResultadoModel(
          id_resultado: _resultadoModel.id_resultado,
          nombre_partida: _resultadoModel.nombre_partida,
          nombre_jugador1: _resultadoModel.nombre_jugador1,
          nombre_jugador2: _resultadoModel.nombre_jugador2,
          ganador: _resultadoModel.ganador,
          punto: _resultadoModel.punto,
          estado: _resultadoModel.estado,
        ),
      );

      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
