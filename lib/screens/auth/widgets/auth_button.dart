import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotifyui/utils/routes/app_route.dart';

class AuthButton extends StatelessWidget {
  final Function() onPressed;
  final Widget? leading;
  final bool border;
  final Widget title;
  final Color? bgColor;

  const AuthButton({super.key, required this.onPressed, this.leading, required this.title, this.border=false, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
        context.go(RouteNames.navigation);
      },
      minWidth: double.infinity,
      height: 45,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(25),
        side: border?
        BorderSide(
          color: Theme.of(context).colorScheme.surfaceDim,
          width: 1
        ):BorderSide.none
      ),
      color: bgColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (leading != null)
            Align(
              alignment: Alignment.centerLeft,
              child: leading!,
            ),
          Center(child: title),
        ],
      ),
    );
  }
}
