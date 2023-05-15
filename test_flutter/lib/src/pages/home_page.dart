import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_flutter/src/bloc/provider.dart';
import 'package:test_flutter/src/bloc/login_bloc.dart';
import 'package:test_flutter/src/widgets/header_widget_home.dart';

import '../../http.dart';
import '../themes/constants.dart';
import '../themes/constants.dart';
import '../themes/constants.dart';
import '../widgets/custom_card_add.dart';
import '../widgets/header_widget_add.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);

    return Scaffold(
        body: Stack(
      children: <Widget>[
        _crearFondo(context),
        _botonera(context),
        /*Container(
          padding: EdgeInsets.symmetric(vertical: 00.0, horizontal: 0.0),
          child: _botonesRedondeados(context, bloc),
        ),*/
      ],
    ));
  }

  Widget _crearBoton(String nombre, BuildContext context, bloc) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: nombre,
        style: TextStyle(
            color: primaryTextColor,
            fontSize: 30,
            fontWeight: FontWeight.w900,
            fontFamily: 'Avenir'),
      ),
    );
  }

  Widget _botonera(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    String nombreJugar = "¡A jugar!";
    String nombreAdd = "Añadir Palabra";
    String nombreDiccionario = "Diccionario";

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const HeaderWidgetHome(),
          Container(
            width: size.width * 0.85,
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
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                  defaultColumnWidth: const FixedColumnWidth(300),
                  children: [
                    TableRow(children: [
                      SizedBox(height: 30),
                    ]),
                    TableRow(
                      decoration: BoxDecoration(
                        color: secondaryTextColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      children: [
                        GestureDetector(
                            child: _crearBoton(nombreJugar, context, bloc),
                            onTap: () async {
                              var palabras_juego =
                                  await HttpService.game(bloc.email, context);
                              Navigator.pushNamed(context, 'juego',
                                  arguments: palabras_juego);
                            }),
                      ],
                    ),
                    TableRow(children: [SizedBox(height: 30)]),
                    TableRow(
                        decoration: BoxDecoration(
                          color: secondaryTextColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        children: [
                          GestureDetector(
                            child: _crearBoton(nombreAdd, context, bloc),
                            onTap: () =>
                                Navigator.pushNamed(context, 'addPalabra'),
                          ),
                        ]),
                    TableRow(children: [SizedBox(height: 30)]),
                    TableRow(
                        decoration: BoxDecoration(
                          color: secondaryTextColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        children: [
                          GestureDetector(
                            child:
                                _crearBoton(nombreDiccionario, context, bloc),
                            onTap: () async {
                              var palabras_dict = await HttpService.dictionary(
                                  bloc.email, context);
                              Navigator.pushNamed(context, 'dictionary',
                                  arguments: palabras_dict);
                            },
                          ),
                        ]),
                    TableRow(children: [
                      SizedBox(height: 50),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                        child: _crearBoton("Logout", context, bloc),
                        onTap: () async {
                          bloc.clearLogin();
                          Navigator.pushNamed(context, 'login');
                        },
                      ),
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
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
}
