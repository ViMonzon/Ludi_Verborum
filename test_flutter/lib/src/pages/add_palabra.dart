import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../http.dart';
import '../bloc/provider.dart';
import '../themes/constants.dart';
import '../widgets/crear_fondo.dart';
import '../widgets/custom_card_add.dart';
import '../widgets/header_widget_add.dart';

class AddPalabra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      body: Stack(children: [
        crearFondo(
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
}
