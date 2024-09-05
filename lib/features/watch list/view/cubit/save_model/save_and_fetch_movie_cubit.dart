import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/features/movie%20screen/view%20model/movie_info_repo.dart';

import '../../../../../core/models/movie.dart';

class SaveAndFetchMovieCubit extends Cubit<List<Movie>> {
  SaveAndFetchMovieCubit(this._firestore) : super([]);

  final FirebaseFirestore _firestore;

  Future<void> fetchMovies({required String uid}) async {
    try {
      final snapshot = await _firestore.collection('users').doc(uid).get();
      final data = snapshot.data()?['movies'] ?? [];
      List<Movie> movies = [];
      for (var id in data) {
        final movie =await MovieViewModel.getMovieInfo(id);
        movies.add(movie);
      }
      print("----------------------nader-----------------------");
      print(movies);
      emit(movies);
    } catch (error) {
      emit([]);
      print('Error fetching movies: $error');
    }
  }

  Future<void> saveMovie(Movie movie) async {
    try {
      // save movie's id for the user data
      await _firestore.collection('users').doc(uId).set({
        'movies': FieldValue.arrayUnion([movie.id])
      }, SetOptions(merge: true));
      fetchMovies(uid: uId ?? "");
    } catch (error) {
      print('Error saving movie: $error');
    }
  }
  Future<void> deleteMovie(Movie movie) async {
    try {
      // dete movie's id for the user data
      await _firestore.collection('users').doc(uId).set({
        'movies': FieldValue.arrayRemove([movie.id])
      }, SetOptions(merge: true));
    } catch (error) {
      print('Error deleting movie: $error');
    }
  }


}
