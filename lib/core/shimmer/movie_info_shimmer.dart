import 'package:flutter/material.dart';
import 'package:movie_app/core/shimmer/shimmer_loader.dart';

class MovieInfoShimmer extends StatelessWidget {
  const MovieInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            child: ShimmerLoaderEffect(width: double.infinity, height: 250),
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 150,
              child: ShimmerLoaderEffect(width: 150, height: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 5,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 200,
              child: ShimmerLoaderEffect(width: 200, height: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const ShimmerLoaderEffect(width: 100, height: 230),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[850]
                : Colors.grey[200],
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("More Like this",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ShimmerLoaderEffect(width: 100, height: 120),
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
