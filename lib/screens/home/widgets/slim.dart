import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class Slim extends StatelessWidget {
  final int index;
  const Slim({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(5),
      clipBehavior: Clip.hardEdge,
      child: Row(
        children: [
          Expanded(
            flex: 12,
            child: Image.asset("$IMAGE_PATH/slim_$index.png",height: 56,fit: BoxFit.cover,),
          ),
          Expanded(
            flex: 20,
            child: ColoredBox(
              color: Theme.of(context).colorScheme.secondary,
              child: Padding(
                padding: EdgeInsetsGeometry.all(5),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .center,
                  spacing: 5,
                  children: [
                    Text("Title"),
                    if(index==3)
                      LinearProgressIndicator(
                        value: .8,
                        borderRadius: BorderRadiusGeometry.circular(5),
                        color: Theme.of(context).colorScheme.onPrimary,
                        backgroundColor: Colors.grey,
                      )
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
