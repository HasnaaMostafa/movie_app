import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/core/shimmer/movie_info_shimmer.dart';
import 'package:movie_app/features/home%20screen/view/widgets/category_widget.dart';
import 'package:movie_app/features/home%20screen/view/widgets/poster_widget.dart';
import 'package:movie_app/features/movie%20screen/cubit/movie_info_state.dart';
import 'package:movie_app/features/movie%20screen/view/widgets/category_text.dart';

import '../cubit/movie_info_cubit.dart';

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
    return BlocBuilder<MovieInfoCubit, MovieInfoState>(
      builder: (context, state) {
        if (state is MovieInfoLoading) {
          return const Scaffold(
              body: Center(child: MovieInfoShimmer()));
        } else if (state is MovieInfoLoaded) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(
                widget.movie.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 240.h,
                    width: 1.sw,
                    child: Stack(
                      children: [
                        Image.network(
                            widget.movie.backgroundUrl ??
                                "https://img.freepik.com/free-photo/gray-grunge-surface-wall-texture-background_1017-18216.jpg",
                            height: 240.h,
                            width: 1.sw,
                            fit: BoxFit.cover),
                        state.data.$2.homePageUrl!.isNotEmpty
                            ? Container(
                                color: Colors.black.withOpacity(0.4),
                                child: Center(
                                  child: Icon(
                                    Icons.play_circle,
                                    color: Colors.white,
                                    size: 50.sp,
                                  ),
                                ),
                              )
                            : const SizedBox()
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
                          Text(
                              "Original Title: ${state.data.$2.originalTitle ?? ""}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontSize: 13.sp)),
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.sp),
                                      child: SizedBox(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.56,
                                        child: ListView(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          children: List.generate(
                                              (widget.movie.categories).length,
                                              (index) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  right: 8.0.sp, bottom: 8.sp),
                                              child: CategoryText(
                                                  text: widget.movie
                                                      .categories[index].name),
                                            );
                                          }),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0.sp),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AnimatedCrossFade(
                                            firstChild: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.56,
                                              child: Text(
                                                widget.movie.description ??
                                                    "No Description",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            secondChild: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.56,
                                              child: Text(
                                                widget.movie.description ??
                                                    "No Description",
                                              ),
                                            ),
                                            crossFadeState: _isExpanded
                                                ? CrossFadeState.showSecond
                                                : CrossFadeState.showFirst,
                                            duration: const Duration(
                                                milliseconds: 200),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _isExpanded = !_isExpanded;
                                              });
                                            },
                                            child: Text(
                                              _isExpanded
                                                  ? 'Show Less'
                                                  : 'Show More',
                                              style: const TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
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
                                            style:
                                                const TextStyle(fontSize: 18),
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
                  CategorySection(
                      withMoreInfoForMovieCard: true,
                      title: "More Like this",
                      movies: state.data.$1)
                ],
              ),
            ),
          );
        } else if (state is MovieInfoError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
