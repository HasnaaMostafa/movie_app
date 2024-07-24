


abstract class WatchListState  {
  const WatchListState();

}

class WatchListLoading extends WatchListState {}
class WatchListInitial extends WatchListState {}

class WatchListLoaded extends WatchListState {


  const WatchListLoaded();

}

class WatchListError extends WatchListState {
  final String message;

  const WatchListError(this.message);

}