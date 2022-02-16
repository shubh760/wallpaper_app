import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:getx/imagecontroll.dart';

class Wallpaper extends StatefulWidget {
  final int no;
  const Wallpaper({Key? key, required this.no}) : super(key: key);
  @override
  _WallpaperState createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  int currentindex = 0;
  final Imagecontroll imagecontroll = Get.put(Imagecontroll());

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          child: Container(
            key: ValueKey<int>(currentindex),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        imagecontroll.wapaperList[currentindex].imageurl),
                    fit: BoxFit.cover)),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15,
                sigmaY: 15,
              ),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
        ),
        FractionallySizedBox(
          heightFactor: 0.55,
          child: PageView.builder(
            controller: PageController(initialPage: widget.no),
            onPageChanged: (val) {
              setState(() {
                currentindex = val;
              });
            },
            itemCount: imagecontroll.wapaperList.length,
            itemBuilder: (context, index) {
              return FractionallySizedBox(
                widthFactor: 0.8,
                child: imagecontroll.wapaperList[currentindex].imageurl.isEmpty
                    ? const CircularProgressIndicator()
                    : GestureDetector(
                        onLongPress: () {
                          Get.bottomSheet(Container(
                            color: Colors.white,
                            child: Wrap(
                              children: <Widget>[
                                ListTile(
                                  focusColor: Colors.black,
                                  leading: const Icon(Icons.wb_incandescent),
                                  title:
                                      const Text("Set as homescreen wallpaper"),
                                  onTap: () async {
                                    int location = WallpaperManager.BOTH_SCREEN;
                                    var file =
                                       await DefaultCacheManager().getSingleFile(imagecontroll.wapaperList[currentindex].imageurl);
                                    bool result = await WallpaperManager
                                        .setWallpaperFromFile(file.path, location);
                                  },
                                ),
                              ],
                            ),
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            image: DecorationImage(
                                image: NetworkImage(
                                    imagecontroll.wapaperList[index].imageurl),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
              );
            },
          ),
        ),
      ],
    );
  }
}
