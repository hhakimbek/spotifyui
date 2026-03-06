import 'package:flutter/material.dart';
import 'package:spotifyui/data/theme/my_theme.dart';
import 'package:spotifyui/screens/splash/splash_screen.dart';
import 'package:spotifyui/utils/routes/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Spotify UI',
      theme: MyTheme.darkTheme,
      routerConfig: router,
    );
  }
}
