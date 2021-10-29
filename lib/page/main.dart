import 'package:flutter/material.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';
import 'package:trotters_flutter_app/page/home/home.dart';
import 'package:trotters_flutter_app/utils/colors.dart';
import 'package:trotters_flutter_app/utils/my_flutter_app_icons.dart';
import 'package:trotters_flutter_app/utils/icomoon_icons.dart';
import 'inspi/inspi.dart';
import 'list_trip/my_trips.dart';
import 'map/map.dart';
import 'new_trip/trip_creation.dart';
import 'perso_trip/perso_trip.dart';
import 'profil/profil.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TrottersColors tc = TrottersColors();

  List pages = [HomePage(), InspiPage(), PersoTripPage(), ProfilPage(), TripCreationPage(), TripListPage(), MapPage()];
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SpinCircleBottomBarHolder(
      bottomNavigationBar: SCBottomBarDetails(
          circleColors: [tc.lightGreen, tc.green, tc.grey],
          iconTheme: IconThemeData(color: tc.lightGreen, size: 28),
          activeIconTheme: IconThemeData(color: tc.green, size: 28),
          backgroundColor: tc.white,
          titleStyle: TextStyle(color: tc.white, fontSize: 28),
          activeTitleStyle:
              TextStyle(color: tc.green, fontWeight: FontWeight.bold, fontSize: 28),
          actionButtonDetails: SCActionButtonDetails(
              color: tc.green,
              icon: Icon(
                Icons.add,
                color: tc.white,
              ),
              elevation: 0),
          elevation: 0.0,
          items: [
            SCBottomBarItem(
                icon: Icomoon.Home,
                activeIcon: Icomoon.Home,
                title: "•",
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                }),
            SCBottomBarItem(
                icon: Icomoon.Inspi,
                activeIcon: Icomoon.Inspi,
                title: "•",
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                }),
            SCBottomBarItem(
                icon: Icomoon.Trip,
                activeIcon: Icomoon.Trip,
                title: "•",
                onPressed: () {
                  setState(() {
                    index = 2;
                  });
                }),
            SCBottomBarItem(
                icon: Icomoon.Profil,
                title: "•",
                activeIcon: Icomoon.Profil,
                onPressed: () {
                  setState(() {
                    index = 3;
                  });
                }),
          ],
          circleItems: [
            SCItem(icon: Icon(Icomoon.Map, color: tc.white), onPressed: () {
              setState(() {
                index = 6;
              });
            }),
            SCItem(icon: Icon(Icomoon.Listing, color: tc.white), onPressed: () {
              setState(() {
                index = 5;
              });
            }),
            SCItem(icon: Icon(Icomoon.Pointeur, color: tc.white), onPressed: () {
              setState(() {
                index = 4;
              });
            }),
          ],
          bnbHeight: 80 // Suggested Height 80
          ),
      child: pages[index],
    ));
  }
}
