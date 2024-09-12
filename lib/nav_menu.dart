import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/home%20screen/view/home_screen.dart';
import 'package:movie_app/features/profile/presentation/view/profile_view.dart';
import 'package:movie_app/features/search%20screen/cubit/search_cubit.dart';
import 'package:movie_app/features/search%20screen/view/search_screen.dart';

import 'features/category/presentation/views/category_view.dart';

class NavMenuScreen extends StatefulWidget {
  const NavMenuScreen({super.key});

  @override
  State<NavMenuScreen> createState() => NavMenuScreenState();
}

class NavMenuScreenState extends State<NavMenuScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    BlocProvider(
      create: (context) => SearchCubit(),
      child: const SearchScreen(),
    ),
    const CategoryScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[700]
              : Colors.grey[200],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
