import 'package:flutter/material.dart';
import 'package:foodhub/src/model/user.dart';
import 'package:foodhub/src/resource/remote/user_api_client.dart';

class UserRepository {
  UserApiClient _userApiClient = UserApiClient.getInstance();

  Future<User> signIn(
      {@required String? email, @required String? password}) async {
    return await _userApiClient.signIn(email!, password!);
  }
}
