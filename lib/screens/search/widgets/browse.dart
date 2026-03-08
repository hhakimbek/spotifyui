import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spotifyui/utils/constants.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(10),
      child: ColoredBox(
        color: colors[getRandomIndex(colors.length)],
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Text(names[getRandomIndex(names.length)],style: Theme.of(context).textTheme.titleMedium,),
            ),
            Positioned(
              bottom: 0,
              right: -15,
              child: Transform.rotate(
                angle: pi/7,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(5),
                  child: Image.asset('$IMAGE_PATH/slim_${getRandomIndex(8)}.png',width: 75,),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

List<Color> colors = [
  Colors.purpleAccent,
  Color(0xff3c8f40),
  Color(0xff278ddf),
  Color(0xffdf277a),
  Color(0xffdf2727),
  Colors.lightBlue,
  Colors.indigo
];
List names = ["Music", "Podcast", "Live Events", "Made for you", "Summer","Hip Hop","Dance"];

int getRandomIndex(int value) {
  Random index = Random();
  return index.nextInt(value);
}
