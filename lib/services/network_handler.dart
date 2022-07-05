import 'package:dio/dio.dart';
import 'package:complex_json/services/endpoints.dart';
import 'package:complex_json/models/popular_movies/popular_movies_model.dart';
import 'package:retrofit/http.dart';

part 'network_handler.g.dart';

@RestApi(baseUrl: "http://api.themoviedb.org/3/")
abstract class ApiClient {
  static const String _apiKey = "6aeeaa63a0a3724d80bfab9e47da6d1b";
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/movie${EndPoints.popular}?api_key=$_apiKey&language=en-US&page=1/")
  Future<PopularMoviesModel> getPopularMovies();
}