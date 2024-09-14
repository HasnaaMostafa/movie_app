import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/home%20screen/view/widgets/movie_card.dart';
import 'package:movie_app/features/home%20screen/view/widgets/movie_card_recommend.dart';
import 'package:movie_app/features/movie%20screen/cubit/movie_info_cubit.dart';
import 'package:movie_app/features/movie%20screen/view/movie_info.dart';

class CategorySection extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final bool? withMoreInfoForMovieCard;

  const CategorySection(
      {super.key,
      this.withMoreInfoForMovieCard,
      required this.title,
      required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[850]
          : Colors.grey[200],
      margin: EdgeInsets.only(top: 20.h),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: movies.isEmpty
                    ? [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 80.h,
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "No recomended movies avaliable fot your watch list.\nTry to add some movies.",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600]),
                            ),
                          ),
                        )
                      ]
                    : movies.map((movie) {
                        if (withMoreInfoForMovieCard ?? false) {
                          return MovieCardRecommend(
                            movie: movie,
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                    create: (context) => MovieInfoCubit()
                                      ..loadSimilarMovies(movie.id),
                                    child: MovieInfoScreen(
                                      movie: movie,
                                    ),
                                  ),
                                ),
                              );
                              // print(movie.title);
                            },
                          );
                        } else {
                          return MovieCard(
                              movie: movie,
                              onPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => MovieInfoCubit()
                                        ..loadSimilarMovies(movie.id),
                                      child: MovieInfoScreen(
                                        movie: movie,
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                      }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
