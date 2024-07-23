import 'package:flutter/material.dart';
import 'package:movie_app/core/models/app_category.dart';

import 'category_item.dart';

class CategoryViewDetails extends StatelessWidget {
  const CategoryViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Category",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          GridView.count(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 2.3 / 3,
            padding: EdgeInsets.zero,
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            children: List.generate(
                12,
                (item) => GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CategoryItem(
                              appCategory: AppCategory(
                                name: "",
                                imageUrl: "assets/images/film.jpeg",
                              ),
                            ),
                            const Text("Under Paris"),
                            const Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 12,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("5.745")
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
