import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/watch%20list/view/cubit/model/watch_list_repo.dart';
import 'package:movie_app/features/watch%20list/view/cubit/save_model/save_and_fetch_movie_cubit.dart';

import '../../../../core/helper/cache_helper.dart';

class PosterWidget extends StatefulWidget {
  const PosterWidget({super.key, required this.movie, this.width, this.height});

  final Movie movie;
  final double? width;
  final double? height;

  @override
  State<PosterWidget> createState() => _PosterWidgetState();
}

class _PosterWidgetState extends State<PosterWidget> {
  String? uid;

  @override
  void initState() {
    uid = CacheHelper.getData(key: "uid");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: SizedBox(
        width: widget.width ?? 100.w,
        height: widget.height ?? 120.h,
        child: Stack(
          children: [
            SizedBox(
                width: widget.width ?? 100.w,
                height: widget.height ?? 120.h,
                child: Image.network(
                    widget.movie.imageUrl ??
                        "https://png.pngtree.com/thumb_back/fh260/background/20200803/pngtree-abstract-grey-gradient-background-image_382062.jpg",
                    fit: BoxFit.cover)),
            Positioned(
                left: -8,
                top: -5,
                child: GestureDetector(
                  onTap: () {
                    if (WatchListRepository.movies.isEmpty) {
                      BlocProvider.of<SaveAndFetchMovieCubit>(context)
                          .saveMovie(widget.movie, uid ?? "");
                      WatchListRepository.movies.add(widget.movie);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Movie added to watchlist'),
                        duration: Duration(seconds: 1),
                      ));
                      return;
                    }
                    for (var i = 0;
                        i < WatchListRepository.movies.length;
                        i++) {
                      BlocProvider.of<SaveAndFetchMovieCubit>(context)
                          .saveMovie(widget.movie, uid ?? "");
                      if (WatchListRepository.movies[i].description ==
                          widget.movie.description) {
                        break;
                      }
                      if (i == WatchListRepository.movies.length - 1) {
                        BlocProvider.of<SaveAndFetchMovieCubit>(context)
                            .saveMovie(widget.movie, uid ?? "");
                        WatchListRepository.movies.add(widget.movie);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              '${widget.movie.title} Movie added to watchlist'),
                          duration: const Duration(seconds: 1),
                        ));
                        return;
                      }
                    }
                  },
                  child: const Icon(
                    size: 40,
                    Icons.bookmark_add,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
