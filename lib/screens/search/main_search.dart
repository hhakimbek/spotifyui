import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotifyui/utils/constants.dart';
import 'package:spotifyui/utils/extensions/gap_extension.dart';

class MainSearch extends StatefulWidget {
  const MainSearch({super.key});

  @override
  State<MainSearch> createState() => _MainSearchState();
}

class _MainSearchState extends State<MainSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: SizedBox(),
        leadingWidth: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: SizedBox(
          height: 30,
          child: CupertinoSearchTextField(
            placeholder: "What do you want to play?",
            cursorColor: Colors.grey,
            prefixIcon: Icon(CupertinoIcons.search,color: Colors.white,),
            placeholderStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey,fontWeight: FontWeight.w500),
          )
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            style: ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
            child: Text("Cancel",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white70,fontWeight: FontWeight.w400),),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Recent searches",style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),),
            20.height,
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: ClipRRect(
                          borderRadius: index.isOdd? BorderRadius.zero: BorderRadiusGeometry.circular(100),
                          child: Image.asset('$IMAGE_PATH/episode_$index.png'),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("The Queen Is Dead",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                            ),),
                            Text("Album • The Smiths",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey,fontSize: 12),),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {

                          },
                          icon: Icon(Icons.clear,color: Colors.grey,),
                        ),

                      ),
                      SizedBox(height: 15,),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
