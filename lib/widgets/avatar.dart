import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AvatarWidget extends StatelessWidget {
  final double height;
  final Widget child;
  const AvatarWidget({super.key, this.height=35, required this.child,});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadiusGeometry.circular(100),
      child: child,
    );
  }
}
