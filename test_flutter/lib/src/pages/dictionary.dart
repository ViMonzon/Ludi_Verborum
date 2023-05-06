import 'package:flutter/material.dart';
import 'package:test_flutter/src/bloc/provider.dart';

import '../../http.dart';

class DictionaryPage extends StatelessWidget {
  final List<String> lista = [
    'almendra',
    'alondra',
    'barco',
    'casa',
    'dedo',
    'elefante',
    'flor',
    'gato',
    'helado',
    'iglesia',
    'jardín',
    'luna',
    'manzana',
    'nube',
    'ojo',
    'perro',
    'queso',
    'ratón',
    'sol',
    'tigre',
    'uva',
    'vaca',
    'zapato',
    'árbol',
    'boca',
    'carro',
    'diente',
    'escalera',
    'fuego',
    'guitarra',
    'hueso',
    'isla',
    'juego',
    'león',
    'mariposa',
    'nido',
    'oso',
    'pájaro',
    'quesadilla',
    'rana',
    'silla',
    'tren',
    'unicornio',
    'vino',
    'zapatilla'
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.book_rounded),
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(lista[index]),
          );
        },
      ),
    );
  }

  /*Widget _botonDictionary(LoginBloc bloc) {
    return StreamBuilder(
      /*stream: bloc.formValidStream,*/
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Diccionario'),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              elevation: 0.0,
              backgroundColor: Colors.deepPurple,
            ),
            onPressed: () async {
              await HttpService.dictionary(bloc.email, context);
            });
      },
    );
  }*/
}
