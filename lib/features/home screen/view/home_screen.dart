import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home%20screen/cubits/home_state.dart';
import 'package:movie_app/features/home%20screen/cubits/home_viewmodel.dart';
import 'package:movie_app/features/home%20screen/view/search_screen.dart';
import 'package:movie_app/features/home%20screen/view/widgets/banner_view.dart';
import 'package:movie_app/features/home%20screen/view/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => HomeViewModel()..fetchMovies(),
        child: BlocBuilder<HomeViewModel, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    BannerView(movies: state.bannerMovies),
                    CategorySection(
                      title: 'Popular Movies',
                      movies: state.popularMovies,
                    ),
                    CategorySection(
                      title: 'Recommended Movies',
                      movies: state.recommendedMovies,
                      withMoreInfoForMovieCard: true,
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
