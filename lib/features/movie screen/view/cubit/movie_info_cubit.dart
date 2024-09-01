import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/movie%20screen/model/repository/movie_info_repo.dart';
import 'package:movie_app/features/movie%20screen/view/cubit/movie_info_state.dart';

class MovieInfoCubit extends Cubit<MovieInfoState> {
  MovieInfoCubit() : super(const MovieInfoInitial());

  Future<void> loadSimilarMovies(int movieId) async {
    try {
      emit(const MovieInfoLoading());
      print("1");
      List<Movie> movies = await MovieRepository.getSimilarMovies(movieId);
      print("2");
      emit(MovieInfoLoaded(movies));
      print("3");
    } catch (e) {
      print("4");
      emit(MovieInfoError(e.toString()));
      print("5");
      // Handle error
    }
  }
}
