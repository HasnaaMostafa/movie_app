import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/home%20screen/cubits/home_state.dart';
import 'package:movie_app/features/home%20screen/view%20model/home_screen_view_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> fetchMovies() async {
    if (HomeScreenViewModel.isloading) {
      if (!isClosed) {
        emit(HomeLoaded(
          CachingLoadedData.bannerMovies,
          CachingLoadedData.popularMovies,
          CachingLoadedData.recommendedMovies,
        ));
      }
      return;
    }

    print("object==============================================");
    print("===object==============================================");
    print(HomeScreenViewModel.isloading);
    print("====object==============================================");

    await HomeScreenViewModel.fetchListOfIDsOfRecomendedMovies();

    final bannerMovies = await HomeScreenViewModel.featchingPopularMovies();
    final popularMovies = await HomeScreenViewModel.featchingBannerMovies();
    final List<Movie>  recommendedMovies = [];
    // await HomeScreenViewModel.featchingRecomendedMovies();

    HomeScreenViewModel.isloading = true;
    CachingLoadedData.bannerMovies = bannerMovies;
    CachingLoadedData.popularMovies = popularMovies;
    CachingLoadedData.recommendedMovies = recommendedMovies;

    if (!isClosed) {
      emit(HomeLoaded(bannerMovies, popularMovies, recommendedMovies));
    }
  }
}

class CachingLoadedData {
  static List<Movie> bannerMovies = [];
  static List<Movie> popularMovies = [];
  static List<Movie> recommendedMovies = [];
}
