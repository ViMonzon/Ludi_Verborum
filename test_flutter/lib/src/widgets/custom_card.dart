import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';

import '../themes/constants.dart';

class CustomCard extends StatefulWidget {
  final String definicion;
  final String palabra;
  final VoidCallback eliminarTarjeta;
  final VoidCallback moverSiguiente;
  final VoidCallback sumarAcierto;
  final VoidCallback sumarFallo;

  const CustomCard({
    Key? key,
    required this.palabra,
    required this.definicion,
    required this.eliminarTarjeta,
    required this.moverSiguiente,
    required this.sumarAcierto,
    required this.sumarFallo,
  }) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with SingleTickerProviderStateMixin {
  String _respuesta = '';
  late String _inicial;
  bool _isVisible = true;
  Color _backgroundColor = Colors.white;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _inicial = removeDiacritics(widget.palabra[0].toUpperCase());
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 1.0),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
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
                  onChanged: (value) {
                    setState(() {
                      _respuesta = value;
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Valor de _respuesta: $_respuesta');
                  print('Valor de widget.palabra: ${widget.palabra}');
                  if (removeDiacritics(_respuesta.toLowerCase()) ==
                      removeDiacritics(widget.palabra.toLowerCase())) {
                    setState(() {
                      _backgroundColor =
                          Colors.green; // Actualizamos el color a verde
                    });
                    widget.sumarAcierto;
                  } else {
                    setState(() {
                      _backgroundColor =
                          Colors.red; // Actualizamos el color a rojo
                    });
                    widget.sumarFallo;
                  }
                  setState(() {
                    widget.eliminarTarjeta;
                    _controller.forward().whenComplete(widget.moverSiguiente);
                  });
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
