import 'package:flutter/material.dart';

import '../bloc/provider.dart';

class opcionesJuego extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    bool _timerEnabled = false;
    int _seconds = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.book_rounded),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text('Hola ${bloc.email}'),
          const SizedBox(height: 16),
          Row(
            children: [
              /*
              Checkbox(
                value: _timerEnabled,
                onChanged: () {},
              ),*/
              const Text('Habilitar temporizador'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text('Determinar segundos: '),
              SizedBox(
                width: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    /*setState(() {
                      _seconds = int.tryParse(value) ?? 0;
                    });*/
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_timerEnabled && _seconds > 0)
            Text('Temporizador habilitado por $_seconds segundos'),
        ],
      ),
    );
  }
}
