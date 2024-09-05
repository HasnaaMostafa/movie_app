import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/movie.dart';

class SaveAndFetchMovieCubit extends Cubit<List<Movie>> {
  SaveAndFetchMovieCubit(this._firestore) : super([]);

  final FirebaseFirestore _firestore;

  Future<void> fetchMovies({required String uid}) async {
    try {
      final snapshot = await _firestore
          .collection('movies')
          .where('userId', isEqualTo: uid)
          .get();
      final movies =
          snapshot.docs.map((doc) => Movie.fromJson(doc.data())).toList();
      emit(movies);
    } catch (error) {
      emit([]);
      print('Error fetching movies: $error');
    }
  }

  Future<void> saveMovie(Movie movie, String uid) async {
    try {
      await _firestore.collection('movies').doc(movie.id.toString()).set({
        'title': movie.title,
        'id': movie.id,
        'poster_path': movie.imageUrl,
        'backdrop_path': movie.backgroundUrl,
        'release_date': movie.releaseDate,
        'vote_average': movie.rating,
        'overview': movie.description,
        'genre_ids': movie.categories.map((cat) => cat.id).toList(),
        'userId': uid
      });
      fetchMovies(uid: uid);
    } catch (error) {
      print('Error saving movie: $error');
    }
  }
}
