import 'package:flutter/material.dart';

import '../themes/constants.dart';

import '../widgets/crear_fondo.dart';
import '../widgets/header_widget_score.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart' as VectorIcons;

class ScorePage extends StatelessWidget {
  final int aciertos;
  final int fallos;

  const ScorePage({
    Key? key,
    required this.aciertos,
    required this.fallos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        crearFondo(context),
        Column(children: <Widget>[
          const HeaderWidgetScore(),
          SizedBox(height: 25.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.85,
                margin: EdgeInsets.symmetric(vertical: 30.0),
                padding: EdgeInsets.symmetric(vertical: 50.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 3.0,
                          offset: Offset(0.0, 5.0),
                          spreadRadius: 3.0)
                    ]),
                child: Column(
                  children: <Widget>[
                    Icon(VectorIcons.MaterialCommunityIcons.brain,
                        color: fondoMorado, size: 30),
                    Text(
                      'Aciertos: $aciertos',
                      style: TextStyle(
                          color: primaryTextColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Avenir',
                          fontSize: 28),
                    ),
                    SizedBox(height: 16),
                    Icon(VectorIcons.MaterialCommunityIcons.book_open,
                        color: fondoNaranja, size: 30),
                    Text(
                      'Fallos: $fallos',
                      style: TextStyle(
                          color: primaryTextColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Avenir',
                          fontSize: 28),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              _botonMenu(context),
            ],
          ),
        ]),
      ]),
    );
  }
}

Widget _botonMenu(context) {
  return ElevatedButton(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: Text(
        'Volver al menú',
        style: TextStyle(
          fontFamily: 'Avenir',
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 5.0,
      minimumSize: Size(0, 0),
      padding: EdgeInsets.zero,
      backgroundColor: Colors.deepPurple,
    ),
    onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
  );
}

/*Widget _crearFondo(BuildContext context) {
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
      Container(
        padding: EdgeInsets.only(top: 100.0),
      )
    ],
  );
}*/
