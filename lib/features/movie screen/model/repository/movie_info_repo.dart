import 'package:movie_app/core/models/movie.dart';

class MovieRepository {
  static Future<List<Movie>> getMoviesByCategory(String category) async {
    print(22);
    print(23);
    await Future.delayed(const Duration(seconds: 2));
    print(24);
    print(25);
    return [
      Movie(
          description:
              "This is a description of the movie 6 This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 8.92,
          releaseDate: "1990",
          title: 'Movie 5',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(
          description:
              "This is a description of the movie 6 This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 4,
          releaseDate: "1990",
          title: 'Movie 6',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(
          description:
              "This is a description of the movie 6 This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 8.92,
          releaseDate: "1990",
          title: 'Movie 5',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(
          description:
              "This is a description of the movie 6 This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 4,
          releaseDate: "1990",
          title: 'Movie 6',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(
          description:
              "This is a description of the movie 6 This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 8.92,
          releaseDate: "1990",
          title: 'Movie 5',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
      Movie(
          description:
              "This is a description of the movie 6 This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6This is a description of the movie 6 ",
          rating: 4,
          releaseDate: "1990",
          title: 'Movie 6',
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAyYvxzNliKlaETVVAiwNtjdSdASYafHcwDg&s'),
    ];
  }
}
