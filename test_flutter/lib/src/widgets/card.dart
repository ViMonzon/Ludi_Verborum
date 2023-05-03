import 'dart:ffi';

import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  final String word;
  final String definition;

  WordCard({required this.word, required this.definition});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
      Text(word[0], style: TextStyle(fontSize: 24)),
      Text('- $definition'),
    ]));
  }
}
