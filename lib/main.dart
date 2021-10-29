import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trotters_flutter_app/utils/themes.dart';
import 'file:///C:/Users/queau/OneDrive/Documents/MDS/MBA1/MyStartUp/trotters_flutter_app/lib/page/home/home.dart';
import 'page/main.dart';
import 'page/map/map.dart';
import 'page/profil/login.dart';
import 'utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays ([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool logged = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: logged ? MainPage() : LoginPage()
    );
  }
}
