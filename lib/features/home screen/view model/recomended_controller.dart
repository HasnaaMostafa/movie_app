import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/movie%20screen/view%20model/movie_info_repo.dart';

class RecomendedMovie {
  static Future<List<String>> getRecomendedMoviesIDsForOneMovie(int id) async {
    List<Movie> movies = await MovieViewModel.getSimilarMovies(id);
    List<String> ids = movies.map((e) => e.id.toString()).toList();
    return ids;
  }

  Future<List<Movie>> getRecomendedMovies(List<List<int>> ids) async {
    if (ids.isEmpty) {
      return [];
    }
    int n = ids.length;
    for (var i = 0; i < ids.length; i++) {
      if(ids[i].isEmpty){
        n--;
      }
    }
    if (n == 0) {
      return [];
    }

    // print(ids);
    List<Movie> movies = [];
    int numberOfMoviesFromEachMovie = (((1 / n)) * 10).toInt();
    // if the number of movies from each movie is 0 then we will get one movie from each movie
    // it may happen if the number of movies is less than the number of movies we want to get from each movie
    numberOfMoviesFromEachMovie == 0 ? numberOfMoviesFromEachMovie = 1 : null;
    for (var id in ids) {
      for (int i = 0; i < numberOfMoviesFromEachMovie && i < id.length; i++) {
        final movie = await MovieViewModel.getMovieInfo(id[i]);
        movies.add(movie);
        // print(movie.title);
      }
    }
    return movies;
  }
}