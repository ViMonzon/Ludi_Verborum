import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../http.dart';
import '../bloc/provider.dart';
import '../themes/constants.dart';

class CustomCardAdd extends StatefulWidget {
  const CustomCardAdd({Key? key}) : super(key: key);

  @override
  _CustomCardAddState createState() => _CustomCardAddState();
}

class _CustomCardAddState extends State<CustomCardAdd> {
  final _palabraController = TextEditingController();

  @override
  void dispose() {
    _palabraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Introduce tu palabra: ",
                style: TextStyle(
                    color: primaryTextColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Avenir',
                    fontSize: 24),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextField(
                  controller: _palabraController,
                  decoration: InputDecoration(
                      hintText: 'Ingresa tu palabra',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () async {
                  final palabra = _palabraController.text; // <-- agregado
                  EasyLoading.show();
                  await HttpService.add(bloc.email, palabra, context);
                  EasyLoading.dismiss();
                },
                child: Text('Añadir'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 0.0,
                  backgroundColor: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
