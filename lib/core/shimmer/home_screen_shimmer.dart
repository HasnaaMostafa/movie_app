import 'package:flutter/material.dart';
import 'package:movie_app/core/shimmer/shimmer_loader.dart';
import 'package:movie_app/features/home%20screen/view%20model/home_screen_view_model.dart';

class HomeScreenShimmer extends StatelessWidget {
  const HomeScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenViewModel model = HomeScreenViewModel();
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            child: ShimmerLoaderEffect(width: double.infinity, height: 250),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.firstCagtegory,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ShimmerLoaderEffect(width: 100, height: 150),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.secondCategoryText,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ShimmerLoaderEffect(width: 120, height: 220),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
