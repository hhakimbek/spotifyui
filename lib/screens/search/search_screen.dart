import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotifyui/screens/search/widgets/browse.dart';
import 'package:spotifyui/screens/search/widgets/musical_type.dart';
import 'package:spotifyui/utils/extensions/gap_extension.dart';
import 'package:spotifyui/utils/routes/app_route.dart';

import '../../utils/constants.dart';
import '../../widgets/avatar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final GlobalKey<ScaffoldState> homeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                AvatarWidget(
                  height: 50,
                  child: Image.asset(
                    IMAGE_PATH + AVATAR,
                    height: 50,
                    width: 50,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Damon98",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "View profile",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            Divider(height: 30, color: Colors.grey.shade900),
            const ListTile(
              leading: Icon(CupertinoIcons.lightbulb),
              title: Text("What's new"),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.timer),
              title: Text("Listening history"),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings and privacy"),
            ),
          ],
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
              icon: AvatarWidget(
                child: Image.asset(IMAGE_PATH + AVATAR, height: 35, width: 35),
              ),
            );
          },
        ),
        title: Text("Search",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22),),
        actions: [
          IconButton(
            onPressed:() {
            },
            icon: Icon(Icons.camera_alt_outlined),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 45),
          child: GestureDetector(
            onTap: () => context.push(RouteNames.mainSearch),
            child: Container(
              height: 45,
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.symmetric(vertical: 2,horizontal: 16),
              child: Row(
                    children: [
                      Icon(CupertinoIcons.search,color: Colors.black,),
                      10.width,
                      Text("What do you want to play?",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.w500),)
                    ],
                  )
              ),
          ),
          ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                20.height,
                Text(
                  "Explore your musical type",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                        (index) => const MusicalType(),
                  ),
                ),
                20.height,
                Text(
                  "Browse all",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                20.height,
              ]),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => const Browse(),
                childCount: 10,
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 160,
                mainAxisExtent: 100,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
          SliverToBoxAdapter(child: 200.height,)
        ],
      ),

    );
  }
}
