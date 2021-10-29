import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trotters_flutter_app/model/publication_model.dart';
import 'package:trotters_flutter_app/utils/colors.dart';

import '../publi_page.dart';

class TipsCardWidget extends StatefulWidget {
  TipsCardWidget(this.context, this.publication, this.index);

  BuildContext context;
  Publication publication;
  int index;

  @override
  _TipsCardWidgetState createState() => _TipsCardWidgetState();
}

class _TipsCardWidgetState extends State<TipsCardWidget> {
  TrottersColors tc = TrottersColors();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16, left: 16, top: 0, bottom: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => PubliPage(id: widget.index)));
        },
        child: widget.index == 0
            ? Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: tc.lightgrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            image: NetworkImage(widget.publication.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 16),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.publication.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  widget.publication.creationDate.day
                                          .toString() +
                                      "/" +
                                      widget.publication.creationDate.month
                                          .toString() +
                                      "/" +
                                      widget.publication.creationDate.year
                                          .toString(),
                                  style: TextStyle(color: tc.greyMedium),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        publications[widget.index].isFav =
                                            !publications[widget.index].isFav;
                                      },
                                    );
                                  },
                                  child: Icon(Icons.star,
                                      color: widget.publication.isFav
                                          ? tc.yellow
                                          : tc.greyMedium),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Container(
                height: 110,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: tc.lightgrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 110,
                        width: 94,
                        padding: EdgeInsets.only(right: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            image: NetworkImage(widget.publication.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        width: MediaQuery.of(context).size.width - 158,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.publication.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  widget.publication.creationDate.day
                                          .toString() +
                                      "/" +
                                      widget.publication.creationDate.month
                                          .toString() +
                                      "/" +
                                      widget.publication.creationDate.year
                                          .toString(),
                                  style: TextStyle(color: tc.greyMedium),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        publications[widget.index].isFav =
                                            !publications[widget.index].isFav;
                                      });
                                    },
                                    child: Icon(Icons.star,
                                        color: widget.publication.isFav
                                            ? tc.yellow
                                            : tc.greyMedium))
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
