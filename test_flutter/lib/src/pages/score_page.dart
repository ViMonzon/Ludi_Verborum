import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
  final int aciertos;
  final int fallos;

  const ScorePage({
    Key? key,
    required this.aciertos,
    required this.fallos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Puntuación'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Aciertos: $aciertos',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'Fallos: $fallos',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
