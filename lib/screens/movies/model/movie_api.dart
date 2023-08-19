import 'package:dio/dio.dart';
import 'package:movie/api/api.dart';
import 'package:movie/screens/movies/model/movie_model.dart';

class MovieApi {
  Api api = Api();

  Future<List<MovieModel>> getMovieList() async {
    Response response = await api.get(
        "https://api.themoviedb.org/3/trending/movie/week?api_key=ec0ff5c611f1d0751fc6484391b1067c");

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
