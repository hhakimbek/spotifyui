import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:spotifyui/screens/auth/widgets/auth_button.dart';
import 'package:spotifyui/utils/extensions/gap_extension.dart';

import '../../utils/constants.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32,),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: .center,
              mainAxisAlignment: .end,
              children: [
                Image.asset(IMAGE_PATH + LOGO_WHITE, height: 45, width: 45),
                20.height,
                Text(
                  "Millions of songs. Free on Spotify.",
                  style: Theme.of(context).textTheme.titleLarge!,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                30.height,
                Column(
                  spacing: 10,
                  children: [
                    AuthButton(
                      bgColor: Theme.of(context).colorScheme.onPrimary,
                      onPressed: () {},
                      title: Text("Sign up free",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),),
                    ),
                    AuthButton(
                      onPressed: () {},
                      border: true,
                      leading: Brand(Brands.google,size: 24,),
                      title: Text("Continue with Google",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                    ),
                    AuthButton(
                      onPressed: () {},
                      border: true,
                      leading: Brand(Brands.facebook,size: 24,),
                      title: Text("Continue with Facebook",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                    ),
                    AuthButton(
                      onPressed: () {},
                      border: true,
                      leading: Brand(Brands.apple_logo,size: 24,),
                      title: Text("Continue with Apple",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                    ),
                    AuthButton(
                      onPressed: () {},
                      title: Text("Login",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
