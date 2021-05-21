import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static final TokenManager _instance = TokenManager._internal();

  String accessToken = "";
  String refreshToken = "";

  TokenManager._internal();

  factory TokenManager() {
    return _instance;
  }

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
    // await prefs.setString('refresh_token', refreshToken);
  }

  load(SharedPreferences pref) async {
    accessToken = pref.getString('access_token') ?? "";
    // refreshToken = pref.getString('refresh_token') ?? "";
  }

  Future<bool> hasToken() async {
    final prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('access_token') ?? "";
    return accessToken.length > 0;
  }
}
