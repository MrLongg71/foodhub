// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'bloc_login.dart';
//
// enum LoginType { NewUser, ExistUser, IsAdminUser, Error }
//
// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   // final UserRepository userRepository;
//
//   LoginBloc({@required this.userRepository})
//       : assert(userRepository != null),
//         super(LoadingState());
//
//   @override
//   Stream<LoginState> mapEventToState(
//     LoginEvent event,
//   ) async* {
//     if (event is CheckUserExist) {
//       try {
//         yield LoadingState();
//         BaseResponse res =
//             await userRepository.checkValidPhone(phone: event.phone ?? '');
//         LoginType loginType;
//         switch (res.code) {
//           case 200:
//             loginType = LoginType.NewUser;
//             break;
//           case 209:
//             loginType = LoginType.ExistUser;
//             break;
//           case 203:
//             loginType = LoginType.IsAdminUser;
//             break;
//           default:
//             loginType = LoginType.Error;
//         }
//         yield ValidPhoneState(type: loginType, user: res.data);
//       } catch (e) {}
//     }
//
//     if (event is LoggedIn) {
//       //yield LoadingState();
//       try {
//         User _user = await userRepository.signIn(
//             userName: event.userName, password: event.password);
//         print(_user.token);
//         if (_user.token != null) {
//           final tm = TokenManager();
//           tm.accessToken = _user.token ?? "";
//           tm.refreshToken = _user.token ?? "";
//           await tm.save();
//           yield LoginSuccessState();
//         }
//       } catch (e) {}
//     }
//
//     if (event is LoggedOut) {
// //      await userRepository.deleteToken();
//       /// set isLogin= false
//       // await accountRepository.setPreferredIsLogin(false);
//       // final hasToken = await userRepository.hasToken();
//       // yield LoginUnauthenticated(hasToken.userName, hasToken.password);
//     }
//   }
// }
