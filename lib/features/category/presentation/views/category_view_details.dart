import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/app_category.dart';
import 'package:movie_app/features/category/presentation/cubit/category_cubit.dart';
import 'package:movie_app/features/home%20screen/view/widgets/poster_widget.dart';
import 'package:movie_app/features/movie%20screen/cubit/movie_info_cubit.dart';
import 'package:movie_app/features/movie%20screen/view/movie_info.dart';

class CategoryViewDetails extends StatelessWidget {
  final AppCategory appCategory;
  const CategoryViewDetails({super.key, required this.appCategory});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CategoryCubit()..fetchCategories(appCategory.id.toString()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            appCategory.name,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoryLoaded) {
              final movies = state.categorMovies;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 10,
                      color: Colors.grey[200],
                      width: double.infinity,
                    ),
                    GridView.count(
                      mainAxisSpacing: 15,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      childAspectRatio: 2.6 / 3,
                      padding: const EdgeInsets.all(10),
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      children: List.generate(
                        movies.length,
                        (index) {
                          final movie = movies[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                            create: (context) =>
                                                MovieInfoCubit()..loadSimilarMovies(movie.id),
                                            child:
                                                MovieInfoScreen(movie: movie),
                                          )));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: PosterWidget(
                                movie: movie,
                                width: 120.w,
                                height: 150.h,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is CategoryFailure) {
              return Center(
                  child: Text('Failed to load movies: ${state.message}'));
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}
