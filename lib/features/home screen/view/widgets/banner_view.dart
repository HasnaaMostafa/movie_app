import 'package:flutter/material.dart';
import 'package:movie_app/features/home%20screen/model/movie.dart';
import 'dart:async';

class BannerView extends StatefulWidget {
  final List<Movie> movies;

  const BannerView({super.key, required this.movies});

  @override
  _BannerViewState createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  late PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);

    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < widget.movies.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          return Image.network(widget.movies[index].imageUrl,
              fit: BoxFit.cover);
        },
      ),
    );
  }
}
