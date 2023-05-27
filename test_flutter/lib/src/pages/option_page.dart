import 'package:ludi_verborum/src/utils/user_preferences.dart';
import 'package:ludi_verborum/src/model/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/provider.dart';
import '../themes/customs.dart';
import '../widgets/header_widget_option.dart';

class OptionsPage extends StatefulWidget {
  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  final _preferencesService = PreferencesService();

  final _usernameController = TextEditingController();
  var _time = TextEditingController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isLoading) {
      _populateFields();
      _isLoading = false;
    }
  }

  void _populateFields() async {
    final bloc = Provider.of(context);
    final settings = await _preferencesService.getSettings(bloc.email);
    setState(() {
      _usernameController.text = settings.username;
      _time.text = settings.time.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          crearFondo(context),
          Column(
            children: [
              const HeaderWidgetOption(),
              SizedBox(height: 50),
              Container(
                width: size.width * 0.85,
                padding: EdgeInsets.symmetric(vertical: 50.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 3.0,
                          offset: Offset(0.0, 5.0),
                          spreadRadius: 3.0)
                    ]),
                child: Column(children: <Widget>[
                  ListTile(
                    title: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Cambia tu Username',
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      controller: _time,
                      decoration:
                          InputDecoration(labelText: 'Introduce el tiempo'),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                  SizedBox(height: 30),
                  _botonOpciones(context),
                  /*TextButton(
                onPressed: () {
                  _saveSettings(bloc.email);
                },
                child: Text('Save Settings'),
             )*/
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _saveSettings(String email) {
    int timeInt = int.parse(_time.text);
    final newSettings = Settings(
      email: email,
      username: _usernameController.text,
      time: timeInt,
    );

    print(newSettings);
    _preferencesService.saveSettings(email, newSettings);
  }

  Widget _botonOpciones(context) {
    final bloc = Provider.of(context);
    return ElevatedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Text(
            'Guardar cambios',
            style: TextStyle(
              fontFamily: 'Avenir',
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 5.0,
          minimumSize: Size(0, 0),
          padding: EdgeInsets.zero,
          backgroundColor: Colors.deepPurple,
        ),
        onPressed: () {
          _saveSettings(bloc.email);
        });
  }
}
