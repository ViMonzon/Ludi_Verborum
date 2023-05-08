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
    final controller = SwiperController();
    final bloc = Provider.of(context);
    /*Lista de palabras del abecedario que luego mostramos en el swiper */
    List<dynamic> abc = [
      {
        "definicion":
            "1. f. Pájaro de 15 a 20 cm de largo, de cola ahorquillada, con cabeza y dorso de color pardo terroso y vientre blanco sucio, que anida en los campos de cereales, come insectos y granos, y abunda en toda España.",
        "palabra": "alondra"
      },
      {"definicion": "4. f. dentadura.", "palabra": "boca"},
      {
        "definicion":
            "6. f. Descendencia o linaje que tiene un mismo apellido y viene del mismo origen.",
        "palabra": "casa"
      },
      {
        "definicion":
            "1. m. Cada uno de los cinco apéndices articulados en que terminan la mano y el pie del hombre y, en el mismo o menor número, de muchos animales.",
        "palabra": "dedo"
      },
      {
        "definicion":
            "1. m. y f. Mamífero del orden de los proboscidios, el mayor de los animales terrestres, con cabeza y ojos pequeños, orejas grandes y colgantes, nariz y labio superior unidos y muy prolongados en forma de trompa prensil, y dos dientes incisivos, macizos y muy grandes, vulgarmente llamados colmillos, que vive en Asia y África. U. en m. ref. a la especie.",
        "palabra": "elefante"
      },
      {
        "definicion":
            "9. f. Irisaciones que se producen en las láminas delgadas de metales, cuando pasan candentes por el agua.",
        "palabra": "flor"
      },
      {"definicion": "3. m. y f. guitarrista.", "palabra": "guitarra"},
      {
        "definicion":
            "1. m. Agua convertida en cuerpo sólido y cristalino por un descenso suficiente de temperatura.",
        "palabra": "hielo"
      },
      {
        "definicion":
            "4. f. Gobierno eclesiástico general del sumo pontífice, concilios y prelados.",
        "palabra": "iglesia"
      },
      {
        "definicion": "3. m. Mancha que deslustra y afea la esmeralda.",
        "palabra": "jardín"
      },
      {"definicion": "3. m. hormiga león.", "palabra": "león"},
      {
        "definicion":
            "10. m. coloq. Necesidad, deseo apremiante o añoranza de algo.",
        "palabra": "mono"
      },
      {
        "definicion":
            "1. f. Agregado visible de minúsculas gotitas de agua, de cristales de hielo o de ambos, suspendido en la atmósfera y producido por la condensación de vapor de agua.",
        "palabra": "nube"
      },
      {
        "definicion":
            "1. m. y f. Mamífero carnívoro plantígrado, de gran tamaño, de pelaje pardo, largo y espeso, cabeza grande, ojos pequeños, extremidades fuertes y gruesas, con garras, y cola muy corta, que vive en los montes boscosos. U. en m. ref. a la especie.",
        "palabra": "oso"
      },
      {
        "definicion":
            "3. m. pl. Pantalones bombachos cortos que se ponen debajo de la falda y la enagua, y forman parte de algunos trajes regionales femeninos.",
        "palabra": "pololo"
      },
      {
        "definicion":
            "1. m. Producto obtenido por maduración de la cuajada de la leche con características propias para cada uno de los tipos según su origen o método de fabricación.",
        "palabra": "queso"
      },
      {
        "definicion": "6. m. coloq. C. Rica y Nic. músculo gemelo.",
        "palabra": "ratón"
      },
      {
        "definicion":
            "2. m. Cualquier estrella luminosa que es centro de un sistema planetario.",
        "palabra": "sol"
      },
      {
        "definicion":
            "3. m. Méx. tranvía (‖ vehículo urbano que circula sobre raíles).",
        "palabra": "tren"
      },
      {
        "definicion": "5. f. Ar., Man., Nav. y Rioja. Racimo de uvas.",
        "palabra": "uva"
      },
      {"definicion": "1. f. Hembra del toro.", "palabra": "vaca"},
      {
        "definicion":
            "1. m. Calzado que no pasa del tobillo, con la parte inferior de suela y lo demás de piel, fieltro, paño u otro tejido, más o menos escotado por el empeine.",
        "palabra": "zapato"
      }
    ];
    List<dynamic> wordList = abc; // Tu lista de mapas
    List<String> palabras =
        wordList.map((mapa) => mapa['palabra'].toString()).toList();
    List<String> definiciones =
        wordList.map((mapa) => mapa['definicion'].toString()).toList();
    List<String> iniciales = [];
    for (var i = 0; i < palabras.length; i++) {
      String inicial = palabras[i][0].toUpperCase();
      iniciales.add(inicial);
    }

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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${iniciales[index]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontFamily: 'bangers',
                                  ),
                                ),
                                SizedBox(height: 16.0),
                                Text(
                                  "${definiciones[index]}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontFamily: 'bangers',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
