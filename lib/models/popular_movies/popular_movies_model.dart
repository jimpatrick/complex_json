import 'package:json_annotation/json_annotation.dart';
import 'package:complex_json/models/popular_movies/popular_movies_data.dart';

part 'popular_movies_model.g.dart';

@JsonSerializable(createToJson: false)
class PopularMoviesModel {
  PopularMoviesModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<PopularMoviesData> results;
  int totalPages;
  int totalResults;

  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) => _$PopularMoviesModelFromJson(json);
}

/*
    "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
*/
