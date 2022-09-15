import 'package:flutter/material.dart';
import 'package:for_jop/pages/app_screens/favorite.dart';
import 'package:for_jop/pages/app_screens/home.dart';
import 'package:for_jop/pages/app_screens/profile.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<BottomNavigationBarItem> items = const[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];
  List<Widget>screens= const[
    Home(),
    Favorite(),
    Card(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(items: items,
        onTap: (int index) {
        setState((){currentIndex =index;});

        },
        currentIndex: currentIndex,
        elevation: 20,

        type: BottomNavigationBarType.fixed,
        backgroundColor:defaultColor,
       unselectedItemColor: Colors.white70,
        unselectedLabelStyle: const TextStyle(color: Colors.deepOrange),
        selectedItemColor:backColor ,
      ),
    );
  }
}
