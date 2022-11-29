import 'package:flutter/material.dart';

class Respuesta extends StatelessWidget {
  static getResultados(){
    return _resultados;
  }
  static set resultados (String value){
     _resultados.add(value);
  }
  static final List<String> _resultados = [];
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
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(color),
        ),
        onPressed: () {
          selectHandler();
          Respuesta.resultados = textoRespuesta;
        },
        child: Text(textoRespuesta),
      ),
    );
  }
}
