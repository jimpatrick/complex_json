import 'package:json_annotation/json_annotation.dart';

part 'popular_movies_data.g.dart';

@JsonSerializable(createToJson: false)
class PopularMoviesData {
  PopularMoviesData({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  factory PopularMoviesData.fromJson(Map<String, dynamic> json) => _$PopularMoviesDataFromJson(json);
}