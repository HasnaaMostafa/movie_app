import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home%20screen/view%20model/home_screen_view_model.dart';
import 'package:movie_app/features/movie%20screen/view%20model/movie_info_repo.dart';

import '../../../../../core/models/movie.dart';

class SaveAndFetchMovieCubit extends Cubit<List<Movie>> {
  SaveAndFetchMovieCubit(this._firestore) : super([]);

  final FirebaseFirestore _firestore;

  Future<void> fetchMovies({required String uid}) async {
    try {
      final snapshot = await _firestore.collection('users').doc(uid).get();
      final data = snapshot.data()?['recomendedMovies'] ?? {};
      List<Movie> movies = [];
      List<int> ids = [];
      // adding ids for saved movies as the keys of the recomended movies map in the user data
      for (var id in data.keys) {
        int intid = int.parse(id);
        ids.add(intid);
      }
      for (var id in ids) {
        final movie = await MovieViewModel.getMovieInfo(id);
        movies.add(movie);
      }

      emit(movies);
    } catch (error) {
      emit([]);
      print('Error fetching movies: $error');
    }
  }

  Future<void> saveMovie(Movie movie, String uid) async {
    try {
      HomeScreenViewModel.resetVariables();
      List<String> recomendedMovieIDs =
          await RecomendedMovie.getRecomendedMoviesIDsForOneMovie(movie.id);
      // save recomended movies in user data by movie id as a key and list of recomended movies ids as a value
      // for example: {movie.id: [id1, id2, id3]}
      await _firestore.collection('users').doc(uid).set({
        'recomendedMovies': {movie.id.toString(): recomendedMovieIDs}
      }, SetOptions(merge: true));

      fetchMovies(uid: uid);
    } catch (error) {
      print('Error saving movie: $error');
    }
  }

  Future<void> deleteMovie(Movie movie, String uid) async {
    HomeScreenViewModel.resetVariables();
    try {
      // dete movie's id for the user data
      await _firestore.collection('users').doc(uid).set({
        'movies': FieldValue.arrayRemove([movie.id])
      }, SetOptions(merge: true));
      fetchMovies(uid: uid);
    } catch (error) {
      print('Error deleting movie: $error');
    }
  }
}
