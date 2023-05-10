import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';

import '../themes/constants.dart';

class CustomCard extends StatefulWidget {
  final String definicion;
  final String palabra;

  const CustomCard({Key? key, required this.palabra, required this.definicion})
      : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  String _respuesta = '';
  late String _inicial;
  Color _backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _inicial = removeDiacritics(widget.palabra[0].toUpperCase());
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 0,
      fit: FlexFit.tight,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        color: _backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _inicial,
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
              Container(
                child: Text(
                  widget.definicion,
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
                  print('Valor de _respuesta: $_respuesta');
                  print('Valor de widget.palabra: ${widget.palabra}');
                  if (_respuesta == widget.palabra) {
                    setState(() {
                      _backgroundColor =
                          Colors.green; // Actualizamos el color a verde
                    });
                  } else {
                    setState(() {
                      _backgroundColor =
                          Colors.red; // Actualizamos el color a rojo
                    });
                  }
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
