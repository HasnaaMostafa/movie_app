import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/core/utils/theme.dart';
import 'package:movie_app/features/home%20screen/view/widgets/poster_widget.dart';

class MovieInfoScreen extends StatefulWidget {
  final Movie movie;

  const MovieInfoScreen({super.key, required this.movie});

  @override
  _MovieInfoScreenState createState() => _MovieInfoScreenState();
}

class _MovieInfoScreenState extends State<MovieInfoScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.movie.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 240.h,
            width: 1.sw,
            child: Stack(
              children: [
                Image.network(widget.movie.imageUrl,
                    height: 240.h, width: 1.sw, fit: BoxFit.cover),
                Container(
                  color: Colors.black.withOpacity(0.4),
                  child: Center(
                    child: Icon(
                      Icons.play_circle,
                      color: Colors.white,
                      size: 50.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 3.0.h),
          Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: 3.0.h),
                  Text(
                    widget.movie.releaseDate,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 12.sp, color: Colors.grey),
                  ),
                  SizedBox(height: 18.0.h),
                  Row(children: [
                    PosterWidget(
                      movie: widget.movie,
                      width: 150.w,
                      height: 220.h,
                    ),
                    const CategoryText(text: 'Action'),
                  ]),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      SizedBox(height: 3.0.h),
                      Text(
                        widget.movie.rating.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.0.h),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2.0.h),
                  AnimatedCrossFade(
                    firstChild: Text(
                      widget.movie.description ?? "No Description",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    secondChild:
                        Text(widget.movie.description ?? "No Description"),
                    crossFadeState: _isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 200),
                  ),
                  const SizedBox(height: 8.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Text(
                      _isExpanded ? 'Show Less' : 'Show More',
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class CategoryText extends StatelessWidget {
  const CategoryText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 6.0.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey),
        ),
        child:
            Text(text, style: TextStyle(fontSize: 16.sp, color: Colors.grey)));
  }
}
