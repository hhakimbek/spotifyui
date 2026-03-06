import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotifyui/utils/constants.dart';
import 'package:spotifyui/utils/routes/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await Future.delayed(Duration(seconds: 1));
    context.go(RouteNames.auth);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Image.asset(IMAGE_PATH+LOGO,height: 150,width: 150,),
      ),
    );
  }
}
