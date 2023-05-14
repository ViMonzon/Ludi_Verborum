import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:diacritic/diacritic.dart';
import 'package:test_flutter/src/pages/score_page.dart';

import '../model/word.dart';

import '../themes/constants.dart';

import '../widgets/card.dart';
import '../widgets/custom_card.dart';
import '../widgets/header_widget.dart';
import '../widgets/timer_widget.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> palabras = [];
  List<String> definiciones = [];
  int contadorAcierto = 0;
  int contadorFallo = 0;
  final SwiperController _swiperController = SwiperController();
  int currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    List<List<String>> palabras_def =
        ModalRoute.of(context)!.settings.arguments as List<List<String>>;
    palabras = palabras_def[0];
    definiciones = palabras_def[1];
  }

  @override
  void initState() {
    super.initState();
  }

  void eliminarTarjeta(int index) {
    _swiperController.next();
    // esperar un momento para permitir que la animación de movimiento termine
    Future.delayed(Duration(milliseconds: 500), () {
      // eliminar la tarjeta actual del array
      setState(() {
        palabras.removeAt(index);
        definiciones.removeAt(index);
      });
      setState(() {});
    });
  }

  void sumarAcierto() {
    setState(() {
      print("Se ha acertado");
      contadorAcierto++;
    });
  }

  void sumarFallo() {
    setState(() {
      print("Se ha fallado");
      contadorFallo++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.1, 0.9])),
        child: Expanded(
            child: Column(
          children: <Widget>[
            const HeaderWidget(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: TimerWidget(
                onTimerFinish: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScorePage(
                            aciertos: contadorAcierto, fallos: contadorFallo)),
                  );
                },
              ),
            ),
            Expanded(
              child: Swiper(
                controller: _swiperController,
                itemCount: palabras.length,
                itemWidth: MediaQuery.of(context).size.width,
                itemHeight: MediaQuery.of(context).size.height,
                layout: SwiperLayout.TINDER,
                itemBuilder: (context, index) {
                  return IndexedStack(
                    children: [
                      Column(
                        children: [
                          /*const SizedBox(
                            height: 50,
                          ),*/
                          CustomCard(
                            palabra: palabras[index],
                            definicion: definiciones[index],
                            eliminarTarjeta: () => eliminarTarjeta(index),
                            sumarAcierto: () => sumarAcierto(),
                            sumarFallo: () => sumarFallo(),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
