import 'dart:developer';

import 'package:complex_json/models/popular_movies/popular_movies_model.dart';
import 'package:complex_json/services/network_handler.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PopularMoviesRepository {
  final ApiClient _apiClient =
      ApiClient(Dio(BaseOptions(contentType: "application/json")));

  Future<PopularMoviesModel> fetchPopularMovies() =>
      _apiClient.getPopularMovies();

/*  PopularMoviesRepository () {
    log(fetchPopularMovies().toString());
  }*/

  dynamic requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");

    options.headers.addAll({"Token": "$token${DateTime.now()}"});

    return options;
  }

  dynamic responseInterceptor(RequestOptions options) async {
    if (options.headers.containsKey("requiresToken")) {
      //remove the auxiliary header
      options.headers.remove("requiresToken");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      var header = prefs.get("Header");

      options.headers.addAll({"Header": "$header${DateTime.now()}"});

      return options;
    }

    Dio dio = Dio();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler
              .resolve(Response(requestOptions: options, data: 'fake data'));
        },
      ),
    );

    Response response = await dio.get('/test');
    log(response.data); // 'fake data'



    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onError: (DioError e, handler) {
      // Do something with response error
      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
    }));
  }
}

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    return super.onError(err, handler);
  }
}
