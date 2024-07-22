import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoaderEffect extends StatelessWidget {
  const ShimmerLoaderEffect(
      {super.key,
      required this.width,
      required this.height,
      this.raduis = 15,
      this.color});
  final double width, height, raduis;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.surfaceContainer,
        highlightColor: Theme.of(context).colorScheme.surfaceContainerHigh,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color ?? Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(raduis)),
        ));
  }
}
