import 'package:flutter/material.dart';
import 'package:ludi_verborum/src/utils/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ludi_verborum/src/model/settings.dart';
import '../bloc/provider.dart';
import '../themes/constants.dart';

String username = '';

class HeaderWidgetHome extends StatelessWidget {
  const HeaderWidgetHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    final preferencesService = PreferencesService();

    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        FutureBuilder<Settings>(
          future: preferencesService
              .getSettings(bloc.email), // Obtén la configuración del usuario
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Muestra un indicador de carga mientras se obtienen los datos
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final username = snapshot.data?.username ?? '';
              final email = bloc.email;
              final displayText = username.isNotEmpty ? username : email;
              final display = ', $displayText'; // Obtén el nombre de usuario

              return Text(
                "¡HOLA$display!", // Muestra el nombre de usuario
                style: TextStyle(
                  color: titleTextColor,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Avenir',
                ),
                textAlign: TextAlign.left,
              );
            }
          },
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Container(
                /*child: Text(
                bloc.email, // Muestra el email del usuario
                style: TextStyle(
                  color: primaryTextColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Avenir',
                  fontSize: 28,
                ),
              ),*/
                )
          ],
        ),
      ]),
    );

    /*return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "¡HOLA!",
          /*username,*/
          style: TextStyle(
              color: titleTextColor,
              fontSize: 40,
              fontWeight: FontWeight.w900,
              fontFamily: 'Avenir'),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            Container(
              child: Text(
                "usermail" /*bloc.email*/,
                style: TextStyle(
                    color: primaryTextColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Avenir',
                    fontSize: 28),
              ),
            )
          ],
        ),
      ]),
    );*/
  }
}
