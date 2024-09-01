part of 'category_cubit.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  final List<Movie> categorMovies;
  CategoryLoaded({required this.categorMovies});
}

final class CategoryFailure extends CategoryState {
  final String message;
  CategoryFailure({required this.message});
}
