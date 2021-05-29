import 'package:dio/dio.dart';
import 'package:foodhub/src/model/user.dart';
import 'package:foodhub/src/resource/service/api_provider.dart';

class UserApiClient {
  static final UserApiClient _instance = UserApiClient();
  ApiProvider _apiProvider = ApiProvider();

  static UserApiClient getInstance() => _instance;

  Future<User> signIn(String email, String pass) async {
    try {
      Response response = await _apiProvider.post(
        '/users/login',
        data: {
          'email': email,
          'password': pass,
        },
      );
      print(response.realUri);

      return User.fromJson(response.data['data']);
    } catch (e) {
      throw e;
    }
  }
}
