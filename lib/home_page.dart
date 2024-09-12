import 'package:assignment/movie_cubits.dart';
import 'package:assignment/movie_states.dart';
import 'package:assignment/now_in_theaters.dart';
import 'package:assignment/trending_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'popularMovies.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..getMoviesData(),
      child: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieSuccess) {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                title: const Text(
                  "Movies",
                   
                ),
                centerTitle: true,
                backgroundColor: Colors.black,
              ),
              body: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        NowInTheaters(
                          movies: state.nowInTheatersMovies,
                        ),
                        TrendingMovies(
                          movies: state.trendingMovies,
                        ),
                        PopularMovies(
                          movies: state.popularMovies,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
