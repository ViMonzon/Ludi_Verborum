import 'package:shared_preferences/shared_preferences.dart';

import 'package:test_flutter/src/model/settings.dart';

class PreferencesService {
  Future saveSettings(String email, Settings settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('${email}_username', settings.username);
    await preferences.setInt('${email}_time', settings.time);

    print('Saved settings for user: $email');
  }

  Future<Settings> getSettings(String email) async {
    final preferences = await SharedPreferences.getInstance();

    final username = preferences.getString('${email}_username') ?? '';
    final time = preferences.getInt('${email}_time') ?? 200;

    return Settings(
      email: email,
      username: username,
      time: time,
    );
  }
}
