import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.amberAccent,
        child: Center(
          child: GestureDetector(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1,3),
                    color: Colors.black38,
                    blurRadius: 5
                  )
                ]
              ),
            ),
            onTap: (){
            },
          ),
        )
      ),
    );
  }
}
