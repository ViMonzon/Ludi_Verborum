import 'package:flutter/material.dart';

import '../themes/constants.dart';

class CustomCardAdd extends StatelessWidget {
  const CustomCardAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 0,
      fit: FlexFit.loose,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Introduce tu palabra: ",
                style: TextStyle(
                    color: primaryTextColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Avenir',
                    fontSize: 24),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Ingresa tu palabra',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              /*Container(
                child: Text(
                  definicion,
                  style: TextStyle(
                      color: secondaryTextColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Avenir',
                      fontSize: 15),
                  textAlign: TextAlign.left,
                  softWrap: true,
                ),
              ),*/
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  // Agrega aquí la lógica que deseas ejecutar cuando el usuario presione el botón.
                },
                child: Text('Añadir'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 0.0,
                  backgroundColor: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
