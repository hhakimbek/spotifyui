import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:spotifyui/screens/home/home_screen.dart';
import 'package:spotifyui/screens/library/library_screen.dart';
import 'package:spotifyui/screens/search/search_screen.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {

  int index = 0;
  List<Widget> screens = [HomeScreen(),SearchScreen(),LibraryScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[index],
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentGeometry.topCenter,
                end: AlignmentGeometry.bottomCenter,
                colors: [
                  Colors.black.withAlpha(130),
                  Colors.black.withAlpha(200),
                  Colors.black,
                ]
              ),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(splashFactory: NoSplash.splashFactory,),
              child: BottomNavigationBar(
                onTap: (value) {
                  index = value;
                  setState(() {});
                },
                currentIndex: index,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: "Home"
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.search),
                      label: "Search"
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.library_music),
                    label:  "Your library"
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
