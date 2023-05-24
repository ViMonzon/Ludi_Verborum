import 'package:flutter/material.dart';

import '../themes/constants.dart';

class HeaderWidgetOption extends StatelessWidget {
  const HeaderWidgetOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 26.0, right: 26.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "OPCIONES",
          style: TextStyle(
              color: titleTextColor,
              fontSize: 30,
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
