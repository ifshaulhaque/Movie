import 'package:dio/dio.dart';

class Api {
  Dio dio = Dio();

  Future<Response> get(String url, {Map<String, dynamic>? queryParameters}) {
    return dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "accept": 'application/json',
            "Authorization": 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjOTI0MmRlZTdiYzFhZWQyMWIyMzFiODk4NTY1NmFlNiIsInN1YiI6IjYyYjE1NmQ0M2ZhYmEwMDA1MjEwNDAwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.g3N4lZI4VEDzeRW7icZ6b5zlOTh9VyueFhpgDFgHgJo'
          }
        )
    );
  }
}