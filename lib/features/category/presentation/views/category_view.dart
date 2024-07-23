import 'package:flutter/material.dart';
import 'package:movie_app/core/models/app_category.dart';
import 'package:movie_app/features/category/presentation/views/category_item.dart';
import 'package:movie_app/features/category/presentation/views/category_view_details.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Category",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          GridView.count(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 5 / 3,
            padding: EdgeInsets.zero,
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            children: List.generate(
                12,
                (item) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const CategoryViewDetails()));
                      },
                      child: CategoryItem(
                        appCategory: AppCategory(
                            imageUrl: "assets/images/movie.jpeg",
                            name: "Family"),
                      ),
                    )),
          )
        ]),
      ),
    );
  }
}
