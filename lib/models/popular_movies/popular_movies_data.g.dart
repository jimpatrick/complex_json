// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMoviesData _$PopularMoviesDataFromJson(Map<String, dynamic> json) =>
    PopularMoviesData(
      adult: json['adult'] as bool,
      backdropPath: json['backdropPath'] as String,
      genreIds:
          (json['genreIds'] as List<dynamic>).map((e) => e as int).toList(),
      id: json['id'] as int,
      originalLanguage: json['originalLanguage'] as String,
      originalTitle: json['originalTitle'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['posterPath'] as String,
      releaseDate: DateTime.parse(json['releaseDate'] as String),
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: json['voteCount'] as int,
    );
