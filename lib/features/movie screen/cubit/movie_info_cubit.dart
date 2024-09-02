import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/movie%20screen/view%20model/movie_info_repo.dart';
import 'package:movie_app/features/movie%20screen/cubit/movie_info_state.dart';

class MovieInfoCubit extends Cubit<MovieInfoState> {
  MovieInfoCubit() : super(const MovieInfoInitial());

  Future<void> loadSimilarMovies(int movieId) async {
    try {
      emit(const MovieInfoLoading());
      List<Movie> movies = await MovieViewModel.getSimilarMovies(movieId);
      emit(MovieInfoLoaded(movies));
    } catch (e) {
      emit(MovieInfoError(e.toString()));
      // Handle error
    }
  }
}
