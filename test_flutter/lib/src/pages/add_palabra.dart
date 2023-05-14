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
      resizeToAvoidBottomInset: false,
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.1, 0.9])),
        child: Container(
          child: Column(children: <Widget>[
            const HeaderWidgetAdd(),
            const SizedBox(
              height: 50,
            ),
            CustomCardAdd(),
          ]),
        ),
      ),
    );
  }
}
/*
class _AddPalabraState extends State<addPalabra> {
  final _palabraController = TextEditingController();

  @override
  void dispose() {
    _palabraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.book_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hola ${bloc.email}'),
            SizedBox(height: 16),
            Text('Añade tu palabra'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Introduce tu palabra',
              ),
              controller: _palabraController,
            ),
            SizedBox(height: 16),
            /*ElevatedButton(
              onPressed: () async {
                final palabra = _palabraController.text; // <-- agregado
                EasyLoading.show();
                await HttpService.add(bloc.email, palabra, context);
                EasyLoading.dismiss();
              },
              child: Text('Añadir palabra'),
            ),*/
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Introduce un texto corto',
              ),
            ),
            SizedBox(height: 16),
            Visibility(
              /*visible: /* Aquí pones la condición */,*/
              child: Text('Texto que aparece bajo ciertas condiciones'),
            ),
          ],
        ),
      ),
    );
  }
}*/
