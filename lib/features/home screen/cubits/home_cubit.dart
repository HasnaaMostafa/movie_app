import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home%20screen/cubits/home_state.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/home%20screen/view%20model/home_screen_view_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> fetchMovies() async {
    await Future.delayed(const Duration(seconds: 3));

    // Example data
    final bannerMovies = await HomeScreenViewModel.featchingPopularMovies();
    final popularMovies = await HomeScreenViewModel.featchingBannerMovies();
    final recommendedMovies = [
      Movie(
          id: 533535,
          description:
              "This is a description of the mois is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 8.92,
          releaseDate: "1990",
          title: 'Movie 5',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(
          id: 533535,
          description:
              "This is a description of the movie 6 This is a descriptmovie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 4,
          releaseDate: "1990",
          title: 'Movie 6',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(
          id: 533535,
          description:
              "This is a description of the movie 6 This is an of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 8.92,
          releaseDate: "1990",
          title: 'Movie 5',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(
          id: 533535,
          description:
              "This is a description of the movie 6 This ition of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 4,
          releaseDate: "1990",
          title: 'Movie 6',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(
          id: 533535,
          description:
              "This is a description of the movie 6 Thicription of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 8.92,
          releaseDate: "1990",
          title: 'Movie 5',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(
          id: 533535,
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
