// movies_by_category_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/core/shimmer/shimmer_loader.dart';
import 'package:movie_app/features/home%20screen/view/widgets/category_widget.dart';
import 'package:movie_app/features/movie%20screen/view/cubit/movie_info_cubit.dart';
import 'package:movie_app/features/movie%20screen/view/cubit/movie_info_state.dart';
import 'package:shimmer/shimmer.dart';

class MoviesByCategoryWidget extends StatelessWidget {
  const MoviesByCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieInfoCubit, MovieInfoState>(
      builder: (context, state) {
        if (state is MovieInfoLoading) {
          return Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: ShimmerLoaderEffect(
              width: 1.sw,
              height: 200.h,
            ),
          );
        } else if (state is MovieInfoLoaded) {
          return CategorySection(
              withMoreInfoForMovieCard: true,
              title: "More Like this",
              movies: state.movies);
        } else if (state is MovieInfoError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
