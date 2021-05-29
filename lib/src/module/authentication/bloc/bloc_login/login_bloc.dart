import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodhub/src/model/user.dart';
import 'package:foodhub/src/resource/repository/user_repository.dart';

import 'bloc_login.dart';

enum LoginType { NewUser, ExistUser, IsAdminUser, Error }

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository? userRepository;

  LoginBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(LoadingState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoggedIn) {
      //yield LoadingState();
      try {
        User _user = await userRepository!
            .signIn(email: event.email, password: event.password);
        print(_user.email);
        // if (_user.token != null) {
        //   final tm = TokenManager();
        //   tm.accessToken = _user.token ?? "";
        //   tm.refreshToken = _user.token ?? "";
        //   await tm.save();
        //   yield LoginSuccessState();
        // }
      } catch (e) {
        print(e);
      }
    }
  }
}
