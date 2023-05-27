import 'dart:async';
import 'package:ludi_verborum/src/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passController = BehaviorSubject<String>();
  final _palabraJuegoController = BehaviorSubject<String>();

  //Recuperar datos del string
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passStream =>
      _passController.stream.transform(validarPassword);
  Stream<String> get palabraJuegoStream =>
      _palabraJuegoController.stream.transform(validarPalabraJuego);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passStream, (e, p) => true);

  // Insertr valores al String
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passController.sink.add;
  Function(String) get changePalabraJuego => _palabraJuegoController.sink.add;

  //Obtener el ultimo valor ingresado

  String get email => _emailController.value;
  String get password => _passController.value;
  String get palabraJuego => _palabraJuegoController.value;

  clearLogin() {
    changeEmail('');
    changePassword('');
  }

  dispose() {
    _emailController.close();
    _passController.close();
  }
}
