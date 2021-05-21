import 'package:dio/dio.dart';
import 'package:foodhub/src/config_env.dart';
import 'package:foodhub/src/model/error_response.dart';
import 'package:foodhub/src/resource/service/token_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  Dio _dio;

  String get _accessToken => TokenManager().accessToken;

  static final ApiProvider _instance = ApiProvider._internal();

  ApiProvider._internal() {
    BaseOptions baseOptions =
        BaseOptions(baseUrl: "${ConfigEnv.getDomainAPI()}");
    _dio = Dio(baseOptions);
    setupInterceptors();
  }

  factory ApiProvider() {
    return _instance;
  }

  setupInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (_accessToken.isEmpty) {
        _dio.lock();

        return SharedPreferences.getInstance().then((sharedPreferences) {
          TokenManager().load(sharedPreferences);

          print("calling with access token: $_accessToken");
          options.headers['Authorization'] = 'Bearer ' + _accessToken;

          _dio.unlock();
          return options;
        });
      }
      print("calling with access token: $_accessToken");

      options.headers['Authorization'] = 'Bearer ' + _accessToken;
      return options;
    }, onResponse: (response, handler) {
      return response;
    }, onError: (DioError e, handler) {
      print(e.response.toString());
      print(e.response.statusCode);
      if (e.response.statusCode == 503) {
        return ErrorResponse(
          statusCode: 503,
          message: "Service is unavailable now, please try again",
        );
      } else if (e.response.statusCode == 409) {
        Response err = ErrorResponse.fromJson(e.response.data);
        return err;
      }
      return ErrorResponse(
        statusCode: 0,
        message: "Something went wrong",
      );
    }));
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    final res = await _dio.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);

    if (res is! ErrorResponse) return res;
    throw res;
  }

  Future<Response> post(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final res = await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    if (res is! ErrorResponse) return res;
    throw res;
  }

  Future<Response> put(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final res = await _dio.put(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onReceiveProgress);

    if (res is! ErrorResponse) return res;
    throw res;
  }

  Future<Response> delete(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
  }) async {
    final res = await _dio.delete(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);

    if (res is! ErrorResponse) return res;
    throw res;
  }
}
