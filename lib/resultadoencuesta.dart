import 'package:flutter/material.dart';
import './pregunta.dart';

class ResultadoEncuesta extends StatelessWidget {
  final List<String> respuestas;
  final List preguntas;
  const ResultadoEncuesta(this.respuestas, this.preguntas, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Text(
            'Resultados de la encuesta',
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ...preguntas.asMap().entries.map((e) {
            String field = e.value['textoPregunta'] as String;
            return Column(
              children: [
                Pregunta(field),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  respuestas[e.key],
                  style: const TextStyle(fontSize: 20, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
