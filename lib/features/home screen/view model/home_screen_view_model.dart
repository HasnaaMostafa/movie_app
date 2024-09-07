import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/core/helper/cache_helper.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/core/network/dio_network.dart';
import 'package:movie_app/core/network/end_points.dart';
import 'package:movie_app/features/movie%20screen/view%20model/movie_info_repo.dart';

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
    // print("----------------------nader-----------------------");
    // print(ids);
    return ids;
  }

  static resetVariables() {
    isloading = false;
    ids = [];
  }
}

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
    print(ids);
    List<Movie> movies = [];
    int numberOfMoviesFromEachMovie =
        (((1 / ids.length)) * 10).toInt();
    // if the number of movies from each movie is 0 then we will get one movie from each movie
    // it may happen if the number of movies is less than the number of movies we want to get from each movie
    numberOfMoviesFromEachMovie == 0 ? numberOfMoviesFromEachMovie = 1 : null;
    for (var id in ids) {
      for (int i = 0; i < numberOfMoviesFromEachMovie && i < id.length; i++) {
        final movie = await MovieViewModel.getMovieInfo(id[i]);
        movies.add(movie);
        print(movie.title);
      }
    }
    return movies;
  }
}
