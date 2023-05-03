//@dart=2.9

import 'package:flutter/material.dart';
import 'package:test_flutter/src/bloc/provider.dart';
import 'package:test_flutter/src/pages/dictionary.dart';
import 'package:test_flutter/src/pages/home_page.dart';
import 'package:test_flutter/src/pages/login_page.dart';
import 'package:test_flutter/src/pages/game_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'src/pages/add_palabra.dart';
import 'src/pages/opciones.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ludi Verborum',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'juego': (BuildContext context) => GamePage(),
          'addPalabra': (BuildContext context) => addPalabra(),
          'opcionesJuego': (BuildContext context) => opcionesJuego(),
          //'dictionary': (BuildContext context) => DictionaryPage(),
        },
        theme: ThemeData(primaryColor: Colors.deepPurple),
        builder: EasyLoading.init(),
      ),
    );
  }
}
