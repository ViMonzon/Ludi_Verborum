import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:test_flutter/src/bloc/provider.dart';

import '../../http.dart';
import '../themes/constants.dart';

class DictionaryPage extends StatefulWidget {
  final String definicion;

  const DictionaryPage({Key? key, required this.definicion}) : super(key: key);
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
    final bloc = Provider.of(context);
    List<String> palabras =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    List<String> definiciones =
        ModalRoute.of(context)!.settings.arguments as List<String>;

    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Stack(
        children: [
          _crearFondo(context),
          Container(
            child: ListView.builder(
              itemCount: palabras.length,
              itemBuilder: (BuildContext context, int index) {
                String inicial =
                    removeDiacritics(palabras[index][0].toUpperCase());
                return GestureDetector(
                    onTap: () {
                      _mostrarVentanaEmergente(context, palabras[index]);
                    },
                    child: Dismissible(
                      key: ValueKey(palabras[index].toString()),
                      background: Container(
                        color: Colors.redAccent,
                        child:
                            Icon(Icons.delete, color: Colors.white, size: 40),
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
                    ));
              },
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
        )
      ],
    );
  }

  void _mostrarVentanaEmergente(BuildContext context, String palabra) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Definición'),
          content: Text(palabra),
          actions: <Widget>[
            TextButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
