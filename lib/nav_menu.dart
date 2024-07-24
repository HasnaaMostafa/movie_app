import 'package:flutter/material.dart';
import 'package:movie_app/features/home%20screen/view/home_screen.dart';

import 'features/category/presentation/views/category_view.dart';

class NavMenuScreen extends StatefulWidget {
  const NavMenuScreen({super.key});

  @override
  _NavMenuScreenState createState() => _NavMenuScreenState();
}

class _NavMenuScreenState extends State<NavMenuScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const Text(
      'Search Page',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    CategoryScreen(),
    Text(
      'Watch List',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: Icon(Icons.book),
            label: 'WatchList',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[700]
            : Colors.grey[200],
        onTap: _onItemTapped,
      ),
    );
  }
}
