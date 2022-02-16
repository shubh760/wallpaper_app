import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controler.dart';
import 'package:getx/imagecontroll.dart';
import 'package:getx/wallpaper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Imagecontroll imagecontroll = Get.put(Imagecontroll());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.black,
        title: const Text(
          'Wallpapers',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.bottomSheet(Container(
                  color: Colors.white,
                  child: Wrap(
                    children: <Widget>[
                      ListTile(
                        focusColor: Colors.black,
                        leading: const Icon(Icons.wb_incandescent),
                        title: const Text("dark theme"),
                        onTap: () => {Get.changeTheme(ThemeData.dark())},
                      ),
                      ListTile(
                        focusColor: Colors.black,
                        leading: const Icon(Icons.wb_incandescent),
                        title: const Text("logout"),
                        onTap: () => {Controler.instance.logout()},
                      ),
                    ],
                  ),
                ));
              },
              icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Obx(() {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: imagecontroll.wapaperList.length,
            itemBuilder: (context, index) {
              final data = imagecontroll.wapaperList[index];
              return GestureDetector(
                onTap: () {
                  Get.to(Wallpaper(
                    no: index,
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(data.imageurl))),
                  ),
                ),
              );
            });
      }),
    );
  }
}
