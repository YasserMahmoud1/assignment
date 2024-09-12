import 'package:assignment/movie_cubits.dart';
import 'package:assignment/movie_states.dart';
import 'package:assignment/now_in_theaters.dart';
import 'package:assignment/trending_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'popularMovies.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            appBar: AppBar(title: const Text("Movies"), centerTitle: true),
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const NowInTheaters(),
                      const TrendingMovies(),
                      const PopularMovies(),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
