import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trotters_flutter_app/page/home/widgets/trotters_input_text.dart';
import 'package:trotters_flutter_app/utils/colors.dart';
import 'package:trotters_flutter_app/utils/icomoon_icons.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  TrottersColors tc = TrottersColors();
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(45.99467000000004, 2.022510000000068),
    zoom: 5.5,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(45.99467000000004, 2.022510000000068),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  TextEditingController researchController = TextEditingController();
  GlobalKey aspectRatio = GlobalKey();
  double filterWidth = 0;
  int counterFilter = 0;
  int filterValidation = 0;

  List steps = [];

  List<Marker> markers = [];
  List<Polyline> polylines = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BuildContext keyContext = aspectRatio.currentContext;
      if (keyContext != null) {
        setState(() {
          final box = keyContext.findRenderObject() as RenderBox;
          filterWidth = box.size.width;
        });
      }
    });

    steps.asMap().forEach((index, step) {
      loadMarker(index, step);
      loadPolyline(index, step);
    });

    super.initState();
  }

  loadMarker(int index, var step) async {
    BitmapDescriptor bitmapDescriptor =
        await createCustomMarkerBitmap((index + 1).toString());
    setState(() {
      markers.add(Marker(
          position: LatLng(step["lat"], step["lng"]),
          markerId: MarkerId(step["name"]),
          icon: bitmapDescriptor,
          anchor: Offset(0.5, 0.5),
          draggable: true,
          onDragEnd: (value) {
            step["lng"] = value.longitude;
            step["lat"] = value.latitude;
            markers = [];
            polylines = [];
            steps
                .asMap()
                .forEach((index, step) {
              loadMarker(index, step);
              loadPolyline(index, step);
            });
          },
          onTap: () {
            CameraPosition here = CameraPosition(
                bearing: 192.8334901395799,
                target: LatLng(step["lat"], step["lng"]),
                tilt: 59.440717697143555,
                zoom: 19.151926040649414);
            moveCamera(here);
          }));
    });

  }

  loadPolyline(int index, var step) {
    if (index + 1 != steps.length) {
      setState(() {
        polylines.add(Polyline(
            polylineId: PolylineId("from" + step["name"]),
            color: tc.white,
            width: 5,
            points: [
              LatLng(step["lat"], step["lng"]),
              LatLng(steps[index + 1]["lat"], steps[index + 1]["lng"]),
            ]));
      });

    }
  }

  Future<BitmapDescriptor> createCustomMarkerBitmap(String title) async {
    TextPainter tp = new TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.text = TextSpan(
      text: title,
      style: TextStyle(
          fontSize: 62.0,
          color: tc.white,
          letterSpacing: 1.0,
          fontWeight: FontWeight.bold),
    );

    PictureRecorder recorder = new PictureRecorder();
    Canvas c = new Canvas(recorder);
    Paint drawBorder = new Paint();
    drawBorder.color = tc.white;
    drawBorder.style = PaintingStyle.stroke;
    drawBorder.strokeWidth = 10;
    Paint drawFill = new Paint();
    drawFill.color = tc.green;
    drawFill.style = PaintingStyle.fill;
    c.drawCircle(Offset(50, 50), 40, drawFill);
    c.drawCircle(Offset(50, 50), 40, drawBorder);

    tp.layout();
    tp.paint(c, new Offset(30, 15));

    Picture p = recorder.endRecording();
    ByteData pngBytes = await (await p.toImage(100, 100))
        .toByteData(format: ImageByteFormat.png);

    Uint8List data = Uint8List.view(pngBytes.buffer);

    return BitmapDescriptor.fromBytes(data);
  }

  onSubmitResearch() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            polylines: Set<Polyline>.of(polylines),
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: Set<Marker>.of(markers),
            onTap: (latlng) {
              setState(() {
                steps.add({
                  "name": "name" + (steps.length + 1).toString(),
                  "lat": latlng.latitude,
                  "lng": latlng.longitude
                });
                steps.asMap().forEach((index, step) {
                  loadMarker(index, step);
                  loadPolyline(index, step);
                });
              });
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 48.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        transform: Matrix4.translationValues(0.0, 20.0, 0.0),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width -
                                    filterWidth -
                                    48,
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
                      SizedBox(height: 30),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ListView.builder(
                            itemCount: steps.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: index == 0 ? 16 : 0,
                                        right:
                                            index + 1 == steps.length ? 16 : 0),
                                    child: GestureDetector(
                                      onLongPressUp: () {
                                        setState(() {
                                          steps[index]["deletable"] = true;
                                        });
                                      },
                                      onTap: () {
                                        if (steps[index]["deletable"] = true) {
                                          setState(() {
                                            steps.removeAt(index);
                                            markers = [];
                                            polylines = [];
                                            steps
                                                .asMap()
                                                .forEach((index, step) {
                                              loadMarker(index, step);
                                              loadPolyline(index, step);
                                            });
                                          });
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(0, 1.5),
                                                  blurRadius: 5,
                                                  spreadRadius: 0,
                                                  color: tc.black
                                                      .withOpacity(0.08))
                                            ],
                                            color: steps[index]["deletable"] ==
                                                    true
                                                ? Colors.red
                                                : tc.green,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                                color: tc.white,
                                                width: 4,
                                                style: BorderStyle.solid)),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 8),
                                        child: Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                              color: tc.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  index + 1 == steps.length
                                      ? Container()
                                      : Container(
                                          width: 30,
                                          height: 2,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(0, 1.5),
                                                  blurRadius: 5,
                                                  spreadRadius: 0,
                                                  color: tc.black
                                                      .withOpacity(0.08))
                                            ],
                                            color: tc.white,
                                          ),
                                        )
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 125,
                    child: CarouselSlider.builder(
                      itemCount: 5,
                      options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: false,
                        viewportFraction: 0.8,
                        aspectRatio: 3.0,
                        initialPage: 0,
                      ),
                      itemBuilder: (context, index, pageIndex) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
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
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(index.toString()),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> moveCamera(CameraPosition here) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(here));
  }
}
