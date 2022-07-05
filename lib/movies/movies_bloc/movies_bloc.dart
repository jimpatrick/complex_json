import 'package:complex_json/models/popular_movies/popular_movies_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:complex_json/movies/movies_repo/movies_repo.dart';

class PopularMoviesBloc {
  final _popularMoviesFetcher = PublishSubject<PopularMoviesModel>();
  final PopularMoviesRepository _popularMoviesRepository =
      PopularMoviesRepository();

  Stream<PopularMoviesModel> get fetchPopularMovies =>
      _popularMoviesFetcher.stream;

  fetchAllPopularMovies() async {
    dynamic data = await _popularMoviesRepository.fetchPopularMovies();
    _popularMoviesFetcher.sink.add(data);
  }

  void dispose() {
    _popularMoviesFetcher.close();
  }
}
