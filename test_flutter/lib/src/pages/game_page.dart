import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../http.dart';
import '../bloc/provider.dart';
import '../themes/constants.dart';

class GamePage extends StatelessWidget {
  String _inputText = '';
  bool _showLabel = false;

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      'https://picsum.photos/300/400?random=1',
      'https://picsum.photos/300/400?random=2',
      'https://picsum.photos/300/400?random=3',
      'https://picsum.photos/300/400?random=4',
      'https://picsum.photos/300/400?random=5',
    ];

    /*Lista de palabras del abecedario que luego mostramos en el swiper */
    List<String> abc = [
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "I",
      "J",
      "K",
      "L",
      "M",
      "N",
      "O",
      "P",
      "Q",
      "R",
      "S",
      "T",
      "U",
      "V",
      "W",
      "X",
      "Y",
      "Z"
    ];
    final bloc = Provider.of(context);
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
              SizedBox(height: 150.0),
              /*Elemento swiper*/
              SizedBox(
                height: 100.0, // Altura del Swiper
                child: Swiper(
                  layout: SwiperLayout.STACK,
                  itemWidth: 300.0,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: <Widget>[
                        Center(
                          child: Image.network(
                            "https://colourlex.com/wp-content/uploads/2017/04/Spinel-black-painted-swatch-47400-opt.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Center(
                          child: Container(
                            //width: 90,
                            //height: 90,
                            //color: Colors.white,
                            child: Text("${abc[index]}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontFamily: 'bangers',
                                )),
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: abc.length,
                  control: SwiperControl(),
                ),
              ),
              SizedBox(height: 16.0),
              /*Ellemento con la definición */
              Text(
                'Definición',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 16.0),
              /*Elemento que contiene el inputfield para meter la palabra*/
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Introduce la solución',
                ),
                onChanged: bloc.changePalabraJuego,
              ),
              SizedBox(height: 16.0),
              _botonEnviarPalabra(bloc),
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

  Widget _botonEnviarPalabra(LoginBloc bloc) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        onPressed: () async {
          await HttpService.game(bloc.email, context);
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: Text('Enviar palabra')),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 0.0,
          backgroundColor: Colors.deepPurple,
        ),
      );
    });

    // Lógica para enviar la información ingresada en _inputText
    // aquí
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
