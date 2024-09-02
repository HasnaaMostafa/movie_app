import 'package:movie_app/core/models/movie.dart';

class AppCategory {
  final int id;
  final String name;
  final String imageUrl;
  static List<Movie> movies = [];
  AppCategory({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}
