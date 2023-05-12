import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:test_flutter/src/bloc/provider.dart';

import '../../http.dart';
import '../themes/constants.dart';

class DictionaryPage extends StatefulWidget {
  @override
  _DictionaryPageState createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  List<String> definiciones = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);
    List<String> palabras =
        ModalRoute.of(context)!.settings.arguments as List<String>;

    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [gradientStartColor, gradientEndColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.1, 0.9])),
            child: ListView.builder(
              itemCount: palabras.length,
              itemBuilder: (BuildContext context, int index) {
                String inicial =
                    removeDiacritics(palabras[index][0].toUpperCase());
                return Dismissible(
                  key: ValueKey(palabras[index].toString()),
                  background: Container(
                    color: Colors.redAccent,
                    child: Icon(Icons.delete, color: Colors.white, size: 40),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    HttpService.delete(
                        bloc.email, palabras[index].toString(), context);
                  },
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: primaryTextColor,
                        child: Text(
                          inicial,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Avenir'),
                        ),
                      ),
                      title: Text(
                        palabras[index],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Avenir'),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
    /*appBar: AppBar(
        title: Icon(Icons.book_rounded),
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(lista[index]),
          );
        },*/
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
