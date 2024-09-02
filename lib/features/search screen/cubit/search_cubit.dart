import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/search%20screen/view%20model/search_view_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  Future<void> fetchMovies(String query) async {
    emit(SearchLoading());

    try {
      List<Movie> movies = await SearchViewModel.getMovies(query);
      emit(SearchLoaded(movies));
    } catch (e) {
      emit(SearchFailed(e.toString()));
      // Handle error
    }
  }
}
