import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/movie%20screen/view/cubit/movie_info_cubit.dart';
import 'package:movie_app/features/movie%20screen/view/movie_info.dart';
import 'package:movie_app/features/watch%20list/view/widgets/movie_card_watch_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  String query = '';
  List<Movie> movies = [];
  bool isLoading = false;

  Future<void> searchMovies(String query) async {
    movies = [
      Movie(id:533535,
          description:
              "This is a description of the mois is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 8.92,
          releaseDate: "1990",
          title: 'Movie 5',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(id:533535,
          description:
              "This is a description of the movie 6 This is a descriptmovie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 4,
          releaseDate: "1990",
          title: 'Movie 6',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(id:533535,
          description:
              "This is a description of the movie 6 This is an of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 8.92,
          releaseDate: "1990",
          title: 'Movie 5',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(id:533535,
          description:
              "This is a description of the movie 6 This ition of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 4,
          releaseDate: "1990",
          title: 'Movie 6',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(id:533535,
          description:
              "This is a description of the movie 6 Thicription of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 8.92,
          releaseDate: "1990",
          title: 'Movie 5',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(id:533535,
          description:
              "This is a description of the movie movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 4,
          releaseDate: "1990",
          title: 'Movie 6',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
    ];
    // setState(() {
    //   isLoading = true;
    // });

    // final response = await http.get(
    //   Uri.parse('https://yourapi.com/search?query=$query'),
    // );

    // if (response.statusCode == 200) {
    //   final List<dynamic> jsonResponse = json.decode(response.body);
    //   setState(() {
    // movies = jsonResponse.map((data) => Movie.fromJson(data)).toList();
    //     isLoading = false;
    //   });
    // } else {
    //   throw Exception('Failed to load movies');
    // }
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      query = newQuery;
    });

    if (query.isNotEmpty) {
      searchMovies(query);
    } else {
      setState(() {
        movies = [];
      });
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
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                    create: (context) => MovieInfoCubit()
                                      ..loadSimilarMovies(movies[index].id),
                                    child: MovieInfoScreen(
                                      movie: movies[index],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: MovieCardWatchList(movie: movies[index]));
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
