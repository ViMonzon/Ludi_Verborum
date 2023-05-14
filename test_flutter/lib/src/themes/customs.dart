import 'package:flutter/cupertino.dart';

Widget crearFondo(BuildContext context) {
  final size = MediaQuery.of(context).size;

  final fondoMoradoNaranja = Container(
    height: size.height * 1,
    width: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
      Color.fromRGBO(237, 128, 50, 0.846),
      Color.fromRGBO(90, 70, 178, 1.0)
    ])),
  );

  final circulo = Container(
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.1)),
  );

  return Stack(
    children: <Widget>[
      fondoMoradoNaranja,
      Positioned(top: 40.0, left: 10.0, child: circulo),
      Positioned(top: -40.0, right: -30.0, child: circulo),
      Positioned(bottom: -50.0, right: -10.0, child: circulo),
      Positioned(top: 100.0, left: 210.0, child: circulo),
      Positioned(bottom: -50.0, left: 10.0, child: circulo),
    ],
  );
}
