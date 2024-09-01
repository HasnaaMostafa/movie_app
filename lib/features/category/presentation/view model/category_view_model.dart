import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/core/network/dio_network.dart';
import 'package:movie_app/core/network/end_points.dart';

class CategoryViewModel {
  static Future<List<Movie>> getCategoryMovies(int categoryId) async {
    DioApiService dioService = DioApiService();
    try {
      final response =
          await dioService.getRequest(EndPoints.categoryMovies(categoryId));
      List<Movie> movies = [];
      if (response.statusCode == 200) {
        movies = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
      }
      return movies;
    } catch (e) {
      rethrow;
    }
  }
}
