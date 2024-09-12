import 'package:assignment/movie_model.dart';

sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

class MovieSuccess extends MovieState {

  final List<Movie> popularMovies;
  final List<Movie> trendingMovies;
  final List<Movie> nowInTheatersMovies;

  MovieSuccess({required this.popularMovies, required this.trendingMovies, required this.nowInTheatersMovies});
}
