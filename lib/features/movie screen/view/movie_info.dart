import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/home%20screen/view/widgets/poster_widget.dart';
import 'package:movie_app/features/movie%20screen/view/widgets/category_text.dart';
import 'package:movie_app/features/movie%20screen/view/widgets/related_movies_category_widget.dart';

class MovieInfoScreen extends StatefulWidget {
  final Movie movie;

  const MovieInfoScreen({super.key, required this.movie});

  @override
  MovieInfoScreenState createState() => MovieInfoScreenState();
}

class MovieInfoScreenState extends State<MovieInfoScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          widget.movie.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 240.h,
            width: 1.sw,
            child: Stack(
              children: [
                Image.network(widget.movie.backgroundUrl ?? "https://img.freepik.com/free-photo/gray-grunge-surface-wall-texture-background_1017-18216.jpg",
                    height: 240.h, width: 1.sw, fit: BoxFit.cover),
                Container(
                  color: Colors.black.withOpacity(0.4),
                  child: Center(
                    child: Icon(
                      Icons.play_circle,
                      color: Colors.white,
                      size: 50.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 3.0.h),
          Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: 3.0.h),
                  Text(
                    widget.movie.releaseDate,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 12.sp, color: Colors.grey),
                  ),
                  SizedBox(height: 18.0.h),
                  SizedBox(
                    width: 1.sw,
                    height: 180.h,
                    child: Row(children: [
                      PosterWidget(
                        movie: widget.movie,
                        width: 110.w,
                        height: 190.h,
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.sp),
                              child: SizedBox(
                                width: 250.w,
                                child: Wrap(
                                  children: List.generate(
                                      (widget.movie.categories).length,
                                      (index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          right: 8.0.sp, bottom: 8.sp),
                                      child: CategoryText(
                                          text: widget
                                              .movie.categories[index].name),
                                    );
                                  }),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 250.w,
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 8.0.sp),
                                child: AnimatedCrossFade(
                                  firstChild: Text(
                                    widget.movie.description ??
                                        "No Description",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  secondChild: Text(widget.movie.description ??
                                      "No Description"),
                                  crossFadeState: _isExpanded
                                      ? CrossFadeState.showSecond
                                      : CrossFadeState.showFirst,
                                  duration: const Duration(milliseconds: 200),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isExpanded = !_isExpanded;
                                  });
                                },
                                child: Text(
                                  _isExpanded ? 'Show Less' : 'Show More',
                                  style: const TextStyle(color: Colors.blue),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.sp),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 21.sp,
                                  ),
                                  SizedBox(width: 10.0.w),
                                  Text(
                                    widget.movie.rating.toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              )),
          const MoviesByCategoryWidget()
        ],
      ),
    );
  }
}


