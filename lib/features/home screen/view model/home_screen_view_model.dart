import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/core/helper/cache_helper.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/core/network/dio_network.dart';
import 'package:movie_app/core/network/end_points.dart';
import 'package:movie_app/features/home%20screen/view%20model/recomended_controller.dart';

class HomeScreenViewModel {
  static List<List<int>> ids = [];
  static bool isloading = false;
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

  static Future<List<Movie>> featchingRecomendedMovies() async {
    return await RecomendedMovie().getRecomendedMovies(ids);
  }

  static Future<List<List<int>>> fetchListOfIDsOfRecomendedMovies() async {
    final uid = CacheHelper.getData(key: "uid");
    if (uid != null) {
      final snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      final data = snapshot.data()?['recomendedMovies'] ?? {};
      for (var id in data.values) {
        List<int> intIds = [];
        for (var i in id) {
          int nu = int.parse(i);
          intIds.add(nu);
        }
        ids.add(intIds);
      }
    }
    print("----------------------nader-----------------------");
    print(ids);
    return ids;
  }

  static resetVariables() {
    isloading = false;
    ids = [];
  }
}


