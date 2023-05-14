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
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [gradientStartColor, gradientEndColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.1, 0.9])),
          width: size.width * 1,
          height: size.height * 2,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 00.0, horizontal: 50.0),
          child: _botonesRedondeados(context, bloc),
        ),
      ],
    ));
  }

  Widget _botonesRedondeados(BuildContext context, bloc) {
    String nombreJugar = "¡A jugar!";
    String nombreAdd = "Añadir Palabra";
    String nombreDiccionario = "Diccionario";

    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
      defaultColumnWidth: const FixedColumnWidth(300),
      children: [
        TableRow(children: [
          Column(
            children: <Widget>[
              const HeaderWidgetHome(),
            ],
          ),
        ]),
        TableRow(children: [
          SizedBox(height: 30),
        ]),
        TableRow(
          decoration: BoxDecoration(
            color: secondaryTextColor,
            borderRadius: BorderRadius.circular(5.0),
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
              borderRadius: BorderRadius.circular(5.0),
            ),
            children: [
              GestureDetector(
                child: _crearBoton(nombreAdd, context, bloc),
                onTap: () => Navigator.pushNamed(context, 'addPalabra'),
              ),
            ]),
        TableRow(children: [SizedBox(height: 30)]),
        TableRow(
            decoration: BoxDecoration(
              color: secondaryTextColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
            ),
            children: [
              GestureDetector(
                child: _crearBoton(nombreDiccionario, context, bloc),
                onTap: () async {
                  var palabras_dict =
                      await HttpService.dictionary(bloc.email, context);
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
              bloc.dispose();
              Navigator.pushNamed(context, 'login');
            },
          ),
        ]),
      ],
    );
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
}
