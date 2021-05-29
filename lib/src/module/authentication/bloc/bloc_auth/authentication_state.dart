import 'package:equatable/equatable.dart';


abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  // final User user;
  // final String versionApp;

  // Authenticated({this.user, this.versionApp});

  @override
  List<Object> get props => [""];
}

class Unauthenticated extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {
  final String message;

  AuthenticationError(this.message);
}
