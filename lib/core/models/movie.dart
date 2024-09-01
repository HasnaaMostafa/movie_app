import 'package:movie_app/core/constant/api_constants.dart'
    show categoriesMapNames;
import 'package:movie_app/core/models/app_category.dart';

class Movie {
  final int id;
  final String title;
  final String? imageUrl;
  final String releaseDate;
  final double rating;
  final String? description;
  List<AppCategory> categories;
  final String? backgroundUrl;
  Movie(
      {this.backgroundUrl,
      required this.id,
      this.categories = const [],
      required this.releaseDate,
      required this.rating,
      required this.title,
      this.imageUrl,
      this.description});

  // Factory constructor to create a Movie instance from JSON data
  factory Movie.fromJson(Map<String, dynamic> json) {
    // Mapping genre_ids from JSON to AppCategory instances
    List<AppCategory> categories = [];
    if (json['genre_ids'] != null) {
      categories = (json['genre_ids'] as List)
          .map((e) => AppCategory(
                id: e,
                name: categoriesMapNames[e] ?? "Category Name",
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAS_m9Nxcvps_JexD3GgYob0Omkub3Fo1d4A&s',
              ))
          .toList();
    }

    return Movie(
      id: json['id'],
      title: json['title'] ?? "No titile",
      imageUrl: json['poster_path'] != null
          ? 'https://image.tmdb.org/t/p/w500${json['poster_path']}'
          : "https://img.freepik.com/free-photo/gray-grunge-surface-wall-texture-background_1017-18216.jpg",
      backgroundUrl: json['backdrop_path'] != null
          ? 'https://image.tmdb.org/t/p/w500${json['backdrop_path']}'
          : "https://img.freepik.com/free-photo/gray-grunge-surface-wall-texture-background_1017-18216.jpg",
      releaseDate: json['release_date'] ?? "No release date",
      rating: json['vote_average'] != null
          ? (json['vote_average'] as num).toDouble()
          : 0.0,
      description: json['overview'],
      categories: categories,
    );
  }
}
