import 'package:flutter/material.dart';
import 'package:movie/component/movie_item_card.dart';
import 'package:movie/screens/movies/model/movie_api.dart';
import 'package:movie/screens/movies/model/movie_model.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: FutureBuilder<List<MovieItemCard>>(
          future: getMovieItemListWidget(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Display a loading indicator while fetching data
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: snapshot.data!,
                ),
              );
            } else {
              return const Text('No data available');
            }
          }
        ),
      ),
    );
  }

  Future<List<MovieItemCard>> getMovieItemListWidget() async {
    List<MovieModel> movies = await MovieApi().getMovieList();

    List<MovieItemCard> movieItemCard = [];
    for(var movie in movies) {
      movieItemCard.add(
        MovieItemCard(movieModel: movie)
      );
    }

    return movieItemCard;
  }
}
