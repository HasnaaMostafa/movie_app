import 'package:equatable/equatable.dart';


abstract class WatchListState extends Equatable {
  const WatchListState();

  @override
  List<Object> get props => [];
}

class WatchListLoading extends WatchListState {}
class WatchListInitial extends WatchListState {}

class WatchListLoaded extends WatchListState {


  const WatchListLoaded();

}

class WatchListError extends WatchListState {
  final String message;

  const WatchListError(this.message);

  @override
  List<Object> get props => [message];
}