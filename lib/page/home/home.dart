import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:trotters_flutter_app/model/publication_model.dart';
import 'package:trotters_flutter_app/page/home/widgets/card.dart';
import 'package:trotters_flutter_app/page/home/widgets/trotters_button.dart';
import 'package:trotters_flutter_app/utils/colors.dart';
import 'package:trotters_flutter_app/utils/icomoon_icons.dart';
import 'widgets/refresh.dart';
import 'widgets/tips_card.dart';
import 'widgets/trotters_input_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TrottersColors tc = TrottersColors();
  List<String> researchs = [
    "Bretagne",
  ];

  List filters = [
    {"index": 1, "label": "filter1", "active": false},
    {"index": 2, "label": "filter2", "active": false},
    {"index": 3, "label": "filter3", "active": false},
    {"index": 4, "label": "filter4", "active": false},
    {"index": 5, "label": "filter5", "active": false},
  ];

  ScrollController scrollController = ScrollController();
  bool hideWidgets = false;
  TextEditingController researchController = TextEditingController();
  GlobalKey aspectRatio = GlobalKey();
  double filterWidth = 0;
  int counterFilter = 0;
  int filterValidation = 0;

  @override
  void initState() {
    scrollController.addListener(() {
      setState(() {
        hideWidgets = scrollController.offset > 50;
      });
    });



    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BuildContext keyContext = aspectRatio.currentContext;
      if (keyContext != null) {
        setState(() {
          final box = keyContext.findRenderObject() as RenderBox;
          filterWidth = box.size.width;
        });
      }
    });

    super.initState();
  }

  onSubmitResearch() {
    setState(() {
      researchs.add(researchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      filterValidation = counterFilter;
    });
    void showBottomSheet() {
      showModalBottomSheet(
        context: context,
        elevation: 500,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                padding: EdgeInsets.all(16),
                color: tc.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Filtrer l'affichage",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.filter_alt_outlined, color: tc.green)
                          ],
                        ),
                        SizedBox(height: 32),
                        Wrap(
                          children: [
                            for (var filter in filters)
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      filter["active"] = !filter["active"];
                                      counterFilter = 0;
                                      filters.forEach((element) {
                                        if (element["active"] == true)
                                          counterFilter++;
                                      });
                                    });

                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: filter["active"]
                                          ? tc.green
                                          : tc.lightgrey,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Text(
                                      filter["label"],
                                      style: TextStyle(
                                          color: filter["active"]
                                              ? tc.white
                                              : tc.green),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              counterFilter = 0;
                              filters.forEach((element) {
                                element["active"] = false;
                              });
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5 - 32,
                            decoration: BoxDecoration(
                                color: tc.white,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: tc.green,
                                    width: 1,
                                    style: BorderStyle.solid)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Center(
                                child: Text(
                                  "Reset",
                                  style:
                                      TextStyle(color: tc.green, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 32),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              filterValidation = counterFilter;
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5 - 32,
                            decoration: BoxDecoration(
                              color: tc.green,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Filtrer",
                                      style: TextStyle(
                                          color: tc.white, fontSize: 18),
                                    ),
                                    SizedBox(width: counterFilter <= 0 ? 0 : 5),
                                    counterFilter <= 0
                                        ? Container()
                                        : Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 3, horizontal: 7),
                                            decoration: BoxDecoration(
                                                color: tc.white,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: Text(
                                              counterFilter.toString(),
                                              style: TextStyle(
                                                  color: tc.green,
                                                  fontSize: 14),
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
      ).then((value) => setState((){}));

    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: tc.green,
      ),
      backgroundColor: tc.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: tc.green,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        height: hideWidgets
                            ? MediaQuery.of(context).size.height * 0.05
                            : MediaQuery.of(context).size.height * 0.15,
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 16, left: 16, right: 16, bottom: 16),
                        child: Text("Où pouvons-nous\nvous emmener ?",
                            style: TextStyle(
                                color: tc.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 34)),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        opacity: hideWidgets ? 0 : 1,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          width: MediaQuery.of(context).size.width,
                          height: hideWidgets ? 0 : 32,
                          child: Container(
                            height: 32,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              itemCount: researchs.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: index == 0
                                      ? const EdgeInsets.only(
                                          left: 18.5, right: 4)
                                      : const EdgeInsets.symmetric(
                                          horizontal: 5),
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: tc.white.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          researchs[index],
                                          style: TextStyle(color: tc.white),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: GestureDetector(
                                            child: Icon(Icons.close,
                                                size: 18, color: tc.white),
                                            onTap: () {
                                              setState(() {
                                                researchs.removeAt(index);
                                              });
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: IceCreamIndicator(
                  body(context, scrollController, hideWidgets),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              transform: hideWidgets ? Matrix4.translationValues(32.0, -182.0, 0.0) : Matrix4.translationValues(32.0, -90.0, 0.0),
              child: Image(image: AssetImage("assets/arrow.png"), height: MediaQuery.of(context).size.height * 0.35),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            top: hideWidgets ? 155 : 275,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              transform: Matrix4.translationValues(0.0, 20.0, 0.0),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width:
                          MediaQuery.of(context).size.width - filterWidth - 48,
                      child: TrottersInputText(
                          context,
                          "Rechercher une région, activité...",
                          Icons.search,
                          researchController,
                          onSubmitResearch),
                    ),
                    SizedBox(width: 16),
                    AspectRatio(
                      aspectRatio: 1,
                      key: aspectRatio,
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              color: tc.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(1, 0),
                                    blurRadius: 8,
                                    spreadRadius: 0)
                              ]),
                          child: Center(
                            child: Icon(Icomoon.Search,
                                size: 32, color: tc.green),
                          ),
                        ),
                        onTap: () {
                          showBottomSheet();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          filterValidation <= 0 ? Container(): AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            top: hideWidgets ? 155 +filterWidth -5 : 275 +filterWidth -2,
            right: 3,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 1.5),
                        blurRadius: 5,
                        spreadRadius: 0,
                        color: tc.black.withOpacity(0.08)
                    )
                  ],
                  color: tc.green,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: tc.white, width: 4, style: BorderStyle.solid)
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 5, horizontal: 8),
              child: Text(
                filterValidation.toString(),
                style: TextStyle(color: tc.white, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  refreshData() {
    sleep(
      Duration(milliseconds: 200),
    );
  }
}

Widget body(
    BuildContext context, ScrollController scrollController, bool hideWidgets) {
  TrottersColors tc = TrottersColors();

  return Container(
    color: tc.white,
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      controller: scrollController,
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(height: 40),

                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        "Les Trips Tendances",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.local_fire_department, color: tc.green)
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: ListView.builder(
                    itemCount: publications.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: index == 0
                            ? EdgeInsets.only(left: 16)
                            : EdgeInsets.all(0),
                        child: CardWidget(context, publications[index], index),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        "Nos Tips & Tricks",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.lightbulb, color: tc.green)
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: publications.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return TipsCardWidget(
                        context,
                        publications[index],
                        index,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
