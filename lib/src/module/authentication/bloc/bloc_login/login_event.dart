import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}


class LoggedIn extends LoginEvent {
  final String? email;
  final String? password;

  LoggedIn({@required this.email, this.password});

  @override
  List<Object> get props => [email!, password!];

  @override
  String toString() => 'LoggedIn { user: $email }';
}

class LoggedOut extends LoginEvent {
  @override
  String toString() => 'LoggedOut';
}
