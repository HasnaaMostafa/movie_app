import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home%20screen/cubits/home_state.dart';
import 'package:movie_app/core/models/movie.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> fetchMovies() async {
    await Future.delayed(const Duration(seconds: 3));
    // Example data
    final bannerMovies = [
      Movie(
          description:
              "This is a description of the movie 6 This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 7.6,
          releaseDate: "2017",
          title: 'Guardians of the Galaxy Vol. 2',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg'),
      Movie(
          description:
              "This is a description of the movie 6 This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 8.5,
          title: 'Movie 2',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s',
          releaseDate: '1990'),
    ];
    final popularMovies = [
      Movie(
          description:
              "This is a description of the movie 6 This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 8.5,
          releaseDate: "1990",
          title: 'Movie 3',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(
          rating: 8.5,
          releaseDate: "1990",
          title: 'Movie 4',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
    ];
    final recommendedMovies = [
      Movie(
          description:
              "This is a description of the movie 6 This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 8.92,
          releaseDate: "1990",
          title: 'Movie 5',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(
          description:
              "This is a description of the movie 6 This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 4,
          releaseDate: "1990",
          title: 'Movie 6',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(
          description:
              "This is a description of the movie 6 This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 8.92,
          releaseDate: "1990",
          title: 'Movie 5',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(
          description:
              "This is a description of the movie 6 This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 4,
          releaseDate: "1990",
          title: 'Movie 6',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(
          description:
              "This is a description of the movie 6 This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 8.92,
          releaseDate: "1990",
          title: 'Movie 5',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(
          description:
              "This is a description of the movie 6 This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 4,
          releaseDate: "1990",
          title: 'Movie 6',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
    ];
    emit(HomeLoaded(bannerMovies, popularMovies, recommendedMovies));
    print("oooo");
  }
}
