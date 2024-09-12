import 'dart:convert';

import 'package:assignment/movie_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class APIService {

  static final _apiKey = dotenv.env["API_KEY"] ?? "";

  static Future<List<Movie>> getPopularMovies() async {
    final uri =
        Uri.https('api.themoviedb.org', '/3/movie/top_rated',{"api_key":_apiKey} );
    final r = await http.get(uri);
    final response = jsonDecode(r.body) as Map<String, dynamic>;
    return response["results"]
        .map<Movie>((movie) => Movie.fromJSON(movie))
        .toList();
  }

  static Future<List<Movie>> getTrendingMovies() async {
    final uri = Uri.https(
        'api.themoviedb.org', '/3/trending/movie/week',{"api_key":_apiKey});
    final r = await http.get(uri);
    final response = jsonDecode(r.body) as Map<String, dynamic>;
    return response["results"]
        .map<Movie>((movie) => Movie.fromJSON(movie))
        .toList();
  }

  static Future<List<Movie>> getNowInTheaterMovies() async {
    final uri = Uri.https(
        'api.themoviedb.org', '/3/movie/now_playing', {"api_key": _apiKey});
    final r = await http.get(uri);
    final response = jsonDecode(r.body) as Map<String, dynamic>;
    return response["results"]
        .map<Movie>((movie) => Movie.fromJSON(movie))
        .toList();
  }
}
