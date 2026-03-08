import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotifyui/utils/constants.dart';

class MusicalType extends StatelessWidget {
  const MusicalType({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10),
        child: Stack(
          children: [
            Image.asset('$IMAGE_PATH/slim_1.png',fit: BoxFit.cover,height: 170,width: 100,),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentGeometry.topLeft,
                    colors: [
                      Colors.black.withAlpha(140),
                      Colors.black.withAlpha(90),
                      Colors.black.withAlpha(60),
                    ]
                  )
                ),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Text("#dance rock",style: Theme.of(context).textTheme.titleMedium,),
            )
          ],
        ),
      ),
    );
  }
}
