import 'package:elearning/constant/color.dart';
import 'package:elearning/constant/size.dart';
import 'package:elearning/view/home/home_screen.dart';
import 'package:elearning/view/mycourses/mycourses_screen.dart';
import 'package:elearning/view/myfaverite/myfaverite.dart';
import 'package:elearning/view/profile/profile.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static String route = "MainScreen";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MyCoursesScreen(),
    MyFavoriteScreen(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kPrimaryColor,
            backgroundColor: Colors.white54,
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home_rounded,
                  size: kBottomNavigationBarItemSize,
                ),
                icon: Icon(
                  Icons.home_outlined,
                  size: kBottomNavigationBarItemSize,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.book,
                  size: kBottomNavigationBarItemSize,
                ),
                icon: Icon(
                  Icons.book_outlined,
                  size: kBottomNavigationBarItemSize,
                ),
                label: "My Courses",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  size: kBottomNavigationBarItemSize,
                ),
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: kBottomNavigationBarItemSize,
                ),
                label: "My Favorite",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.person,
                  size: kBottomNavigationBarItemSize,
                ),
                icon: Icon(
                  Icons.person_outlined,
                  size: kBottomNavigationBarItemSize,
                ),
                label: "Profile",
              ),
            ]),
      ),
    );
  }
}
