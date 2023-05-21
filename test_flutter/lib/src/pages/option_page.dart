import 'package:test_flutter/src/utils/user_preferences.dart';
import 'package:test_flutter/src/model/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/provider.dart';

class OptionsPage extends StatefulWidget {
  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  final _preferencesService = PreferencesService();

  final _usernameController = TextEditingController();
  var _time = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    _populateFields();
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Settings'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
            ),
            ListTile(
              title: TextField(
                controller: _time,
                decoration: InputDecoration(labelText: 'Enter Number'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            TextButton(
              onPressed: () {
                _saveSettings(bloc.email);
              },
              child: Text('Save Settings'),
            )
          ],
        ),
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
}
