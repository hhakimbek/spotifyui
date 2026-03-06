import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:spotifyui/screens/home/home_screen.dart';
import 'package:spotifyui/screens/library/library_screen.dart';
import 'package:spotifyui/screens/player/player_screen.dart';
import 'package:spotifyui/screens/search/search_screen.dart';
import 'package:spotifyui/utils/constants.dart';
import 'package:spotifyui/utils/extensions/gap_extension.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int index = 0;
  List<Widget> screens = [HomeScreen(), SearchScreen(), LibraryScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[index],
      extendBody: true,
      bottomNavigationBar: Column(
        mainAxisAlignment: .end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      PlayerScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = 0.0;
                    const end = 1.0;
                    final tween = Tween(begin: begin, end: end,);
                    final curvedAnimation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeIn,
                    );
                    return FadeTransition(
                      opacity: tween.animate(curvedAnimation),
                      child: child,
                    );
                  },
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF5A0E43),
                borderRadius: BorderRadius.circular(8),
              ),
              height: 56,
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Column(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(4),
                        child: Image.asset('$IMAGE_PATH/utopia.png', height: 40),
                      ),
                      5.width,
                      Column(
                        crossAxisAlignment: .start,
                        mainAxisAlignment: .center,
                        children: [
                          Text("Utopia"),
                          Text(
                            "Konsta",
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.connected_tv_outlined, color: Colors.grey),
                      10.width,
                      Icon(Icons.add_circle_outline),
                      5.width,
                      Icon(Icons.play_arrow_rounded, size: 35),
                    ],
                  ),
                  LinearProgressIndicator(
                    color: Colors.white,
                    minHeight: 1.4,
                    value: .7,
                    backgroundColor: Colors.grey.withAlpha(100),
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                    colors: [
                      Colors.black.withAlpha(120),
                      Colors.black.withAlpha(200),
                      Colors.black,
                    ],
                  ),
                ),
                child: Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(splashFactory: NoSplash.splashFactory),
                  child: BottomNavigationBar(
                    onTap: (value) {
                      index = value;
                      setState(() {});
                    },
                    currentIndex: index,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home_filled),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.search),
                        label: "Search",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.library_music),
                        label: "Your library",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
