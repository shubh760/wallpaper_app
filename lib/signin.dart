import 'package:flutter/material.dart';
import 'package:getx/constant.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  var username = TextEditingController();
  var emailcontroler = TextEditingController();
  var passwordcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: Stack(
                    children: [
                      ClipOval(
                          child: const FlutterLogo(
                        size: 200,
                      )),
                      Positioned(
                          bottom: 20.0,
                          right: 20.0,
                          child: FloatingActionButton(
                              backgroundColor: Colors.cyan.shade600,
                              onPressed: () => authController.pickedimage(),
                              child: Icon(Icons.add))),
                    ],
                  ),
                ),
                Form(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: username,
                              decoration: InputDecoration(
                                  hintText: "Type a Unique Username ",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          color: MediaQuery.of(context)
                                                      .platformBrightness ==
                                                  Brightness.light
                                              ? Colors.black
                                              : Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          color: Colors.cyan.shade600)),
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Icon(
                                        Icons.person,
                                      )),
                                  label: Text(
                                    "Username",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: emailcontroler,
                              decoration: InputDecoration(
                                  hintText: "Type Your E-Mail Here",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          color: MediaQuery.of(context)
                                                      .platformBrightness ==
                                                  Brightness.light
                                              ? Colors.black
                                              : Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          color: Colors.cyan.shade600)),
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Icon(
                                        Icons.email,
                                      )),
                                  label: Text(
                                    "E-Mail",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: passwordcontroler,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Type your password here",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          color: MediaQuery.of(context)
                                                      .platformBrightness ==
                                                  Brightness.light
                                              ? Colors.black
                                              : Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          color: Colors.cyan.shade600)),
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Icon(
                                        Icons.lock,
                                      )),
                                  label: Text(
                                    "Password",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: GestureDetector(
                                onTap: () => authController.register(
                                    username.text,
                                    emailcontroler.text,
                                    passwordcontroler.text,
                                    authController.profilePic),
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "SignUp",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.cyan.shade600,
                                        borderRadius:
                                            BorderRadius.circular(18))),
                              )),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
