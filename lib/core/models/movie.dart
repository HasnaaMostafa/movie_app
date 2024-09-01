import 'package:movie_app/core/models/app_category.dart';

class Movie {
  final int id ;
  final String title;
  final String imageUrl;
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
      required this.imageUrl,
      this.description});

  // Factory constructor to create a Movie instance from JSON data
  factory Movie.fromJson(Map<String, dynamic> json) {
    // Mapping genre_ids from JSON to AppCategory instances
    List<AppCategory> categories = [];
    if (json['genre_ids'] != null) {
      categories = (json['genre_ids'] as List)
          .map((e) => AppCategory(
                id: e,
                name: categoriesMap[e] ?? "Category Name",
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAS_m9Nxcvps_JexD3GgYob0Omkub3Fo1d4A&s',
              ))
          .toList();
    }

    return Movie(
      id: json['id'],
      title: json['title'],
      imageUrl: 'https://image.tmdb.org/t/p/w500${json['poster_path']}',
      backgroundUrl: 'https://image.tmdb.org/t/p/w500${json['backdrop_path']}',
      releaseDate: json['release_date'],
      rating: (json['vote_average'] as num).toDouble(),
      description: json['overview'],
      categories: categories,
    );
  }
}

Map<int, String> categoriesMap = {
  28: "Action",
  12: "Adventure",
  16: "Animation",
  35: "Comedy",
  80: "Crime",
  99: "Documentary",
  18: "Drama",
  10751: "Family",
  14: "Fantasy",
  36: "History",
  27: "Horror",
  10402: "Music",
  9648: "Mystery",
  10749: "Romance",
  878: "Science Fiction",
  10770: "TV Movie",
  53: "Thriller",
  10752: "War",
  37: "Western"
};
