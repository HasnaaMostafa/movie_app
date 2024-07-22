import 'package:flutter/material.dart';
import 'package:movie_app/features/home%20screen/model/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(movie.imageUrl,
              width: 100, height: 150, fit: BoxFit.cover),
        ],
      ),
    );
  }
}
