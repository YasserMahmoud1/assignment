
import 'package:assignment/movie_states.dart';
import 'package:bloc/bloc.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());



  void getMoviesData() async {
    emit(MovieLoading());

    emit(MovieSuccess());
  }
}
