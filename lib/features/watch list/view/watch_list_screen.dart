import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/watch%20list/view/cubit/model/watch_list_repo.dart';
import 'package:movie_app/features/watch%20list/view/cubit/watch_list_cubit.dart';
import 'package:movie_app/features/watch%20list/view/cubit/watch_list_states.dart';
import 'package:movie_app/features/watch%20list/view/widgets/movie_card_watch_list.dart';

class Watchlist extends StatefulWidget {
  const Watchlist({super.key});

  @override
  WatchlistState createState() => WatchlistState();
}

class WatchlistState extends State<Watchlist> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => WatchListCubit()..loadMovies(), child: BlocBuilder<WatchListCubit, WatchListState>(
      builder: (context, state) {
        if (state is WatchListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WatchListLoaded|| state is WatchListInitial) {
          return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: WatchListRepository.movies.length,
      itemBuilder: (context, index) {
        final movie = WatchListRepository.movies[index];
        return Dismissible(
          key: Key(movie.title), // Ensure each movie has a unique key
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            setState(() {
             WatchListRepository. movies.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                content: Text('${movie.title} removed'),
              ),
            );
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: MovieCardWatchList(movie: movie),
        );
      },
    );
        } else if (state is WatchListError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    ));
  }
}
