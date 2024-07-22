import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie.dart';
import 'dart:async';

import 'package:movie_app/features/home%20screen/view/widgets/poster_widget.dart';

class BannerView extends StatefulWidget {
  final List<Movie> movies;

  const BannerView({super.key, required this.movies});

  @override
  _BannerViewState createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
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
        duration: const Duration(milliseconds: 300),
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
                        widget.movies[index].imageUrl,
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
                              widget.movies[index].title,
                              style: Theme.of(context).textTheme.headlineLarge,
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
                bottom: 0,
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
