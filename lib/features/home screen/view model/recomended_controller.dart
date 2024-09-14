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
      if (ids[i].isEmpty) {
        n--;
      }
    }
    if (n == 0) {
      return [];
    }

    // print(ids);
    List<int> recommendedMoviesIDs = [];
    // I need to check if all lists are empty and movies < 10 then I will return the movies I have

    while (recommendedMoviesIDs.length < 10 && n > 0) {
      for (var i = 0; i < ids.length && recommendedMoviesIDs.length < 10; i++) {
        if (ids[i].isEmpty) {
          continue;
        }
        if (!recommendedMoviesIDs.contains(ids[i].first) 
        // &&
            // !recommendedMoviesIDs.contains(ids[i])
            ) {
          recommendedMoviesIDs.add(ids[i].removeAt(0));
          if (ids[i].isEmpty) {
            n--;
          }
        } else {
          ids[i].removeAt(0);
          if (ids[i].isEmpty) {
            n--;
          }
        }
      }
    }

    List<Movie> movies = [];
    for (var id in recommendedMoviesIDs) {
      final movie = await MovieViewModel.getMovieInfo(id);
      movies.add(movie);
    }

    return movies;
  }
}
