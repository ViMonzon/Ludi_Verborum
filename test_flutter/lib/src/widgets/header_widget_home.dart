import 'package:flutter/material.dart';

import '../bloc/provider.dart';
import '../themes/constants.dart';

class HeaderWidgetHome extends StatelessWidget {
  const HeaderWidgetHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "¡HOLA!",
          /* ${bloc.email}",*/
          style: TextStyle(
              color: titleTextColor,
              fontSize: 40,
              fontWeight: FontWeight.w900,
              fontFamily: 'Avenir'),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            Container(
              child: Text(
                "usermail" /*bloc.email*/,
                style: TextStyle(
                    color: secondaryTextColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Avenir',
                    fontSize: 28),
              ),
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
