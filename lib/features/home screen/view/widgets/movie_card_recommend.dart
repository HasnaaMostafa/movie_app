import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/home%20screen/view/widgets/poster_widget.dart';

class MovieCardRecommend extends StatelessWidget {
  final Movie movie;
  final Function()? onPress;
  const MovieCardRecommend({super.key, required this.movie, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PosterWidget(movie: movie),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Icon(Icons.star, size: 18.sp, color: Colors.yellow),
                SizedBox(width: 5.w),
                Text(
                  movie.rating.toStringAsFixed(2),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            Text(
              movie.title.length > 15
                  ? "${movie.title.substring(0, 15)}.."
                  : movie.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              movie.releaseDate,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
