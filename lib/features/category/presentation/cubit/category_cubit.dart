
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/category/presentation/view%20model/category_view_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  Future<void> fetchCategories(String categoryId) async {
    emit(CategoryLoading());
    try {
      final List<Movie> movies = await CategoryViewModel.getCategoryMovies(int.parse(categoryId));
      emit(CategoryLoaded(categorMovies: movies ));
    } catch (e) {
      emit(CategoryFailure(message: e.toString()));
    }
  }
}
