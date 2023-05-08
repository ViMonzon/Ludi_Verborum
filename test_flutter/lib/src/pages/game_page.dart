import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:diacritic/diacritic.dart';

import '../model/word.dart';

import '../themes/constants.dart';

import '../widgets/card.dart';
import '../widgets/custom_card.dart';
import '../widgets/header_widget.dart';
import '../widgets/timer_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<String>> palabras_def =
        ModalRoute.of(context)!.settings.arguments as List<List<String>>;
    List<String> palabras = palabras_def[0];
    List<String> deficiones = palabras_def[1];
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
            TimerWidget(),
            Expanded(
              child: Swiper(
                itemCount: palabras.length,
                itemWidth: MediaQuery.of(context).size.width,
                itemHeight: MediaQuery.of(context).size.height,
                layout: SwiperLayout.TINDER,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          CustomCard(
                              inicial: removeDiacritics(
                                  palabras[index][0].toUpperCase()),
                              definicion: deficiones[index]),
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
