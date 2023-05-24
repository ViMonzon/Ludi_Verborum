import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_flutter/src/bloc/provider.dart';
import 'package:test_flutter/src/bloc/login_bloc.dart';
import 'package:test_flutter/src/widgets/header_widget_home.dart';
import 'package:test_flutter/src/widgets/crear_fondo.dart';
import '../../http.dart';
import '../themes/constants.dart';
import '../themes/constants.dart';
import '../themes/constants.dart';
import '../widgets/custom_card_add.dart';
import '../widgets/header_widget_add.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        crearFondo(context),
        _botonera(context),
      ],
    ));
  }

  Widget _botonera(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    String nombreJugar = "¡A jugar!";
    String nombreAdd = "Añadir Palabra";
    String nombreDiccionario = "Diccionario";
    String nombreOpciones = "Opciones";

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const HeaderWidgetHome(),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 30.0),
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
                    //<----BOTÓN JUEGO---->
                    TableRow(
                      decoration: BoxDecoration(
                        color: fondoMorado,
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
                    //<----BOTÓN AÑADIR---->
                    TableRow(children: [SizedBox(height: 30)]),
                    TableRow(
                        decoration: BoxDecoration(
                          color: fondoMorado,
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
                    //<----BOTÓN DICCIONARIO---->
                    TableRow(children: [SizedBox(height: 30)]),
                    TableRow(
                        decoration: BoxDecoration(
                          color: fondoMorado,
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
                              Navigator.pushNamed(
                                context,
                                'dictionary',
                                arguments: palabras_dict,
                              );
                            },
                          ),
                        ]),
                    //<----BOTÓN OPCIONES---->
                    TableRow(children: [SizedBox(height: 30)]),
                    TableRow(
                        decoration: BoxDecoration(
                          color: fondoMorado,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        children: [
                          GestureDetector(
                            child: _crearBoton(nombreOpciones, context, bloc),
                            onTap: () async {
                              Navigator.pushNamed(context, 'options');
                            },
                          ),
                        ]),
                    //<----BOTÓN LOGOUT---->
                    TableRow(children: [
                      SizedBox(height: 50),
                    ]),
                    TableRow(
                        decoration: BoxDecoration(
                          color: fondoNaranja.withOpacity(0.5),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        children: [
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

  Widget _crearBoton(String nombre, BuildContext context, bloc) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: nombre,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w900,
            fontFamily: 'Avenir'),
      ),
    );
  }
}
