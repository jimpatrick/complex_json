import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:complex_json/models/users/users_model.dart';

part 'network_json_placeholder.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/users")
  Future<List<UsersModel>> getAllUsers();
}