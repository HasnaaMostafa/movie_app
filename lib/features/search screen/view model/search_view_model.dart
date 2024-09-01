import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/core/network/dio_network.dart';
import 'package:movie_app/core/network/end_points.dart';

class SearchViewModel {
  static Future<List<Movie>> getMovies(String query) async {
    try {
      DioApiService dioApiService = DioApiService();
      var response = await dioApiService.getRequest(EndPoints.search(query, 1));
      List<Movie> movies = [];
      if (response.statusCode == 200) {
        final data = response.data;
        data['results'].forEach((movie) {
          movies.add(Movie.fromJson(movie));
        });
      }

      return movies;
    } catch (e) {
      rethrow;
    }
  }
}
