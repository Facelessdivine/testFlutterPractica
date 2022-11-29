import 'dart:math';
import 'package:flutter/material.dart';
import './pregunta.dart';
import './respuesta.dart';
import 'resultadoencuesta.dart';

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
  //create list of strings

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
        'textoPregunta': '¿Cuál es tu color favorito?',
        'respuestas': ['Azul', 'Rojo', 'Verde', 'Morado', 'Amarillo'],
      },
      {
        'textoPregunta': '¿Cuál es tu mascota favorita?',
        'respuestas': ['Gato', 'Perro', 'Loro'],
      },
      {
        'textoPregunta': '¿Cuál es tu equipo favorito?',
        'respuestas': ['Francia', 'España', 'Brasil', 'Japon'],
      },
      {
        'textoPregunta': '¿Eres mayor de edad?',
        'respuestas': ['Sí', 'No'],
      },
      {
        'textoPregunta': '¿Cuál es tu carrera favorita?',
        'respuestas': [
          'Tecnologías de la información',
          'Mecatrónica',
          'Desarrollo de Negocios',
          'Quiero darme de baja',
        ],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aplicacion Prueba'),
        ),
        body: Column(
          children: [
            if (_preguntaIndex < preguntas.length) ...[
              Pregunta(preguntas[_preguntaIndex]['textoPregunta'] as String),
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
            ] else
              ResultadoEncuesta(Respuesta.getResultados(), preguntas),
          ],
        ),
      ),
    );
  }
}
