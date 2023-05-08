import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../http.dart';
import '../bloc/provider.dart';

class addPalabra extends StatefulWidget {
  @override
  _AddPalabraState createState() => _AddPalabraState();
}

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
}
