import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/uploadimagecontrol.dart';



class Confirm extends StatefulWidget {
  final File image;
  final String imagepath;
  const Confirm({Key? key, required this.image, required this.imagepath})
      : super(key: key);

  @override
  _ConfirmState createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {

  UploadImageContol uploadImageContol = Get.put(UploadImageContol());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: () => uploadImageContol.uploadimage(widget.imagepath),
              child: const Text("Save"),
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: FileImage(widget.image), fit: BoxFit.cover)),
      ),
    );
  }
}
