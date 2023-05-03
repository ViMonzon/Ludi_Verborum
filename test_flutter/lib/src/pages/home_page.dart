import 'package:flutter/material.dart';
import 'package:test_flutter/src/bloc/provider.dart';
import 'package:test_flutter/src/bloc/login_bloc.dart';

import '../../http.dart';

class HomePage extends StatelessWidget {
  String _label = 'Logout';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.book_rounded),
      ),
      body: Container(
        width: size.width * 1,
        height: size.width * 2,
        margin: EdgeInsets.symmetric(vertical: 50.0),
        padding: EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(child: Text('Hola ${bloc.email}')),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'juego'),
              child: Text('! A jugar!'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 0.0,
                backgroundColor: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'addPalabra'),
              child: Text('Añadir Palabra'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 0.0,
                backgroundColor: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'opcionesJuego'),
              child: Text('Opciones'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 0.0,
                backgroundColor: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed:
                  () /*async {
                Navigator.pushNamed(context, 'login');
              },*/

                  async {
                bool logoutOk = await HttpService.logout();
                if (logoutOk) {
                  Navigator.pushReplacementNamed(context, 'Login');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('No se cerró la sesión')));
                }
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 0.0,
                backgroundColor: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
      //floatingActionButton: _crearBotonJugar(context, bloc),
    );
  }

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
          );
}*/
}
