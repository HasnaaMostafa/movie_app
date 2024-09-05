import 'package:movie_app/core/constant/api_constants.dart';

class EndPoints {
  static String popular =
      '/3/movie/popular?api_key=$apiKey&include_adult=false';
  static const String newRelease = '/3/movie/upcoming';
  static const String recommended = '/3/movie/top_rated';
  static String trending =
      '/3/trending/movie/day?api_key=$apiKey&include_adult=false';
  static const String details = '/3/movie';
  static String similar(int movieId) =>
      '/3/movie/$movieId/recommendations?api_key=$apiKey&include_adult=false';
  static String movieDetails(int movieId) =>
      '/3/movie/$movieId?api_key=$apiKey&include_adult=false';
  static const String movieList = '/3/genre/movie/list';
  static const String discoverMovie = '/3/discover/movie';
  static String search(String query, int page) =>
      '/3/search/movie?query=$query&include_adult=false&language=en-US&page=$page&api_key=$apiKey';
  static String categoryMovies(int id, int page) =>
      '/3/discover/movie?api_key=$apiKey&include_adult=false&with_genres=$id&language=en-US&page=$page';
}
// get category movies by id
// https://api.themoviedb.org/3/discover/movie?api_key=f40f1fb325c12c2fbfcc257fdcf158f9&with_genres=28&language=en-US




///to find a movie by id
///[https://api.themoviedb.org/3/movie/17?api_key=b1dcd7ea37508ddb34099a26032083b5]
///



/// to show image 
/// https://image.tmdb.org/t/p/w220_and_h330_face/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg



// access token
// eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMWRjZDdlYTM3NTA4ZGRiMzQwOTlhMjYwMzIwODNiNSIsIm5iZiI6MTcyNTAxOTAyMS43NTMzMTUsInN1YiI6IjY2OWQ2YTIzNjU4Y2EwNWViYzZjODk5YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PZXqaj3r-wPV2Xvd0fx51z8aAfn9lydRc8FBPLJshf8



// popular movies
// https://api.themoviedb.org/3/movie/popular

// upcomming
// https://api.themoviedb.org/3/movie/upcoming



// movie details  by id
// https://api.themoviedb.org/3/movie/533535?api_key=f40f1fb325c12c2fbfcc257fdcf158f9



// similar movies
// https://api.themoviedb.org/3/movie/533535/similar?api_key=f40f1fb325c12c2fbfcc257fdcf158f9




// serach moives by quiery
// https://api.themoviedb.org/3/search/movie?query=world&include_adult=false&language=en-US&page=1



// trending this week 
// https://api.themoviedb.org/3/trending/movie/week?api_key=f40f1fb325c12c2fbfcc257fdcf158f9