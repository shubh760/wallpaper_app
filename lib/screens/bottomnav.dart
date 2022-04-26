import 'package:flutter/material.dart';
import 'package:getx/constant.dart';

class Bnb extends StatefulWidget {
  const Bnb({Key? key}) : super(key: key);

  @override
  _BnbState createState() => _BnbState();
}

class _BnbState extends State<Bnb> {
  int pageidx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx){
          setState(() {
           pageidx = idx;
          });
        },
        currentIndex: pageidx,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.image, size: 30,), label: "wallpaper" ),
        BottomNavigationBarItem(icon: Icon(Icons.add, size: 30,), label: "add" ),
        BottomNavigationBarItem(icon: Icon(Icons.person, size: 30,), label: "profile" ),
        
      ],),
      body: pages[pageidx] ,
    );
  }
}
