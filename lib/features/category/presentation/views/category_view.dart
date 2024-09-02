import 'package:flutter/material.dart';
import 'package:movie_app/core/constant/api_constants.dart' show appCategories;
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
          "Categories",
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
                appCategories.length,
                (item) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CategoryViewDetails(
                                        appCategory: appCategories[item]
                                    )));
                      },
                      child: CategoryItem(
                        appCategory: appCategories[item],
                      ),
                    )),
          )
        ]),
      ),
    );
  }
}
