import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../themes/constants.dart';

class GamePage extends StatelessWidget {
  String _inputText = '';
  bool _showLabel = false;

  void _onSendButtonPressed() {
    // Lógica para enviar la información ingresada en _inputText
    // aquí
  }

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      'https://picsum.photos/300/400?random=1',
      'https://picsum.photos/300/400?random=2',
      'https://picsum.photos/300/400?random=3',
      'https://picsum.photos/300/400?random=4',
      'https://picsum.photos/300/400?random=5',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Ludi Verborum'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 400.0, // Altura del Swiper
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 200,
                      height: 200,
                    );
                  },
                  itemCount: imageUrls.length, // Cantidad de tarjetas
                  itemWidth: 200.0,
                  itemHeight: 200.0,
                  layout: SwiperLayout.DEFAULT,
                  loop: true,
                  duration: 125000,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Definición',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Introduce la solución',
                ),
                onChanged: (text) {
                  /*setState(() {
                    _inputText = text;
                  });*/
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _onSendButtonPressed,
                child: Text('Enviar palabra'),
              ),
              SizedBox(height: 16.0),
              if (_showLabel) // Muestra el label bajo ciertas condiciones
                Text(
                  'Correcto!',
                  style: TextStyle(fontSize: 18.0),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.1, 0.9])),
      ),
    );
  }*/
}
