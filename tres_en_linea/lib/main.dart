import 'dart:math';

import 'package:get/get_navigation/get_navigation.dart';
import 'package:tres_en_linea/agregados/Boton.dart';
import 'package:flutter/material.dart';
import 'package:tres_en_linea/agregados/mensaje.dart';
import 'package:get/instance_manager.dart';
import './controllers/controller.dart';
import 'package:tres_en_linea/controller_bindings.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      debugShowCheckedModeBanner: false,
      home: TresEnRayaHome(),
    );
  }
}

class TresEnRayaHome extends StatefulWidget {
  @override
  TresEnRaya createState() => TresEnRaya();
}

class TresEnRaya extends State<TresEnRayaHome> {

  void fetchPosts(){
    
  }

  bool estadoHabilitacion=false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerJ1 = new TextEditingController();
  final TextEditingController _controllerJ2 = new TextEditingController();
  String turno="";
  String ganador="";
  bool clickTurno=false;
  int relleno=0;
  
  final List<String> boxes = ['','','','','','','','','',];

  void accion() {
    setState(() {
      Color: Color.fromARGB(255, 158, 23, 75);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<Controller>();
    final List<String> entries = <String>['${_controller.photoList[0].id_resultado}'];
    final List<String> entries2 = <String>['${_controller.photoList[0].ganador}'];
    final List<String> entries3 = <String>['${_controller.photoList[0].estado}'];
    final List<String> entries4 = <String>['0', '1', '0', '0'];

    color: Color.fromARGB(255, 0, 0, 0);
    List funx=[numClick,numClick, numClick,numClick , numClick,numClick, numClick,numClick , numClick];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tres en Linea',
                style: TextStyle(color: Color.fromARGB(255, 245, 242, 242)),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 4, 31, 63),
        ),
          body: ListView(
            padding: EdgeInsets.all(10),
            
              children: 
                [Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding:  EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children:  <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Jugador 1',
                                labelStyle:
                                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                  final Color color = states.contains(MaterialState.error)
                                      ? Theme.of(context).errorColor
                                      : Color.fromARGB(255, 122, 8, 56);
                                  return TextStyle(color: color, letterSpacing: 1.3);})
                              ),
                              controller: _controllerJ1,
                            ),
                            SizedBox(height: 6),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Jugador 2',
                                labelStyle:
                                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                  final Color color = states.contains(MaterialState.error)
                                      ? Theme.of(context).errorColor
                                      : Color.fromARGB(255, 122, 8, 56);
                                  return TextStyle(color: color, letterSpacing: 1.3);})
                              ),
                              controller: _controllerJ2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () {setState((){
                                  btnIniciar();
                                });}, child: Text("Iniciar"),
                                      style: ElevatedButton.styleFrom(
                                        primary: Color.fromARGB(255, 0, 116, 116),
                                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                        textStyle: TextStyle(
                                        fontSize:20,
                                        fontWeight: FontWeight.bold,)),),
                                ElevatedButton(onPressed: (){setState((){
                                  btnCancelar();
                                });}, child: Text("Cancelar"),
                                      style: ElevatedButton.styleFrom(
                                        primary: Color.fromARGB(255, 167, 17, 62),
                                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                        textStyle: TextStyle(
                                        fontSize:20,
                                        fontWeight: FontWeight.bold)),),
                              ],
                            )
                          ],
                        )
                    ),
                    GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                          crossAxisCount: 3
                      ),
                      children: [
                        ...List.generate(
                          boxes.length,
                              (indexx) => Boton(
                            text: boxes[indexx],
                            index: indexx,
                            buttonenabled: estadoHabilitacion,
                            callback: funx[indexx] as Function,
                          ),
                        ),
                      ],
                      padding: EdgeInsets.all(10),
                      shrinkWrap: true,
                    ),
                    SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Chip(
                            avatar: CircleAvatar(
                              backgroundColor: Colors.grey.shade800,
                              child: const Text('T:'),
                            ),
                            label: Text(turno)),
                        Chip(
                            avatar: CircleAvatar(
                              backgroundColor: Colors.grey.shade800,
                              child: const Text('G:'),
                            ),
                            label: Text(ganador))
                      ],
                    ),
                    SizedBox(height: 2),
                  Text("TABLA DE PUNTAJES", style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Paytone',
                  ),),
                  SizedBox(height: 2),
                  Container(
                    height: 200,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: entries?.length,
                        itemBuilder: (BuildContext context, index) {
                          return SingleChildScrollView(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Card(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ListTile(
                                  title: Text('Partido ${entries[index]}',
                                      style: Theme.of(context).textTheme.headline6),
                                  subtitle: Row(mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Color.fromARGB(255, 255, 213, 234)),
                                        child: Text("Ganador: ${entries2[index]}"),
                                      )
                                    ],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Chip(
                                          avatar: CircleAvatar(
                                            backgroundColor: Colors.grey.shade800,
                                            child: const Text('P:'),
                                          ),
                                          label: Text("${entries4[index]}")),
                                      SizedBox(width: 2,),
                                      Chip(
                                          avatar: CircleAvatar(
                                            backgroundColor: Colors.grey.shade800,
                                            child: const Text('E:'),
                                          ),
                                          label: Text("${entries3[index]}")),
                                    ],
                                  ),
                                )
                              ],
                            )),
                          );
                        }
                    ),
                  )
                  ],
                ),
              ]
          )
      ),
    );
  }


  Form _seccionDeDatos(){
    return Form(
        key: _formKey,
        child: Padding(
            padding:  EdgeInsets.only(left: 0, right: 0),
            child: Column(
              children:  <Widget>[
                SizedBox(height: 6),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Jugador 1:',
                    labelStyle:
                    MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                      final Color color = states.contains(MaterialState.error)
                          ? Theme.of(context).errorColor
                          : Color.fromARGB(255, 122, 8, 56);
                      return TextStyle(color: color, letterSpacing: 1.3);})
                  ),
                  controller: _controllerJ1,
                ),
                SizedBox(height: 6),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Jugador 2:',
                    labelStyle:
                    MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                      final Color color = states.contains(MaterialState.error)
                          ? Theme.of(context).errorColor
                          : Color.fromARGB(255, 122, 8, 56);
                      return TextStyle(color: color, letterSpacing: 1.3);})
                  ),
                  controller: _controllerJ2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {setState((){
                      btnIniciar();
                    });}, child: Text("Iniciar"),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 0, 116, 116),
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            textStyle: TextStyle(
                            fontSize:20,
                            fontWeight: FontWeight.bold,)),),
                    ElevatedButton(onPressed: (){setState((){
                      btnCancelar();
                    });}, child: Text("Cancelar"),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 167, 17, 62),
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            textStyle: TextStyle(
                            fontSize:20,
                            fontWeight: FontWeight.bold)),),
                  ],
                )
              ],
            )
        ));
  }
  void btnIniciar(){
    boxes.replaceRange(0, 9, ["","","","","","","","",""]);
    ganador="";
    estadoHabilitacion=true;
    relleno=0;
    Random rnd = new Random();
    int min = 2, max = 8;
    int r = min + rnd.nextInt(max - min);
    if(r%2==0){
      turno="J1:${_controllerJ1.value.text}-(X)";
    }else{
      turno="J2:${_controllerJ2.value.text}-(O)";
    }
  }
  void btnCancelar(){
    boxes.replaceRange(0, 9, ["","","","","","","","",""]);
    estadoHabilitacion=false;
    turno="";
  }

  void numClick(String text, int index) {
    setState((){
      if(text==""){
        relleno+=1;
      }
      iniciar(index);
      verificarGanador();
      print("Selección: ${index} Valor: ${boxes[index]} Turno:${relleno}");
    });
  }
  void iniciar(int index){
    var parts = turno.split(':');
    if(parts[0].trim()=="J1" && clickTurno==false){
      boxes[index]="X";
      clickTurno=true;
      turno="J2:${_controllerJ2.value.text}-(O)";
    }else{
      boxes[index]="O";
      clickTurno=false;
      turno="J1:${_controllerJ1.value.text}-(X)";
    }
  }
  void verificarGanador() {
    if (boxes[0] == boxes[1] && boxes[0] == boxes[2] && boxes[0] != '') {
      _mostrarMensaje('Ganador', boxes[0]);
      return;
    }

    //Valida si es la segunda fila
    if (boxes[3] == boxes[4] && boxes[3] == boxes[5] && boxes[3] != '') {
      _mostrarMensaje('Ganador', boxes[3]);
      return;
    }

    //Valida si es la tercera fila
    if (boxes[6] == boxes[7] && boxes[6] == boxes[8] && boxes[6] != '') {
      _mostrarMensaje('Ganador', boxes[6]);
      return;
    }

    //Valida si es la primera columna
    if (boxes[0] == boxes[3] && boxes[0] == boxes[6] && boxes[0] != '') {
      _mostrarMensaje('Ganador', boxes[0]);
      return;
    }

    //Valida si es la segunda columna
    if (boxes[1] == boxes[4] && boxes[1] == boxes[7] && boxes[1] != '') {
      _mostrarMensaje('Ganador', boxes[1]);
      return;
    }
    //Valida si es la tercera columna
    if (boxes[2] == boxes[5] && boxes[2] == boxes[8] && boxes[2] != '') {
      _mostrarMensaje('Ganador', boxes[2]);
      return;
    }

    //Valida diagonal 1
    if (boxes[0] == boxes[4] && boxes[0] == boxes[8] && boxes[0] != '') {
      _mostrarMensaje('Ganador', boxes[0]);
      return;
    }
    //Valida diagonal 2
    if (boxes[2] == boxes[4] && boxes[2] == boxes[6] && boxes[2] != '') {
      _mostrarMensaje('Ganador', boxes[2]);
      return;
    }
    else if(relleno==9) {
      estadoHabilitacion=false;
      ganador="Empate";
      turno="Termino";
    }
  }
  
  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        boxes[i] = '';
      }
    });

    relleno = 0;
  }

  void _mostrarMensaje(String title, String winner) {
    mostrarMensaje(
        context: context,
        title: title,
        message: winner == ''
            ? 'La partida fue empate'
            : 'El ganador es ${winner.toUpperCase()}',
        buttonText: 'Aceptar',
        onPressed: () {
          clearBoard();
          Navigator.of(context).pop();
        });

    // if (winner == 'o') {
    //   scoreO++;
    // } else if (winner == 'x') {
    //   scoreX++;
    // }
  }
}