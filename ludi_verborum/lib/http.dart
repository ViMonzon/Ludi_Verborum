import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ludi_verborum/src/pages/dictionary.dart';
import 'package:ludi_verborum/src/pages/login_page.dart';
import 'package:ludi_verborum/src/pages/home_page.dart';

class HttpService {
  static final _client = http.Client();
  static final localhost = "10.0.2.2";

  static var _loginUrl = Uri.parse('http://' + localhost + ':5000/login');

  static var _registerUrl = Uri.parse('http://' + localhost + ':5000/register');

  static var _dictionaryUrl =
      Uri.parse('http://' + localhost + ':5000/dictionary');

  static var _gameUrl = Uri.parse('http://' + localhost + ':5000/game');

  static var _addUrl = Uri.parse('http://' + localhost + ':5000/add');
  static var _deleteUrl = Uri.parse('http://' + localhost + ':5000/delete');
  static var _defUrl = Uri.parse('http://' + localhost + ':5000/definitions');

  static var _logoutUrl = Uri.parse('http://' + localhost + ':5000/logout');

  static login(email, password, context) async {
    Map data = {'email': email, 'password': password};
    print("envio " + email + "y" + password);

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
      await EasyLoading.showSuccess("Palabra " + word + " añadida");
    } else {
      await EasyLoading.showError(
          "Error Code: ${response.statusCode.toString()}");
    }
  }

  static delete(email, word, context) async {
    Map data = {'email': email, 'word': word};
    http.Response response = await _client.post(_deleteUrl,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      await EasyLoading.showSuccess("Palabra" + word + "borrada");
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }

  static get_def(email, word, context) async {
    Map data = {'email': email, 'word': word};
    http.Response response = await _client.post(_defUrl,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<String> definiciones = List<String>.from(json).cast<String>();
      print(definiciones);
      return definiciones;
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
    http.Response response = await _client.post(_dictionaryUrl,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print("Este es el json" + jsonEncode(json));
      print(json.runtimeType.toString());
      print(json[0].runtimeType.toString());
      print("ok");
      List<String> palabras = List<String>.from(json).cast<String>();
      return palabras;
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}
