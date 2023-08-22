import 'package:flutter/material.dart';
import 'package:movie/component/movie_item_card.dart';
import 'package:movie/screens/movies/model/movie_api.dart';
import 'package:movie/screens/movies/model/movie_model.dart';

class MovieListScreen extends StatefulWidget {
  MovieListScreen({super.key});
  ScrollController scrollController = ScrollController();
  int pageNo = 1;
  List<MovieItemCard> movieItemCard = [];

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  @override
  void initState() {
    widget.scrollController.addListener(() {
      if (widget.scrollController.position.atEdge && widget.scrollController.position.pixels != 0) {
        widget.pageNo++;
        getMovieItemListWidget();
      }
    });
    getMovieItemListWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget widgets = widget.movieItemCard.isEmpty ?
      const Center(
        child: CircularProgressIndicator(),
      )
     :
      SingleChildScrollView(
          controller: widget.scrollController,
          child: Column(
            children: [
              ...widget.movieItemCard,
              const CircularProgressIndicator(),
            ],
          )
      );

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: widgets,
      ),
    );
  }

  Future<List<MovieItemCard>> getMovieItemListWidget() async {
    List<MovieModel> movies = await MovieApi().getMovieList(widget.pageNo);
    for(var movie in movies) {
      widget.movieItemCard.add(
        MovieItemCard(movieModel: movie)
      );
    }
    setState(() {});

    return widget.movieItemCard;
  }
}
