import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:diacritic/diacritic.dart';
import 'package:ludi_verborum/src/pages/score_page.dart';
import '../themes/constants.dart';
import '../themes/customs.dart';
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
    setState(() {
      palabras.removeAt(index);
      definiciones.removeAt(index);
    });
    if (palabras.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ScorePage(aciertos: contadorAcierto, fallos: contadorFallo)),
      );
    }
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
            gradient:
                LinearGradient(colors: <Color>[fondoNaranja, fondoMorado])),
        child: Expanded(
            child: Column(
          children: <Widget>[
            /*crearFondo(context),*/
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
                child: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
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
                            CustomCard(
                              // añadir key para automatizar la actualización de Status
                              key: Key(palabras[index]),
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
              ),
            ))
          ],
        )),
      ),
    );
  }
}
