import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:spotifyui/utils/constants.dart';

import '../../utils/extensions/gap_extension.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {

  double sliderValue=0.4;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF5D261E),
                    Color(0xFF3C1914),
                    Color(0xFF110807),
                  ],
                ),
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          // extendBodyBehindAppBar: true,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(CupertinoIcons.chevron_down),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              )
            ],
            title: Text(
              "Utopia",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: .center,
                children: [
                  20.height,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      clipBehavior: Clip.hardEdge,
                      child: SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: Image.asset("$IMAGE_PATH/utopia.png",fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                  20.height,
                  Row(
                    crossAxisAlignment: .center,
                    children: [
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text("Utopia",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 25),),
                          Text("Konsta",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey,fontWeight: FontWeight.normal),)
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {

                        },
                        icon: Icon(Icons.remove_circle_outline_rounded,size: 35,) ,
                      ),
                      IconButton(
                        onPressed: () {

                        },
                        icon: Icon(Icons.add_circle_outline_rounded,size: 35,) ,
                      )
                    ],
                  ),
                  20.height,
                  Slider(
                    padding: EdgeInsets.zero,
                    value: sliderValue,
                    onChanged: (value) {
                      sliderValue = value;
                      setState(() {

                      });
                    },
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey.withAlpha(100),

                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text("1:52",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),),
                      Text("2:44",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),)
                    ],
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(CupertinoIcons.shuffle,color: Colors.grey,),
                      Icon(CupertinoIcons.backward_end_fill,size: 30,),
                      Icon(CupertinoIcons.play_circle_fill,size: 70,),
                      Icon(CupertinoIcons.forward_end_fill,size: 30,),
                      Icon(Iconsax.repeat_outline,color: Colors.grey,),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.devices_rounded),
                      Spacer(),
                      Icon(Icons.file_upload_outlined),
                      20.width,
                      Icon(CupertinoIcons.list_bullet_below_rectangle),
                    ],
                  ),
                  30.height,
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      color: Color(0xFFBE5655),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    width: double.infinity,
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 15,vertical: 10),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text("Lyrics preview",style: Theme.of(context).textTheme.titleMedium,),
                        Expanded(
                          child:Padding(
                            padding: EdgeInsetsGeometry.symmetric(vertical: 10),
                            child: ClipRect(
                              child: ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.white,
                                      Colors.white,
                                      Colors.transparent,
                                    ],
                                    stops: [0.0, 0.1, 0.9, 1.0],
                                  ).createShader(bounds);
                                },
                                blendMode: BlendMode.dstIn,
                                child: Text(
                                  """
Mani do'stlarim chqiradi bos
Jigarlarim qib beradi new post
Ko'raman tiktokda yuztaviy do'st
Bular hammasi nimadir uchun bos
""",
                                  style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 22),
                                ),
                              ),
                            ),
                          ),),
                        SizedBox(
                          height: 35,
                          child: ElevatedButton(
                            onPressed: () {

                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Colors.white),
                              elevation: WidgetStatePropertyAll(0),
                              padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 15))
                            ),
                            child: Text("Show lyrics"),
                          ),
                        )
                      ],
                    ),
                  ),
                  30.height
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
