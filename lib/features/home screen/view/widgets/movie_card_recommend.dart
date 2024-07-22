import 'package:flutter/material.dart';
import 'package:movie_app/features/home%20screen/model/movie.dart';

class MovieCardRecommend extends StatelessWidget {
  final Movie movie;

  const MovieCardRecommend({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(movie.imageUrl,
              width: 120, height: 150, fit: BoxFit.cover),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.yellow),
              Text(movie.rating.toStringAsFixed(1)),
            ],
          ),
          Text(movie.title),
          Text(movie.releaseDate),
        ],
      ),
    );
  }
}
