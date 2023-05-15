import 'package:flutter/material.dart';

import '../themes/constants.dart';

class HeaderWidgetScore extends StatelessWidget {
  const HeaderWidgetScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Puntuación",
          style: TextStyle(
              color: titleTextColor,
              fontSize: 40,
              fontWeight: FontWeight.w900,
              fontFamily: 'Avenir'),
          textAlign: TextAlign.left,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
              /*style: TextStyle(
                  color: titleTextColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Avenir'),
              textAlign: TextAlign.center,*/
            )
          ],
        ),
      ]),
    );
  }
}
