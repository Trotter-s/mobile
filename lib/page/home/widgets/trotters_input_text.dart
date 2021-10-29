import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trotters_flutter_app/utils/colors.dart';

import '../home.dart';
import '../publi_page.dart';
class TrottersInputText extends StatefulWidget {
  TrottersInputText(this.context, this.placeholder, this.icon, this.controller, this.onSubmitResearch);

  String placeholder;
  BuildContext context;
  IconData icon;
  TextEditingController controller;
  Function onSubmitResearch;

  @override
  _TrottersInputTextState createState() => _TrottersInputTextState();
}

class _TrottersInputTextState extends State<TrottersInputText> {
  TrottersColors tc = TrottersColors();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      shadowColor: tc.black.withOpacity(0.25),
      borderRadius: BorderRadius.circular(5),
      child: TextFormField(
        controller: widget.controller,
        onEditingComplete: (){
          setState(() {
            widget.onSubmitResearch();
            widget.controller.text = "";
          });
          print('on edit complete');
        },
        cursorColor: tc.green,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: tc.lightGreen, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            hintText: widget.placeholder,
            hintStyle: Theme.of(context).textTheme.bodyText1,
            suffixIcon: Icon(widget.icon, color: tc.green),
            filled: true,
            fillColor: tc.white
        ),
      ),
    );  }
}

