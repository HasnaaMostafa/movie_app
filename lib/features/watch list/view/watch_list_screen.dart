import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/cache_helper.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/movie%20screen/view/movie_info.dart';
import 'package:movie_app/features/watch%20list/view/cubit/save_model/save_and_fetch_movie_cubit.dart';
import 'package:movie_app/features/watch%20list/view/cubit/watch_list_cubit.dart';
import 'package:movie_app/features/watch%20list/view/cubit/watch_list_states.dart';
import 'package:movie_app/features/watch%20list/view/widgets/movie_card_watch_list.dart';

import '../../../core/models/movie.dart';

class Watchlist extends StatefulWidget {
  const Watchlist({super.key});

  @override
  WatchlistState createState() => WatchlistState();
}

class WatchlistState extends State<Watchlist> {
  String? uid;
  @override
  void initState() {
    uid = CacheHelper.getData(key: "uid");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WatchListCubit()..loadMovies(),
      child: BlocBuilder<WatchListCubit, WatchListState>(
        builder: (context, state) {
          if (state is WatchListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WatchListLoaded || state is WatchListInitial) {
            return BlocBuilder<SaveAndFetchMovieCubit, List<Movie>>(
              builder: (context, movies) {
                return ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return Dismissible(
                      key: Key(movie.title),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) async {
                        await context
                            .read<SaveAndFetchMovieCubit>()
                            .deleteMovie(movie, uid ?? "");
                        setState(() {
                          movies.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 1),
                            content: Text('${movie.title} removed'),
                          ),
                        );
                      },
                      background: Container(
                        color: AppColors.primaryColor,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MovieInfoScreen(movie: movie),
                            ),
                          );
                        },
                        child: MovieCardWatchList(movie: movie),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is WatchListError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
