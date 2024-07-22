import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie.dart';

class PosterWidget extends StatelessWidget {
  PosterWidget({super.key, required this.movie, this.width, this.height});

  final Movie movie;
  double? width;
  double? height;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: SizedBox(
        width: width ?? 100.w,
        height: height ?? 120.h,
        child: Stack(
          children: [
            SizedBox(
                width: width ?? 100.w,
                height: height ?? 120.h,
                child: Image.network(movie.imageUrl, fit: BoxFit.cover)),
            const Positioned(
                left: -8,
                top: -5,
                child: Icon(
                  size: 40,
                  Icons.bookmark_add,
                  color: Colors.black38,
                )),
          ],
        ),
      ),
    );
  }
}
