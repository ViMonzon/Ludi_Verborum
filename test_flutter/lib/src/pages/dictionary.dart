import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:test_flutter/src/bloc/provider.dart';

import '../../http.dart';
import '../themes/constants.dart';
import '../widgets/crear_fondo.dart';

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
          crearFondo(context),
          Container(
            child: ListView.builder(
              itemCount: palabras.length,
              itemBuilder: (BuildContext context, int index) {
                String inicial =
                    removeDiacritics(palabras[index][0].toUpperCase());
                return GestureDetector(
                    onTap: () async {
                      print(palabras[index]);
                      var definiciones = await HttpService.get_def(
                          bloc.email, palabras[index], context);
                      _mostrarVentanaEmergente(
                          context, palabras[index], definiciones);
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

  void _mostrarVentanaEmergente(
      BuildContext context, String word, List<String> definiciones) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(word),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              //Ajustar automáticamente la altura del ListView
              shrinkWrap: true,
              itemCount: definiciones.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(definiciones[index]),
                );
              },
            ),
          ),
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
