import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/shimmer/home_screen_shimmer.dart';
import 'package:movie_app/features/home%20screen/cubits/home_cubit.dart';
import 'package:movie_app/features/home%20screen/cubits/home_state.dart';
import 'package:movie_app/features/home%20screen/view%20model/home_screen_view_model.dart';
import 'package:movie_app/features/home%20screen/view/widgets/banner_view.dart';
import 'package:movie_app/features/home%20screen/view/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenViewModel model = HomeScreenViewModel();
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => HomeCubit()..fetchMovies(),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      BannerView(movies: state.bannerMovies),
                      CategorySection(
                        title: model.firstCagtegory,
                        movies: state.popularMovies,
                      ),
                      CategorySection(
                        title: model.secondCategoryText,
                        movies: state.recommendedMovies,
                        withMoreInfoForMovieCard: true,
                      ),
                    ],
                  ),
                );
              }
              return const HomeScreenShimmer();
            },
          ),
        ),
      ),
    );
  }
}
