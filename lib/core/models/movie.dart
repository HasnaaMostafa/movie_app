import 'package:movie_app/core/models/app_category.dart';

class Movie {
  final String title;
  final String imageUrl;
  final String releaseDate;
  final double rating;
  final String? description;
  List<AppCategory> categories;

  Movie(
      {this.categories = const [],
      required this.releaseDate,
      required this.rating,
      required this.title,
      required this.imageUrl,
      this.description});
}
