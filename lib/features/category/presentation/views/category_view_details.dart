import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/app_category.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/features/home%20screen/view/widgets/movie_card.dart';
import 'package:movie_app/features/home%20screen/view/widgets/poster_widget.dart';

import 'category_item.dart';

class CategoryViewDetails extends StatelessWidget {
  final AppCategory appCategory;
  const CategoryViewDetails({super.key, required this.appCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          appCategory.name,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
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
                  30,
                  (item) => GestureDetector(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: PosterWidget(
                            movie: Movie(
                                id: 15,
                                title: "Movie",
                                imageUrl:
                                    "https://image.tmdb.org/t/p/w500/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
                                releaseDate: "2021-09-28",
                                description: "Movie Description",
                                rating: 8.5),
                            width: 120.w,
                            height: 150.h,
                          ),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
