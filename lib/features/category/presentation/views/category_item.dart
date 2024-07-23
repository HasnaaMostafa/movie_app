import 'package:flutter/material.dart';

import '../../../../core/models/app_category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.appCategory});

  final AppCategory appCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      )),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image(image: AssetImage(appCategory.imageUrl)),
          Text(
            appCategory.name,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
