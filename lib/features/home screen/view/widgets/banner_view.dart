import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/home%20screen/view/widgets/poster_widget.dart';

class BannerView extends StatefulWidget {
  final List<Movie> movies;

  const BannerView({super.key, required this.movies});

  @override
  BannerViewState createState() => BannerViewState();
}

class BannerViewState extends State<BannerView> {
  late PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);

    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < widget.movies.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        widget.movies[index].backgroundUrl ??
                            "https://img.freepik.com/free-photo/gray-grunge-surface-wall-texture-background_1017-18216.jpg",
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                        height: 200.h,
                        width: 1.sw,
                      ),
                      Container(
                        width: 1.sw,
                        height: 200.h,
                        color: Colors.black.withOpacity(0.5),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 150.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: Text(
                              widget.movies[index].title.length > 30
                                  ? '${widget.movies[index].title.substring(0, 30)}...'
                                  : widget.movies[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontSize: 15.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: Text(
                              widget.movies[index].releaseDate,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Positioned(
                bottom: 0.h,
                left: 15.w,
                child: PosterWidget(
                  movie: widget.movies[index],
                  height: 160.h,
                  width: 120.w,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
