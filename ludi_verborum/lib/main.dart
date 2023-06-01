//@dart=2.9

import 'package:flutter/material.dart';
import 'package:ludi_verborum/src/bloc/provider.dart';
import 'package:ludi_verborum/src/pages/dictionary.dart';
import 'package:ludi_verborum/src/pages/home_page.dart';
import 'package:ludi_verborum/src/pages/login_page.dart';
import 'package:ludi_verborum/src/pages/game_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ludi_verborum/src/pages/option_page.dart';
import 'package:ludi_verborum/src/pages/splash.dart';

import 'src/pages/add_palabra.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ludi Verborum',
        initialRoute: 'splash',
        routes: {
          'splash': (BuildContext context) => const SplashPage(),
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'juego': (BuildContext context) => GamePage(),
          'addPalabra': (BuildContext context) => AddPalabra(),
          'options': (BuildContext context) => OptionsPage(),
          'dictionary': (BuildContext context) => DictionaryPage(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        ),
        builder: EasyLoading.init(),
      ),
    );
  }
}
