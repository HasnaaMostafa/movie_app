import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/home%20screen/view/widgets/category_widget.dart';
import 'package:movie_app/features/home%20screen/view/widgets/poster_widget.dart';
import 'package:movie_app/features/movie%20screen/view/cubit/movie_info_cubit.dart';
import 'package:movie_app/features/movie%20screen/view/cubit/movie_info_state.dart';
import 'package:movie_app/features/movie%20screen/view/widgets/related_movies_category_widget.dart';

class MovieInfoScreen extends StatefulWidget {
  final Movie movie;

  const MovieInfoScreen({super.key, required this.movie});

  @override
  _MovieInfoScreenState createState() => _MovieInfoScreenState();
}

class _MovieInfoScreenState extends State<MovieInfoScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Image.network(widget.movie.imageUrl,
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
                                    maxLines: 2,
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

class CategoryText extends StatelessWidget {
  const CategoryText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 6.0.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey),
        ),
        child:
            Text(text, style: TextStyle(fontSize: 13.sp, color: Colors.grey)));
  }
}
