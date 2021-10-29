import 'package:flutter/material.dart';

class PersoTripPage extends StatefulWidget {
  @override
  _PersoTripPageState createState() => _PersoTripPageState();
}

class _PersoTripPageState extends State<PersoTripPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.deepPurple,
      child: Center(child: Text("TRIP SUR MESURE PAGE"),),
    );
  }
}
