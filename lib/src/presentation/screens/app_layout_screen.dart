import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movieapp/src/presentation/screens/categories_screen/categories_screen.dart';
import 'package:movieapp/src/presentation/screens/favorite_screen/search_screen.dart';
import 'package:movieapp/src/presentation/screens/main_home_screen/movies_screen.dart';
import 'package:movieapp/src/presentation/screens/profile_screen/profile_screen.dart';

class AppLayOutScreen extends StatefulWidget {
  const AppLayOutScreen({Key? key}) : super(key: key);

  @override
  State<AppLayOutScreen> createState() => _AppLayOutScreenState();
}

class _AppLayOutScreenState extends State<AppLayOutScreen> {

  final List<Widget> screens = [
    const MainMoviesScreen(),
    const CategoriesScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: _bottomNavBar(),
    );
  }


  Widget _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      elevation: 0,
      selectedItemColor: Colors.black,
      //backgroundColor: Colors.grey.shade900,
      items: [
        BottomNavigationBarItem(
        //  backgroundColor: Colors.grey.shade900,
          activeIcon: const Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
          ),
          label: '',
          icon: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SvgPicture.asset(
              'assets/icons/home.svg',
              fit: BoxFit.contain,
              color: Colors.white,
              width: 20,
            ),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: const Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Text(
              "Category",
              style: TextStyle(color: Colors.white),
            ),
          ),
          label: '',
          icon: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SvgPicture.asset(
              'assets/icons/category.svg',
              fit: BoxFit.contain,
              color: Colors.white,
              width: 20,
            ),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: const Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Text(
              "Favorite",
              style: TextStyle(color: Colors.white),
            ),
          ),
          label: '',
          icon: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SvgPicture.asset(
              'assets/icons/favorite.svg',
              fit: BoxFit.contain,
              color: Colors.white,
              width: 20,
            ),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: const Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Text(
              "Setting",
              style: TextStyle(color: Colors.white),
            ),
          ),
          label: '',
          icon: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SvgPicture.asset(
              'assets/icons/setting.svg',
              fit: BoxFit.contain,
              color: Colors.white,
              width: 20,
            ),
          ),
        ),
      ],
    );
  }

}
