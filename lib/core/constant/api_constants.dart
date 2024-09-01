import 'package:movie_app/core/models/app_category.dart';

String baseUrl = "https://api.themoviedb.org/";
String bearer = "Bearer ";
String apiKey = "f40f1fb325c12c2fbfcc257fdcf158f9";
//https://api.themoviedb.org/3/movie/popular?api_key=f40f1fb325c12c2fbfcc257fdcf158f9
///
// b1dcd7ea37508ddb34099a26032083b5
///
///
// categoris map names
Map<int, String> categoriesMapNames = {
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

// categoris map images
Map<int, String> categoriesMapImages = {
  28: "https://www.premiumbeat.com/blog/wp-content/uploads/2019/07/John-Wick.jpg",
  12: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5LbVUWGvhGGJM7UidNBaKr1Rv_LicS7pAsA&s",
  16: "https://nextbestpicture-com.b-cdn.net/wp-content/uploads/2024/06/Despicable-Me-2-scaled.jpg",
  35: "https://www.premiumbeat.com/blog/wp-content/uploads/2020/02/Charlie-Chaplin-1.jpg",
  80: "https://s.studiobinder.com/wp-content/uploads/2019/11/73-Best-Crime-Movies-Featured-StudioBinder-min.jpg",
  99: "https://pbblogassets.s3.amazonaws.com/uploads/2016/05/Types-of-Documentary-Cover.jpg",
  18: "https://nofilmschool.com/media-library/explore-the-drama-genre-in-film-and-television.jpg?id=34065346&width=1200&height=600&coordinates=0%2C0%2C0%2C120",
  10751:
      "https://livelovetexas.com/wp-content/uploads/2018/03/50-Best-Movies-for-Family-Movie-Night-Girls-1024x739.jpg.webp",
  14: "https://www.premiumbeat.com/blog/wp-content/uploads/2020/01/Genre-Theory.jpg?w=875&h=490&crop=1",
  36: "https://www.hollywoodinsider.com/wp-content/uploads/2021/06/Hollywood-Insider-Historical-Epic-Movies-Gladiator-Braveheart-Alexander-1.jpg",
  27: "https://upload.wikimedia.org/wikipedia/en/b/ba/NosferatuShadow.jpg",
  10402:
      "https://www.hollywoodinsider.com/wp-content/uploads/2021/10/The-Hollywood-Insider-Movie-Musical-Genre.png",
  9648:
      "https://dnm.nflximg.net/api/v6/2DuQlx0fM4wd1nzqm5BFBi6ILa8/AAAAQV65hzqirG2XrkCIWUk-pUg72vGG5zXTXdcI5nkZvWPV5PLYhD6WIMOXl3-sgkh7s-CNxzEJ3816kf_XS2kIyuNl9EwT_8tKIpJuP7CYkR4mFdxXV52DFaN7fMtRuGxIqds6RuAU1qESqU8haOeIBF6a.jpg?r=04f",
  10749:
      "https://www.premiumbeat.com/blog/wp-content/uploads/2020/04/titanic-cover.jpg",
  878:
      "https://www.premiumbeat.com/blog/wp-content/uploads/2020/02/Back-to-the-Future-1.jpg",
  10770:
      "https://s.studiobinder.com/wp-content/uploads/2022/11/Movie-Genres-Types-of-Movies-List-of-Genres-and-Categories-Featured.jpg",
  53: "https://s.studiobinder.com/wp-content/uploads/2020/05/Best-Thriller-Movies-of-All-Time-Ranked-for-Filmmakers-Featured.jpg",
  10752:
      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/The_Battle_of_the_Somme_film_image1.jpg/300px-The_Battle_of_the_Somme_film_image1.jpg",
  37: "https://www.hollywoodreporter.com/wp-content/uploads/2022/12/MMDBUAN_EC002-H-2022.jpg?w=1296"
};

List<AppCategory> appCategories = [
  AppCategory(id: 28, name: "Action", imageUrl: categoriesMapImages[28]!),
  AppCategory(id: 12, name: "Adventure", imageUrl: categoriesMapImages[12]!),
  AppCategory(id: 16, name: "Animation", imageUrl: categoriesMapImages[16]!),
  AppCategory(id: 35, name: "Comedy", imageUrl: categoriesMapImages[35]!),
  AppCategory(id: 80, name: "Crime", imageUrl: categoriesMapImages[80]!),
  AppCategory(id: 99, name: "Documentary", imageUrl: categoriesMapImages[99]!),
  AppCategory(id: 18, name: "Drama", imageUrl: categoriesMapImages[18]!),
  AppCategory(id: 10751, name: "Family", imageUrl: categoriesMapImages[10751]!),
  AppCategory(id: 14, name: "Fantasy", imageUrl: categoriesMapImages[14]!),
  AppCategory(id: 36, name: "History", imageUrl: categoriesMapImages[36]!),
  AppCategory(id: 27, name: "Horror", imageUrl: categoriesMapImages[27]!),
  AppCategory(id: 10402, name: "Music", imageUrl: categoriesMapImages[10402]!),
  AppCategory(id: 9648, name: "Mystery", imageUrl: categoriesMapImages[9648]!),
  AppCategory(
      id: 10749, name: "Romance", imageUrl: categoriesMapImages[10749]!),
  AppCategory(
      id: 878, name: "Science Fiction", imageUrl: categoriesMapImages[878]!),
  AppCategory(
      id: 10770, name: "TV Movie", imageUrl: categoriesMapImages[10770]!),
  AppCategory(id: 53, name: "Thriller", imageUrl: categoriesMapImages[53]!),
  AppCategory(id: 10752, name: "War", imageUrl: categoriesMapImages[10752]!),
  AppCategory(id: 37, name: "Western", imageUrl: categoriesMapImages[37]!),
];
