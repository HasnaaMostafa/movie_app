import 'package:movie_app/features/home%20screen/model/movie.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Movie> bannerMovies;
  final List<Movie> popularMovies;
  final List<Movie> recommendedMovies;

  HomeLoaded(this.bannerMovies, this.popularMovies, this.recommendedMovies);
}
