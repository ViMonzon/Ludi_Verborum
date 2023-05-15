import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../http.dart';
import '../bloc/provider.dart';
import '../themes/constants.dart';
import '../widgets/custom_card_add.dart';
import '../widgets/header_widget_add.dart';

class AddPalabra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      body: Stack(children: [
        _crearFondo(
          context,
        ),
        SingleChildScrollView(
          child: Column(children: const <Widget>[
            HeaderWidgetAdd(),
            SizedBox(height: 50.0),
            CustomCardAdd(),
          ]),
        )
      ]),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoMoradoNaranja = Container(
      height: size.height * 2,
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
          padding: EdgeInsets.only(top: 50.0),
        )
      ],
    );
  }
}
