import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trotters_flutter_app/model/publication_model.dart';
import 'package:trotters_flutter_app/utils/colors.dart';

import '../publi_page.dart';

class CardWidget extends StatefulWidget {

  CardWidget(this.context, this.publication, this.index);

  BuildContext context;
  Publication publication;
  int index;

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {

  TrottersColors tc = TrottersColors();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => PubliPage(id: widget.index)));
        },
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(widget.publication.title,
                        style: TextStyle(color: tc.white, fontSize: 18)),
                  )),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(widget.publication.imageUrl))),
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
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      publications[widget.index].isFav = !publications[widget.index].isFav;
                    });
                  },
                  child: Icon(
                    Icons.star,
                    color: widget.publication.isFav ? tc.yellow : tc.greyMedium,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );  }
}

