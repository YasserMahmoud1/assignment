import 'dart:convert';

import 'package:assignment/movie_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  static const _apiKey = '2f8f8d6f2068c7fe7832805515f2cdbb';

  static Future<List<Movie>> getPopularMovies() async {
    final uri = Uri.https('https://api.themoviedb.org/3/trending/movie/week?api_key=$_apiKey');
    final r = await http.get(uri);
    final response = jsonDecode(r.body) as Map<String, dynamic>;
    return response["results"].map<Movie>((movie) => Movie.fromJSON(movie)).toList();
  }
  // final Dio _dio;
  // DioHelper(this._dio);

  // Future<Map<String, dynamic>> get({required String endPoint}) async {
  //   var response = await _dio.get('$_baseUrl${endPoint}api_key=$_apiKey');
  //   return response.data;
  // }
}
