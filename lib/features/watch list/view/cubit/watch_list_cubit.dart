import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/watch%20list/view/cubit/model/watch_list_repo.dart';
import 'package:movie_app/features/watch%20list/view/cubit/watch_list_states.dart';

class WatchListCubit extends Cubit<WatchListState> {
  WatchListCubit() : super(WatchListInitial());

  Future<void> loadMovies() async {
    if (!WatchListRepository.isLoaded) {
      WatchListRepository.isLoaded = true;
      try {
        emit(WatchListLoading());
        await WatchListRepository.getMovies();
        emit(const WatchListLoaded());
      } catch (e) {
        emit(const WatchListError('Failed to load movies from watch list.'));
      }
    }
  }
}
