import 'package:assignment/api_service.dart';
import 'package:assignment/movie_states.dart';
import 'package:bloc/bloc.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  void getMoviesData() async {
    emit(MovieLoading());
    final popular = await APIService.getPopularMovies();
    emit(MovieSuccess(
      nowInTheatersMovies: [],
      popularMovies: popular,
      trendingMovies: [],
    ));
  }
}
