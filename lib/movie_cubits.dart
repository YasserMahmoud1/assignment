import 'package:assignment/api_service.dart';
import 'package:assignment/movie_states.dart';
import 'package:bloc/bloc.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  void getMoviesData() async {
    emit(MovieLoading());
    final popular = await APIService.getPopularMovies();
    final trending = await APIService.getTrendingMovies();
    final nowInTheaters = await APIService.getNowInTheaterMovies();
    emit(MovieSuccess(
      nowInTheatersMovies: nowInTheaters,
      popularMovies: popular,
      trendingMovies: trending,
    ));
  }
}
