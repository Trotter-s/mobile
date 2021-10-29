import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:trotters_flutter_app/model/publication_model.dart';
import 'package:trotters_flutter_app/page/profil/utils/tab_indicator.dart';
import 'package:trotters_flutter_app/utils/colors.dart';
import 'package:trotters_flutter_app/utils/icomoon_icons.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage>
    with TickerProviderStateMixin {
  TrottersColors tc = TrottersColors();
  TabController _tabController;
  int tabIndex = 0;

  TabController _tabFavController;
  int tabFavIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);

    _tabController.addListener(() {
      setState(() {
        tabIndex = _tabController.index;
      });
    });

    _tabFavController = TabController(length: 5, vsync: this, initialIndex: 0);

    _tabFavController.addListener(() {
      setState(() {
        tabFavIndex = _tabFavController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabFavController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            flex: 23,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: tc.green,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: tc.greenWithOpactiy20,
                        borderRadius: BorderRadius.circular(9),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 14,
                              spreadRadius: 0,
                              color: tc.black.withOpacity(0.08)),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: tc.white,
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/trotterslogo.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Killian",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: tc.white),
                          ),
                          Text(
                            "Trotter débutant",
                            style: TextStyle(color: tc.lightGreen),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              color: tc.greenWithOpactiy20,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "23",
                            style: TextStyle(color: tc.white),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Abonnements",
                            style: TextStyle(color: tc.lightGreen),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "23",
                            style: TextStyle(color: tc.white),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Trips",
                            style: TextStyle(color: tc.lightGreen),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "23",
                            style: TextStyle(color: tc.white),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Abonnés",
                            style: TextStyle(color: tc.lightGreen),
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
            flex: 70,
            child: Container(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              color: tc.white,
              child: DefaultTabController(
                length: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: TabBar(
                        controller: _tabController,
                        tabs: [
                          Row(
                            children: [
                              Text(
                                "Mes trips ",
                                style: TextStyle(
                                    color: tabIndex == 0
                                        ? tc.green
                                        : tc.lightGreen,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icomoon.Trip,
                                color: tabIndex == 0 ? tc.green : tc.lightGreen,
                                size: 26,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Mes favoris ",
                                style: TextStyle(
                                    color: tabIndex == 1
                                        ? tc.green
                                        : tc.lightGreen,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icomoon.Inspi,
                                color: tabIndex == 1 ? tc.green : tc.lightGreen,
                                size: 26,
                              )
                            ],
                          )
                        ],
                        indicator: ContainerTabIndicator(
                          width: 0,
                          height: 0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: TabBarView(
                        controller: _tabController,
                        physics: BouncingScrollPhysics(),
                        children: [
                          ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: publications.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: GestureDetector(
                                    child: Stack(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 225,
                                          child: Padding(
                                            padding: EdgeInsets.all(16),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        color: index == 1
                                                            ? tc.white
                                                            : tc.green,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 8.0,
                                                                horizontal: 16),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              index == 1
                                                                  ? "Terminé"
                                                                  : "En cours",
                                                              style: TextStyle(
                                                                  color: index ==
                                                                          1
                                                                      ? tc.green
                                                                      : tc.white),
                                                            ),
                                                            index == 1
                                                                ? Container()
                                                                : SizedBox(
                                                                    width: 5,
                                                                  ),
                                                            index == 1
                                                                ? Container()
                                                                : Icon(
                                                                    Icons.timer,
                                                                    size: 18,
                                                                    color: tc
                                                                        .white,
                                                                  )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    index == 1
                                                        ? Container()
                                                        : Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                              color: tc.green,
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 8.0,
                                                                  horizontal:
                                                                      16),
                                                              child: Text(
                                                                "Étape 3",
                                                                style: TextStyle(
                                                                    color: tc
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        publications[index]
                                                            .title,
                                                        style: TextStyle(
                                                            color: tc.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                        "13 étape • 12/02/21",
                                                        style: TextStyle(
                                                            color: tc
                                                                .greyUltraLight),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      publications[index]
                                                          .imageUrl))),
                                        ),
                                        Positioned(
                                          right: 20,
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: tc.white,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(50),
                                                bottomRight:
                                                    Radius.circular(50),
                                              ),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  publications[index].isFav =
                                                      !publications[index]
                                                          .isFav;
                                                });
                                              },
                                              child: Icon(
                                                Icons.star,
                                                color: publications[index].isFav
                                                    ? tc.yellow
                                                    : tc.greyMedium,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          DefaultTabController(
                            length: 5,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TabBar(
                                    controller: _tabFavController,
                                    isScrollable: true,
                                    physics: BouncingScrollPhysics(),
                                    indicator: ContainerTabIndicator(
                                      padding: EdgeInsets.only(top: 16),
                                      color: tc.green,
                                      radius: BorderRadius.circular(50),
                                      width: 5,
                                      height: 5
                                    ),
                                    tabs: [
                                      Text("Best seller", style: TextStyle(color: _tabFavController.index == 0 ? tc.green: tc.greyUltraLight),),
                                      Text("Savoir m'organiser", style: TextStyle(color: _tabFavController.index == 1 ? tc.green: tc.greyUltraLight)),
                                      Text("Trip Alone", style: TextStyle(color: _tabFavController.index == 2 ? tc.green: tc.greyUltraLight)),
                                      Text("Next Section", style: TextStyle(color: _tabFavController.index == 3 ? tc.green: tc.greyUltraLight)),
                                      Text("Another Section", style: TextStyle(color: _tabFavController.index == 4 ? tc.green: tc.greyUltraLight)),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 9,
                                  child: TabBarView(
                                    controller: _tabFavController,
                                    physics: BouncingScrollPhysics(),
                                    children: [
                                      Text("Best seller"),
                                      Text("Savoir m'organiser"),
                                      Text("Trip Alone"),
                                      Text("Next Section"),
                                      Text("Another Section"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
