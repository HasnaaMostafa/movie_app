import 'package:bloc/bloc.dart';
import 'package:movie_app/features/home%20screen/cubits/home_state.dart';
import 'package:movie_app/features/home%20screen/model/movie.dart';

class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel() : super(HomeInitial());

  void fetchMovies() {
    // Example data
    final bannerMovies = [
      Movie(
          rating: 7.6,
          releaseDate: "2017",
          title: 'Guardians of the Galaxy Vol. 2',
          imageUrl:
              'https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg'),
      Movie(
          rating: 8.5,
          title: 'Movie 2',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s',
          releaseDate: '1990'),
    ];
    final popularMovies = [
      Movie(
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
          rating: 8.92,
          releaseDate: "1990",
          title: 'Movie 5',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(
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
