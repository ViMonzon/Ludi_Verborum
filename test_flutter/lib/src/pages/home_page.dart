import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_flutter/src/bloc/provider.dart';
import 'package:test_flutter/src/bloc/login_bloc.dart';

import '../../http.dart';
import '../themes/constants.dart';
import '../themes/constants.dart';
import '../widgets/custom_card_add.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Hola' /*${bloc.email}'*/,
            /*Esto es lo que da error del valuestream*/
            style: TextStyle(
                color: titleTextColor,
                fontSize: 24,
                fontWeight: FontWeight.w400,
                fontFamily: 'Avenir'),
            textAlign: TextAlign.left,
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [gradientStartColor, gradientEndColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.1, 0.9])),
              width: size.width * 1,
              height: size.height * 2,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 200.0, horizontal: 50.0),
              child: _botonesRedondeados(context, bloc),
            ),
          ],

          /*margin: EdgeInsets.symmetric(vertical: 100.0),
          padding: EdgeInsets.symmetric(vertical: 100.0),*/
        ));

    /*String _label = 'Logout';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);

    return Scaffold(
      /*appBar: AppBar(
        title: Icon(Icons.book_rounded),
      ),*/
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
          Color.fromRGBO(237, 128, 50, 0.846),
          Color.fromRGBO(90, 70, 178, 1.0)
        ])),
        width: size.width * 1,
        /*height: size.height * 2,*/
        /*margin: EdgeInsets.symmetric(vertical: 50.0),*/
        padding: EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                child: Text(
              'Hola ${bloc.email}',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Avenir',
                  fontSize: 28),
            )),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () async {
                var palabras_juego =
                    await HttpService.game(bloc.email, context);
                Navigator.pushNamed(context, 'juego',
                    arguments: palabras_juego);
              },
              child: Text(
                '¡A jugar!',
                style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Avenir'),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 0.0,
                backgroundColor: secondaryTextColor,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'addPalabra'),
              child: Text(
                'Añadir Palabra',
                style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Avenir'),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 0.0,
                backgroundColor: secondaryTextColor,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await HttpService.dictionary(bloc.email, context);
              },
              child: Text(
                'Diccionario',
                style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Avenir'),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 0.0,
                backgroundColor: secondaryTextColor,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                bool logoutOk = await HttpService.logout();
                if (logoutOk) {
                  Navigator.pushReplacementNamed(context, 'Login');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('No se cerró la sesión')));
                }
              },
              child: Text(
                'Logout',
                style: TextStyle(
                    color: primaryTextColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Avenir',
                    fontSize: 28),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 0.0,
                backgroundColor: secondaryTextColor,
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      //floatingActionButton: _crearBotonJugar(context, bloc),
    );
  }*/

    /*_crearBotonJugar(BuildContext context, bloc) {
    return ElevatedButton(
      /*onPressed: () => () async {
        await HttpService.dictionary(bloc.email, context);
      },*/
      onPressed: () {},
      child: Text('!A jugar!'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
    );
  }*/

/*_crearBotonAñadir(BuildContext context){
  return FloatingActionButton(
    onPressed:()=> Navigator.pushNamed(context, 'añadir'),
    child: Text('Añadir Palabra') );
}

_crearBotonOpciones(BuildContext context){
  return FloatingActionButton(
    onPressed:()=> Navigator.pushNamed(context, 'opciones'),
    child: Text('Opciones'));
}

_crearLabelLogout(BuildContext context){
  return InkWell(
            onTap: () {
              // Lógica del label interactivo
            },
            child: Text(_label,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
   
          );*/
  }

  Widget _botonesRedondeados(BuildContext context, bloc) {
    return Table(
      children: [
        TableRow(children: [
          GestureDetector(
              child: _crearBotonJugar(context, bloc),
              onTap: () async {
                var palabras_juego =
                    await HttpService.game(bloc.email, context);
                Navigator.pushNamed(context, 'juego',
                    arguments: palabras_juego);
              }),
        ]),
        TableRow(children: [
          GestureDetector(
            child: _crearBotonAdd(context, bloc),
            onTap: () => Navigator.pushNamed(context, 'addPalabra'),
          ),
        ]),
        TableRow(children: [
          GestureDetector(
            child: _crearBotonDiccionario(context, bloc),
            onTap: () async {
              await HttpService.dictionary(bloc.email, context);
            },
          ),
        ]),
        TableRow(children: [
          GestureDetector(
            child: _crearLabelLogout(context),
            onTap: () async {
              bool logoutOk = await HttpService.logout();
              if (logoutOk) {
                Navigator.pushReplacementNamed(context, 'Login');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('No se cerró la sesión')));
              }
            },
          ),
        ]),
      ],
    );
  }

  Widget _crearBotonJugar(BuildContext context, bloc) {
    return ElevatedButton(
      onPressed: () async {
        var palabras_juego = await HttpService.game(bloc.email, context);
        Navigator.pushNamed(context, 'juego', arguments: palabras_juego);
      },
      child: Text(
        '¡A jugar!',
        style: TextStyle(
            color: primaryTextColor,
            fontSize: 30,
            fontWeight: FontWeight.w900,
            fontFamily: 'Avenir'),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0.0,
        backgroundColor: secondaryTextColor,
      ),
    );
  }

  Widget _crearBotonAdd(BuildContext context, bloc) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, 'addPalabra'),
      child: Text(
        'Añadir Palabra',
        style: TextStyle(
            color: primaryTextColor,
            fontSize: 30,
            fontWeight: FontWeight.w900,
            fontFamily: 'Avenir'),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0.0,
        backgroundColor: secondaryTextColor,
      ),
    );
  }

  Widget _crearBotonDiccionario(BuildContext context, bloc) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);

    return ElevatedButton(
      onPressed: () async {
        await HttpService.dictionary(bloc.email, context);
      },
      child: Text(
        'Diccionario',
        style: TextStyle(
            color: primaryTextColor,
            fontSize: 30,
            fontWeight: FontWeight.w900,
            fontFamily: 'Avenir'),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0.0,
        backgroundColor: secondaryTextColor,
      ),
    );
  }

  Widget _crearLabelLogout(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        bool logoutOk = await HttpService.logout();
        if (logoutOk) {
          Navigator.pushReplacementNamed(context, 'Login');
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('No se cerró la sesión')));
        }
      },
      child: Text(
        'Logout',
        style: TextStyle(
            color: primaryTextColor,
            fontWeight: FontWeight.w400,
            fontFamily: 'Avenir',
            fontSize: 28),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0.0,
        backgroundColor: secondaryTextColor,
      ),
    );
  }
}
