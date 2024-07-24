import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/watch%20list/view/cubit/model/watch_list_repo.dart';

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
            Positioned(
                left: -8,
                top: -5,
                child: GestureDetector(
                  onTap: () {
                    if (WatchListRepository.movies.isEmpty) {
                      WatchListRepository.movies.add(movie);
                    }
                    for (var i = 0;
                        i < WatchListRepository.movies.length;
                        i++) {
                      if (WatchListRepository.movies[i].description ==
                          movie.description) {
                        break;
                      }
                      if (i == WatchListRepository.movies.length - 1) {
                        WatchListRepository.movies.add(movie);
                      }
                    }
                  },
                  child: const Icon(
                    size: 40,
                    Icons.bookmark_add,
                    color: Colors.black38,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
