import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/core/network/dio_network.dart';
import 'package:movie_app/core/network/end_points.dart';

class HomeScreenViewModel {
  String firstCagtegory = 'New Releses';
  String secondCategoryText = 'Recommended';
  String searchText = 'Search for a movie';

// featch data
static Future<List<Movie>> featchingPopularMovies() async {
  DioApiService dioApiService = DioApiService();
  final response = await dioApiService.getRequest(EndPoints.popular);
  List<Movie> movies = [];
  if (response.statusCode == 200) {
    final data = response.data;
    data['results'].forEach((movie) {
      movies.add(Movie.fromJson(movie));
    });
  }
  return movies;
}
// featch data
static Future<List<Movie>> featchingBannerMovies() async {
  DioApiService dioApiService = DioApiService();
  final response = await dioApiService.getRequest(EndPoints.trending);
  List<Movie> movies = [];
  if (response.statusCode == 200) {
    final data = response.data;
    data['results'].forEach((movie) {
      movies.add(Movie.fromJson(movie));
    });
  }
  return movies;
}



}