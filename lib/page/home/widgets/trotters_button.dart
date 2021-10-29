import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trotters_flutter_app/utils/colors.dart';
import 'package:trotters_flutter_app/utils/my_flutter_app_icons.dart';

import '../publi_page.dart';

Widget TrottersButton(BuildContext context, String text, Color color, IconData icon, Function function){
  TrottersColors tc = TrottersColors();

  return GestureDetector(
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(15),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: TextStyle(color: tc.white, fontSize: 18),),
            SizedBox(width: 10),
            Icon(icon, color: tc.white,)
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100)
      ),
    ),
  );
}