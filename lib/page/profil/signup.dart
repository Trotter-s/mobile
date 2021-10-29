import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trotters_flutter_app/utils/colors.dart';
import 'package:trotters_flutter_app/utils/themes.dart';

import '../main.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TrottersColors tc = TrottersColors();

  bool animatedSwitcher = true;
  String _image;

  @override
  Widget build(BuildContext context) {
    void _showImageSourceActionSheet(BuildContext context) {
      Function(ImageSource) selectImageSource = (imageSource) async {
        final _picker = ImagePicker();
        final pickedImage = await _picker.getImage(source: imageSource);
        if (pickedImage == null) return;

        setState(() {
          _image = pickedImage.path;
        });
      };
      if (Platform.isIOS) {
        showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                child: Text('Camera'),
                onPressed: () {
                  Navigator.pop(context);
                  selectImageSource(ImageSource.camera);
                },
              ),
              CupertinoActionSheetAction(
                child: Text('Gallery'),
                onPressed: () {
                  Navigator.pop(context);
                  selectImageSource(ImageSource.gallery);
                },
              )
            ],
          ),
        );
      } else {
        showModalBottomSheet(
          context: context,
          builder: (context) => Wrap(children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.gallery);
              },
            ),
          ]),
        );
      }
    }

    List widgetArray = [
      SingleChildScrollView(
        key: Key('1'),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 35,
                    child: Container(
                      color: tc.green,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(8),
                      child: Image(
                        width: MediaQuery.of(context).size.width * 0.55,
                        image: AssetImage("assets/trotterslogowhite.png"),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                              vertical: 32, horizontal: 16),
                          child: Column(children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pseudo",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  TextFormField(
                                    cursorColor: tc.green,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: tc.lightGreen, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        hintText: "Ex : Killian35",
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        filled: true,
                                        fillColor: tc.lightgrey),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 32),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  TextFormField(
                                    cursorColor: tc.green,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: tc.lightGreen, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        filled: true,
                                        hintText: "Ex : email@trotters.com",
                                        fillColor: tc.lightgrey),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16, bottom: 32),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    animatedSwitcher = !animatedSwitcher;
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: tc.green,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Étape suivante",
                                            style: TextStyle(
                                                color: tc.white, fontSize: 18),
                                          ),
                                          Icon(
                                            Icons.play_arrow_sharp,
                                            color: tc.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 19),
                              SizedBox(height: 32),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Vous avez déjà un compte ? ",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                    child: Text(
                                      "Se connecter",
                                      style: TextStyle(
                                          fontSize: 16,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.35 - 60,
                left: MediaQuery.of(context).size.width * 0.5 - 40,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: tc.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 14,
                              spreadRadius: 0,
                              color: tc.black.withOpacity(0.08)),
                        ],
                      image: _image != null ? DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(_image)),
                      ) : null,
                    ),
                    child: _image != null
                        ? Container()
                        : Center(
                            child: Icon(Icons.play_arrow,
                                color: tc.green, size: 45),
                          ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.35,
                left: MediaQuery.of(context).size.width * 0.5 + 20,
                child: GestureDetector(
                  onTap: () {
                    _showImageSourceActionSheet(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 1.5),
                              blurRadius: 5,
                              spreadRadius: 0,
                              color: tc.black.withOpacity(0.08))
                        ],
                        color: tc.green,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: tc.white,
                            width: 4,
                            style: BorderStyle.solid)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Icon(
                      Icons.edit_outlined,
                      color: tc.white,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      SingleChildScrollView(
        key: Key('2'),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 35,
                    child: Container(
                      color: tc.green,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(8),
                      child: Image(
                        width: MediaQuery.of(context).size.width * 0.55,
                        image: AssetImage("assets/trotterslogowhite.png"),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                              vertical: 32, horizontal: 16),
                          child: Column(children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mot de passe",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  TextFormField(
                                    obscureText: true,
                                    cursorColor: tc.green,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: tc.lightGreen, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        hintText: "•••••",
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        filled: true,
                                        fillColor: tc.lightgrey),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 32),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Confirmer le mot de passe",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  TextFormField(
                                    obscureText: true,
                                    cursorColor: tc.green,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: tc.lightGreen, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        filled: true,
                                        hintText: "•••••",
                                        fillColor: tc.lightgrey),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16, bottom: 32),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MainPage()));
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: tc.green,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    child: Center(
                                      child: Text(
                                        "Créer un compte",
                                        style: TextStyle(
                                            color: tc.white, fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 19),
                              SizedBox(height: 32),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Vous avez déjà un compte ? ",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                    child: Text(
                                      "Se connecter",
                                      style: TextStyle(
                                          fontSize: 16,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.35 - 60,
                left: MediaQuery.of(context).size.width * 0.5 - 40,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: tc.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 14,
                            spreadRadius: 0,
                            color: tc.black.withOpacity(0.08)),
                      ],
                      image: _image != null ? DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(_image)),
                      ) : null,
                    ),
                    child: _image != null
                        ? Container()
                        : Center(
                      child: Icon(Icons.play_arrow,
                          color: tc.green, size: 45),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.35,
                left: MediaQuery.of(context).size.width * 0.5 + 20,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 1.5),
                            blurRadius: 5,
                            spreadRadius: 0,
                            color: tc.black.withOpacity(0.08))
                      ],
                      color: tc.green,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: tc.white, width: 4, style: BorderStyle.solid)),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Icon(
                    Icons.edit_outlined,
                    color: tc.white,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: tc.green,
      ),
      backgroundColor: tc.white,
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          final inAnimation =
              Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                  .animate(animation);
          final outAnimation =
              Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                  .animate(animation);

          if (child.key == ValueKey("2")) {
            return ClipRect(
              child: SlideTransition(
                position: inAnimation,
                child: child,
              ),
            );
          } else {
            return ClipRect(
              child: SlideTransition(
                position: outAnimation,
                child: child,
              ),
            );
          }
        },
        child: animatedSwitcher ? widgetArray[0] : widgetArray[1],
      ),
    );
  }
}
