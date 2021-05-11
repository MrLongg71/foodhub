import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  // final UserRepository userRepository;

  AuthenticationBloc()
      : assert(null),
        super(Uninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    // PackageInfo _packageInfo = await PackageInfo.fromPlatform();

    if (event is AppStarted) {
      // final tm = TokenManager();
      // bool hasToken = await tm.hasToken();
      // if (hasToken) {
      //   var res = await userRepository.getMyProfile();
      //   yield Authenticated(user: res.data, versionApp: _packageInfo.version);
      // } else {
      //   yield Unauthenticated();
      // }
    }

    if (event is CheckToken) {
      try {
        // final tm = TokenManager();
        // bool hasToken = await tm.hasToken();
        //
        // if (hasToken) {}
        // var res = await userRepository.getMyProfile();
        //
        // yield Authenticated(user: res.data, versionApp: _packageInfo.version);
      } catch (e) {

      }
    }

    if (event is LoggedOut) {
//      await userRepository.deleteToken();
      /// set isLogin= false
      // await accountRepository.setPreferredIsLogin(false);
      // final hasToken = await userRepository.hasToken();
      // yield AuthenticationUnauthenticated(hasToken.userName, hasToken.password);
    }
  }
}
