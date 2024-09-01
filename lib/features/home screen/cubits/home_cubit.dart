import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/end_points.dart';
import 'package:movie_app/core/models/app_category.dart';
import 'package:movie_app/core/network/dio_network.dart';
import 'package:movie_app/features/home%20screen/cubits/home_state.dart';
import 'package:movie_app/core/models/movie.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> fetchMovies() async {
    await Future.delayed(const Duration(seconds: 3));

    // Example data
    final bannerMovies = await featchingPopularMovies();
    final popularMovies = await featchingBannerMovies();
    // [
    //   Movie(
    //       categories: [
    //         AppCategory(
    //             name: "Action",
    //             imageUrl:
    //                 "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAS_m9Nxcvps_JexD3GgYob0Omkub3Fo1d4A&s"),
    //         AppCategory(
    //             name: "Action",
    //             imageUrl:
    //                 "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAS_m9Nxcvps_JexD3GgYob0Omkub3Fo1d4A&s"),
    //         AppCategory(
    //             name: "Action",
    //             imageUrl:
    //                 "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAS_m9Nxcvps_JexD3GgYob0Omkub3Fo1d4A&s")
    //       ],
    //       description:
    //           "This is a description of hie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
    //       rating: 8.5,
    //       releaseDate: "1990",
    //       title: 'Movie 3',
    //       imageUrl:
    //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
    //   Movie(
    //       categories: [
    //         AppCategory(
    //             name: "Action",
    //             imageUrl:
    //                 "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAS_m9Nxcvps_JexD3GgYob0Omkub3Fo1d4A&s"),
    //         AppCategory(
    //             name: "Action",
    //             imageUrl:
    //                 "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAS_m9Nxcvps_JexD3GgYob0Omkub3Fo1d4A&s"),
    //         AppCategory(
    //             name: "Action",
    //             imageUrl:
    //                 "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAS_m9Nxcvps_JexD3GgYob0Omkub3Fo1d4A&s")
    //       ],
    //       description:
    //           "This is a description of the movovs is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
    //       rating: 8.5,
    //       releaseDate: "1990",
    //       title: 'Movie 4',
    //       imageUrl:
    //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
    // ];
    final recommendedMovies = [
      Movie(id:533535,
          description:
              "This is a description of the mois is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 8.92,
          releaseDate: "1990",
          title: 'Movie 5',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(id:533535,
          description:
              "This is a description of the movie 6 This is a descriptmovie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 4,
          releaseDate: "1990",
          title: 'Movie 6',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(id:533535,
          description:
              "This is a description of the movie 6 This is an of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 8.92,
          releaseDate: "1990",
          title: 'Movie 5',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(id:533535,
          description:
              "This is a description of the movie 6 This ition of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 4,
          releaseDate: "1990",
          title: 'Movie 6',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(id:533535,
          description:
              "This is a description of the movie 6 Thicription of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 8.92,
          releaseDate: "1990",
          title: 'Movie 5',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(id:533535,
          description:
              "This is a description of the movie movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 4,
          releaseDate: "1990",
          title: 'Movie 6',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
    ];
    emit(HomeLoaded(bannerMovies, popularMovies, recommendedMovies));
  }
}

// featch data
Future<List<Movie>> featchingPopularMovies() async {
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
Future<List<Movie>> featchingBannerMovies() async {
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
