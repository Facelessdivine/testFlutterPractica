import 'package:flutter/material.dart';

class Respuesta extends StatelessWidget {
  final VoidCallback selectHandler;
  final String textoRespuesta;
  final Color color;
  const Respuesta(this.selectHandler, this.textoRespuesta, this.color,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        //color: Colors.blue,
        style: ButtonStyle(
          backgroundColor:
              //different colors for each button
              MaterialStateProperty.all(color),
        ),
        onPressed: selectHandler,
        child: Text(textoRespuesta),
      ),
    );
  }
}
