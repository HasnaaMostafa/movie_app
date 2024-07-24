import 'package:equatable/equatable.dart';
import 'package:movie_app/core/models/movie.dart';

abstract class MovieInfoState extends Equatable {
  const MovieInfoState();

  @override
  List<Object> get props => [];
}

class MovieInfoInitial extends MovieInfoState {
  const MovieInfoInitial();
}

class MovieInfoLoading extends MovieInfoState {
  const MovieInfoLoading();
}

class MovieInfoLoaded extends MovieInfoState {
 
  final List<Movie> movies;
  const MovieInfoLoaded( this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieInfoError extends MovieInfoState {
  final String message;

  const MovieInfoError(this.message);

  @override
  List<Object> get props => [message];
}
