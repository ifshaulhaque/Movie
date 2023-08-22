import 'package:dio/dio.dart';
import 'package:movie/api/api.dart';
import 'package:movie/screens/movies/model/movie_model.dart';

class MovieApi {
  Api api = Api();

  Future<List<MovieModel>> getMovieList(int pageNo) async {
    Map<String, dynamic> query = {};
    query['page'] = pageNo;

    Response response = await api.get(
        "https://api.themoviedb.org/3/movie/popular",
        queryParameters: query
    );

    List<MovieModel> movieData = [];
    if (response.statusCode == 200) {
      List<dynamic> movies = response.data['results'];
      for (var movie in movies) {
        movieData.add(MovieModel.mapper(movie));
      }
    } else {
      print('Failed to fetch move list');
    }

    return movieData;
  }
}
