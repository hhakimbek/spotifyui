import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotifyui/screens/home/widgets/podcast_episode.dart';
import 'package:spotifyui/screens/home/widgets/slim.dart';
import 'package:spotifyui/utils/constants.dart';
import 'package:spotifyui/utils/extensions/gap_extension.dart';
import 'package:spotifyui/widgets/avatar.dart';
import 'package:wave_animation/wave_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int appBarButton = 0;
  List<String> appBarButtons = ["All","Music","Podcasts"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeKey,
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              20.height,
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                child: Row(
                  spacing: 10,
                  children: [
                    AvatarWidget(height: 50,child: Image.asset(IMAGE_PATH+AVATAR,height: 50,width: 50,),),
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text("Damon98",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 19),),
                        Text("View profile",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),)
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                height: 30,
                color: Colors.grey.shade900,
              ),
              ListTile(
                leading: Icon(CupertinoIcons.lightbulb),
                title: Text("What's new"),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.timer),
                title: Text("Listening history"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings and privacy"),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              alignment: Alignment.centerRight,
              icon: AvatarWidget(child: Image.asset(IMAGE_PATH+AVATAR,height: 35,width: 35,),),
            );
          },
        ),
        title: Row(
          spacing: 10,
          children: [
            ...List.generate(appBarButtons.length, (index) {
              return GestureDetector(
                onTap: () {
                  appBarButton = index;
                  setState(() {});
                },
                child: Container(
                  height: 35,
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(16),
                    color: index==appBarButton?
                    Theme.of(context).colorScheme.onPrimary
                        :Theme.of(context).colorScheme.secondary
                  ),
                  child: Text(appBarButtons[index],style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: index==appBarButton?
                    Colors.black
                        :Colors.white
                  ),),
                ),
              );
            },)
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 14),
        child: true?
        CustomScrollView(

          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 175,
                mainAxisExtent: 56,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) => Slim(index: index,),
                childCount: 8,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 30),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        AvatarWidget(height: 50,child: Image.asset("$IMAGE_PATH/slim_4.png",height: 50,),),
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text("New release from",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),),
                            Text("Arctic Monkeys",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 19),),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(15),
                      clipBehavior: Clip.hardEdge,
                      child: SizedBox(
                        height: 170,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: ColoredBox(
                                color: Colors.black,
                                child: WaveWidget(
                                  height: 170,
                                  gradientColors1: [
                                    Colors.white,
                                    Colors.white
                                  ],
                                  gradientColors2: [
                                    Colors.grey,
                                    Colors.white
                                  ],
                                  lineCount: 7,
                                  amplitude: 10,
                                  waveLength: 2000,
                                  speed: 1,
                                  pattern: WaveMotionPattern.ribbonDrift,
                                  visible: true,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 15,
                              child: Container(
                                color: Theme.of(context).colorScheme.secondary,
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment: .start,
                                    children: [
                                      Text("I Wanna Be Yours",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16),),
                                      Text("Single. Arctic Monkeys",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey),),
                                      Spacer(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.add_circle_outline,size: 30,color: Colors.grey,),
                                          Icon(CupertinoIcons.play_circle_fill,size: 40,),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  20.height,
                  Text("Your top mixes",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 19),),
                  10.height,
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(
                              width: 160,
                              child: Column(
                                children: [
                                  Image.asset("$IMAGE_PATH/mix_$index.png",fit: BoxFit.cover, height: 160,width: 160,),
                                  Column(
                                    crossAxisAlignment: .start,
                                    children: [
                                      Text("Rock Mix",style: Theme.of(context).textTheme.titleMedium,),
                                      Text("Blur, The Killers, Kula, Shaker and more",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey,fontSize: 11),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            10.width,
                          ],
                        );
                      },
                    ),
                  ),
                  20.height,
                  Text("Episodes for you",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 19),),
                  10.height,
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(
                              width: 160,
                              child: Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Image.asset("$IMAGE_PATH/episode_$index.png",fit: BoxFit.cover, height: 160,width: 160,),
                                  Column(
                                    crossAxisAlignment: .start,
                                    children: [
                                      Text("Yeh Last Great debate",style: Theme.of(context).textTheme.titleMedium,),
                                      Text("Go! My favorite Sports Team",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey,fontSize: 11),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            10.width,
                          ],
                        );
                      },
                    ),
                  ),
                  20.height,
                  PodcastEpisodeCard(),
                  200.height,
                ],
              ),
            )
          ],
        )
            :SingleChildScrollView(
          child: Column(
            children: [

              //slim grid
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 175,
                  mainAxisExtent: 56,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10
                ),
                itemBuilder: (context, index) {
                  return Slim(index: index,);
                },
              ),
              //recomended card
              SizedBox(
                child: Column(
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        AvatarWidget(height: 50,child: Image.asset(IMAGE_PATH+AVATAR,height: 50,),),
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text("New release from",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),),
                            Text("Arctic Monkeys",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 19),),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
