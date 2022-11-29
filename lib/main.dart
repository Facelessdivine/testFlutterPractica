import 'dart:math';

import 'package:flutter/material.dart';
import './pregunta.dart';
import './respuesta.dart';

//void main() {
//  runApp(MiPrueba());
//}
void main() => runApp(const MiPrueba());

class MiPrueba extends StatefulWidget {
  const MiPrueba({super.key});
//put navigator

  @override
  State<StatefulWidget> createState() {
    return _MiPruebaState();
  }
}

class _MiPruebaState extends State<MiPrueba> {
  var _preguntaIndex = 0;
  var _randomIndex = -1;

  void _respuestaPregunta() {
    setState(() {
      _preguntaIndex = _preguntaIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    //array with colors
    const List<Color> colores = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.purple,
      Colors.yellow,
      Colors.orange,
      Colors.pink,
      Colors.teal,
      Colors.indigo,
      Colors.brown,
      Colors.cyan,
      Colors.lime,
      Colors.amber,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.lightBlue,
      Colors.lightGreen,
      Colors.limeAccent,
      Colors.pinkAccent,
      Colors.tealAccent,
    ];

    var preguntas = [
      {
        'textoPregunta': '¿Cual es su color favorito?',
        'respuestas': ['Azul', 'Rojo', 'Verde', 'Morado'],
      },
      {
        'textoPregunta': '¿Cual es su mascota favorita?',
        'respuestas': ['Gato', 'Perro', 'Loro'],
      },
      {
        'textoPregunta': '¿Cual es su equipo favorito?',
        'respuestas': ['Francia', 'España', 'Brasil', 'Japon'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aplicacion Prueba'),
        ),
        body: Column(
          children: [
            if (_preguntaIndex < preguntas.length)
              Pregunta(preguntas[_preguntaIndex]['textoPregunta'] as String),
            if (_preguntaIndex < preguntas.length)
              ...(preguntas[_preguntaIndex]['respuestas'] as List<String>)
                  .map((respuesta) {
                if (_preguntaIndex == 0) {
                  _randomIndex++;
                      
                } else {
                  _randomIndex = Random().nextInt(colores.length);
                }
                return Respuesta(
                    _respuestaPregunta, respuesta, colores[_randomIndex]);
              }).toList(),
            if (_preguntaIndex >= preguntas.length)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(30),
                child: const Text(
                  'No hay mas preguntas',
                  style: TextStyle(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
