import 'package:complex_json/services/network_json_placeholder.dart';
import 'package:dio/dio.dart';
import 'package:complex_json/models/users/users_model.dart';

class UsersRepository {
  final ApiClient _apiClient = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  Future<List<UsersModel>> fetchAllUsers() => _apiClient.getAllUsers();
}