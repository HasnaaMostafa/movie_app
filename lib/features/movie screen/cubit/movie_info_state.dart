import 'package:movie_app/core/models/movie.dart';

abstract class MovieInfoState {
  const MovieInfoState();

  List<Object> get props => [];
}

class MovieInfoInitial extends MovieInfoState {
  const MovieInfoInitial();
}

class MovieInfoLoading extends MovieInfoState {
  const MovieInfoLoading();
}

class MovieInfoLoaded extends MovieInfoState {
  final ( List<Movie> ,  Movie ) data;
  // final List<Movie> movies;
  const MovieInfoLoaded(this.data);

  @override
  List<Object> get props => [data.$1, data.$2];
}

class MovieInfoError extends MovieInfoState {
  final String message;

  const MovieInfoError(this.message);

  @override
  List<Object> get props => [message];
}
