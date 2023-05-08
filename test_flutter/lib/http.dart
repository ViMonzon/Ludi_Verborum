import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:test_flutter/src/pages/dictionary.dart';
import 'package:test_flutter/src/pages/login_page.dart';
import 'package:test_flutter/src/pages/home_page.dart';

class HttpService {
  static final _client = http.Client();

  static var _loginUrl = Uri.parse('http://localhost:5000/login');

  static var _registerUrl = Uri.parse('http://localhost:5000/register');

  static var _dictionaryUrl = Uri.parse('http://localhost:5000/dictionary');

  static var _gameUrl = Uri.parse('http://localhost:5000/game');

  static var _addUrl = Uri.parse('http://localhost:5000/add');

  static var _logoutUrl = Uri.parse('http://localhost:5000/logout');

  static login(email, password, context) async {
    Map data = {'email': email, 'password': password};

    http.Response response = await _client.post(_loginUrl,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      var json = jsonDecode(response.body);

      if (json[0] == 'success') {
        await EasyLoading.showSuccess(json[0]);
        await Navigator.pushReplacementNamed(context, 'home');
      } else {
        EasyLoading.showError(json[0]);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  static register(email, password, context) async {
    Map data = {'email': email, 'password': password};

    http.Response response = await _client.post(_registerUrl,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json[0] == 'username already exist') {
        await EasyLoading.showError(json[0]);
      } else {
        await EasyLoading.showSuccess(json[0]);
        Navigator.pushReplacementNamed(context, 'home');
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  static game(email, context) async {
    Map data = {'email': email};

    http.Response response = await _client.post(_gameUrl,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    print(response.body);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print("Este es el json" + jsonEncode(json));
      print(json.runtimeType.toString());
      print(json[0].runtimeType.toString());
      print("ok");
      List<String> palabras =
          json.map((item) => item["palabra"]).toList().cast<String>();
      List<String> definiciones =
          json.map((item) => item["definicion"]).toList().cast<String>();

      return [palabras, definiciones];
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  static add(email, word, context) async {
    Map data = {'email': email, 'word': word};
    http.Response response = await _client.post(_addUrl,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      await EasyLoading.showSuccess("Palabra añadida");
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  static Future<bool> logout() async {
    http.Response response = await _client.post(_logoutUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    } /*headers: {'Content-Type': 'application/json'}*/);
    if (response.statusCode == 200) {
      // La sesión ha sido cerrada correctamente
      return true;
    } else {
      // Ocurrió un error al cerrar la sesión
      return false;
    }
  }

  static dictionary(email, context) async {
    Map data = {'email': email};
    List<String> dictionary = [];
    http.Response response = await _client.post(_dictionaryUrl,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      /*for (var word in json) {
        dictionary.add(word);
      }*/
      Navigator.pushNamed(context, 'dictionary');
      print("diccionario cargado");
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}
