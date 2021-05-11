// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:footcer/src/model/user.dart';
//
// abstract class LoginEvent extends Equatable {
//   const LoginEvent();
//
//   @override
//   List<Object> get props => [];
// }
//
// class CheckUserExist extends LoginEvent {
//   final String phone;
//
//   CheckUserExist({@required this.phone});
//
//   @override
//   List<Object> get props => [phone];
// }
//
// class UpdateUser extends LoginEvent {
//   final User user;
//
//   UpdateUser({@required this.user});
//
//   @override
//   List<Object> get props => [user];
// }
//
// class LoggedIn extends LoginEvent {
//   final String userName;
//   final String password;
//
//   LoggedIn({@required this.userName, this.password});
//
//   @override
//   List<Object> get props => [userName, password];
//
//   @override
//   String toString() => 'LoggedIn { user: $userName }';
// }
//
// class LoggedOut extends LoginEvent {
//   @override
//   String toString() => 'LoggedOut';
// }
