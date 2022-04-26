import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getx/controlers/confirm.dart';
import 'package:image_picker/image_picker.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  pickwallpaper(ImageSource src) async {
    final wallpaper = await ImagePicker().pickImage(source: src);
    if (wallpaper != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Confirm(
                    image: File(wallpaper.path),
                    imagepath: wallpaper.path,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Upload your walllpaper here'),
        backgroundColor: Colors.black,
        toolbarHeight: 100,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () => pickwallpaper(ImageSource.gallery),
              child: Container(
                height: MediaQuery.of(context).size.height - 780,
                width: MediaQuery.of(context).size.width - 230,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    gradient: const LinearGradient(
                        colors: [Colors.red, Colors.blue])),
                child: const Center(
                    child: Text(
                  "Add",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
         
        ],
      ),
    );
  }
}
