import 'package:flutter/material.dart';

import '../themes/constants.dart';

class CustomCard extends StatelessWidget {
  final String definicion;
  final String inicial;

  const CustomCard({Key? key, required this.inicial, required this.definicion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                inicial,
                style: TextStyle(
                    color: primaryTextColor,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Avenir',
                    fontSize: 50),
                textAlign: TextAlign.left,
              ),
              Text(
                "Definicion",
                style: TextStyle(
                    color: primaryTextColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Avenir',
                    fontSize: 28),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Ingresa tu respuesta',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Agrega aquí la lógica que deseas ejecutar cuando el usuario presione el botón.
                },
                child: Text('Enviar'),
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
