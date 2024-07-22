import 'package:flutter/material.dart';
import 'package:movie_app/features/home%20screen/model/movie.dart';
import 'package:movie_app/features/home%20screen/view/widgets/movie_card.dart';
import 'package:movie_app/features/home%20screen/view/widgets/movie_card_recommend.dart';

class CategorySection extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  bool? withMoreInfoForMovieCard;

  CategorySection(
      {super.key,
      this.withMoreInfoForMovieCard,
      required this.title,
      required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                children: movies.map((movie) {
                  if (withMoreInfoForMovieCard ?? false) {
                    return MovieCardRecommend(movie: movie);
                  } else {
                    return MovieCard(movie: movie);
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