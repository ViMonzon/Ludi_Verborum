import 'package:flutter/cupertino.dart';

import '../themes/constants.dart';

Widget crearFondo(BuildContext context) {
  final size = MediaQuery.of(context).size;

  final fondoMoradoNaranja = Container(
    height: size.height * 1,
    width: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[fondoNaranja, fondoMorado])),
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
      Container(
        padding: EdgeInsets.only(top: 100.0),
        /*child: Column(
            children: <Widget>[
              Icon(Icons.book_rounded, color: Colors.white, size: 100.0),
              SizedBox(height: 10.0, width: double.infinity),
              Text('LUDI VERBORUM',
                  style: TextStyle(color: Colors.white, fontSize: 25.0)),
            ],
          ),*/
      )
    ],
  );
}
