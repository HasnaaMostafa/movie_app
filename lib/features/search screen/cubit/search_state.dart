part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
final  List<Movie> movies;
  SearchLoaded(this.movies);
}
final class SearchFailed extends SearchState {
  final String message;
  SearchFailed(this.message);
}
