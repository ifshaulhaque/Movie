class MovieModel {
  final String posterUrl;
  final String title;
  final String language;
  final double rating;
  final String overview;

  MovieModel(
      {required this.posterUrl,
      required this.title,
      required this.language,
      required this.rating,
      required this.overview});

  static MovieModel mapper(dynamic movie) {
    return MovieModel(
      posterUrl: "https://image.tmdb.org/t/p/w500${movie['poster_path']}",
      title: movie['title'],
      language: movie['original_language'],
      rating: movie['vote_average'] * 1.0,
      overview: movie['overview'],
    );
  }
}
