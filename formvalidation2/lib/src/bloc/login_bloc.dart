import 'dart:async';

import 'package:formvalidation/src/bloc/validators.dart';
import 'package:rxdart/streams.dart';
import 'package:rxdart/subjects.dart';

// Stream<bool> get formValidStream =>
// CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Recuperar valores del stream (salida)
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>
      CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);

  // Insertar valores al stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Obtener último valor ingresado al stream
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
