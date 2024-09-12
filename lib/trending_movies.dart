import 'package:assignment/movie_card.dart';
import 'package:assignment/movie_model.dart';
import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({
    super.key, required this.movies,
  });
  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
              top: 24, start: 16, end: 16, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Trending Movies",
                  style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
              itemCount: movies.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: MovieCard(movies[index]),
                );
              }),
        ),
      ],
    );
  }
}
