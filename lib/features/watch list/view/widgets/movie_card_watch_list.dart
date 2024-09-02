
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie.dart';

class MovieCardWatchList extends StatelessWidget {
  final Movie movie;

  const MovieCardWatchList({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                movie.imageUrl??"https://png.pngtree.com/thumb_back/fh260/background/20200803/pngtree-abstract-grey-gradient-background-image_382062.jpg",
                width: 100.w,
                height: 120.w,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    movie.releaseDate,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    movie.description != null && movie.description!.length > 80
                        ? '${movie.description!.substring(0, 80)}...'
                        : movie.description ?? '',
                    style:
                        TextStyle(fontSize: 14.0.sp, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
