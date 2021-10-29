import 'package:flutter/material.dart';

class InspiPage extends StatefulWidget {
  @override
  _InspiPageState createState() => _InspiPageState();
}

class _InspiPageState extends State<InspiPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.amber,
      child: Center(
        child: Text("INSPIRATION PAGE"),
      ),
    );
  }
}
