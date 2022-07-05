import 'package:flutter/material.dart';
import 'package:complex_json/movies/movies_bloc/movies_bloc.dart';
import 'package:complex_json/models/popular_movies/popular_movies_model.dart';

class PopularMoviesList extends StatelessWidget {
  PopularMoviesList({Key? key}) : super(key: key);

  final PopularMoviesBloc _popularMoviesBloc = PopularMoviesBloc();

  @override
  Widget build(BuildContext context) {
    _popularMoviesBloc.fetchAllPopularMovies();
    return Scaffold(
      body: StreamBuilder(
          stream: _popularMoviesBloc.fetchPopularMovies,
          builder: (context, AsyncSnapshot<PopularMoviesModel> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.results.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(snapshot.data!.results[index].overview)
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );

  }
}
