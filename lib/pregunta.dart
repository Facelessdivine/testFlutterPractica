import 'package:flutter/material.dart';

class Pregunta extends StatelessWidget {
  final String textoPregunta;
  const Pregunta(this.textoPregunta, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      margin: const EdgeInsets.all(30),
      child:Text(
        textoPregunta,
        style:const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
    ),
    );
  }
}
