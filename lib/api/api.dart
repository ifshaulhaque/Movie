import 'package:dio/dio.dart';

class Api {
  Dio dio = Dio();

  Future<Response> get(String url) {
    return dio.get(url);
  }
}