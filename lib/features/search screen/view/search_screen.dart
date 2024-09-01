import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movie%20screen/cubit/movie_info_cubit.dart';
import 'package:movie_app/features/movie%20screen/view/movie_info.dart';
import 'package:movie_app/features/search%20screen/cubit/search_cubit.dart';
import 'package:movie_app/features/watch%20list/view/widgets/movie_card_watch_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  String query = '';

  void updateSearchQuery(String newQuery) {
    setState(() {
      query = newQuery;
    });

    if (query.isNotEmpty) {
      BlocProvider.of<SearchCubit>(context).fetchMovies(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: updateSearchQuery,
                decoration: InputDecoration(
                  hintText: 'Search by title',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchLoaded) {
                    return ListView.builder(
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => MovieInfoCubit()
                                    ..loadSimilarMovies(state.movies[index].id),
                                  child: MovieInfoScreen(
                                    movie: state.movies[index],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: MovieCardWatchList(movie: state.movies[index]),
                        );
                      },
                    );
                  } else if (state is SearchFailed) {
                    return Center(
                      child: Text('Failed to load movies: ${state.message}'),
                    );
                  } else {
                    return const Center(child: Text('Start searching for movies!'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

