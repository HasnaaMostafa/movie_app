import 'package:movie_app/core/models/movie.dart';

class WatchListRepository {
  static List<Movie> movies = [];
  static bool isLoaded = false;
  static Future<void> getMovies() async {
    // await Future.delayed(const Duration(seconds: 2));
    //TODO get movies from database
    print("getstttttttttts");
  }
}
