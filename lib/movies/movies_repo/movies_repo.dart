import 'dart:developer';

import 'package:complex_json/models/popular_movies/popular_movies_model.dart';
import 'package:complex_json/services/network_handler.dart';
import 'package:dio/dio.dart';

class PopularMoviesRepository {
  final ApiClient _apiClient = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  Future<PopularMoviesModel> fetchPopularMovies() => _apiClient.getPopularMovies();

/*  PopularMoviesRepository () {
    log(fetchPopularMovies().toString());
  }*/
}