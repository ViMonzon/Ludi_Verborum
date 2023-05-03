import 'dart:async';
import 'package:test_flutter/src/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passController = BehaviorSubject<String>();

  //Recuperar datos del string
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passStream =>
      _passController.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passStream, (e, p) => true);

  // Insertr valores al String
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passController.sink.add;

  //Obtener el ultimo valor ingresado

  String get email => _emailController.value;
  String get password => _passController.value;

  dispose() {
    _emailController.close();
    _passController.close();
  }
}
