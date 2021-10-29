import 'package:flutter/material.dart';
import 'package:trotters_flutter_app/model/publication_model.dart';
import 'package:trotters_flutter_app/utils/colors.dart';
import 'package:intl/intl.dart';

class PubliPage extends StatefulWidget {
  PubliPage({this.id});

  int id;

  @override
  _PubliPageState createState() => _PubliPageState();
}

class _PubliPageState extends State<PubliPage> {
  @override
  Widget build(BuildContext context) {
    Publication publication = publications[widget.id];
    TrottersColors tc = TrottersColors();
    var formatter = new DateFormat('dd MMM. yyyy');

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                flex: 4,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 50, right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Icon(Icons.arrow_back, color: tc.white),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            GestureDetector(
                              child: Icon(Icons.share, color: tc.white),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 50, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(publication.title, style: TextStyle(color: tc.white, fontSize: 38),),
                              Text(formatter.format(publication.creationDate), style: TextStyle(color: tc.white, fontSize: 14),),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(publication.imageUrl),
                  )),
                ),
              ),
              Expanded(
                  flex: 6,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(publication.desc,
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: publication.paragraphe.length,
                              padding: const EdgeInsets.symmetric(vertical:16.0),
                              itemBuilder: (context, index){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: Text(publication.paragraphe[index].title, style: Theme.of(context).textTheme.headline1),
                                ),
                                Text(publication.paragraphe[index].texte, style: Theme.of(context).textTheme.bodyText1)
                              ],
                            );
                          })
                        ],
                      ),
                    ),
                  )),
            ]),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4 - 30,
            left: MediaQuery.of(context).size.width * 0.75 - 30,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  publication.isFav = !publication.isFav;
                });
              },
              child: Container(
                height: 60,
                width: 60,
                child: Center(child: Icon(publication.isFav ? Icons.favorite: Icons.favorite_outline, color: tc.lightGreen,),),
                decoration: BoxDecoration(
                  color: tc.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(3,1),
                      spreadRadius: 1
                    )
                  ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/*

Mémoire
Problématique
Un ou plusieurs dossier traités
Détailler les outils mis en place pour répondre à cette question
60 pages (avec illustrations) +-10% hors annexes
charte libre juste penser à la lisibilité (perso ou entreprise..)

Expliquer la problématique, les besoins et contraintes pour y répondre..
Expliquer l'organisation mit en place pour répondre à cette problématique

I. entreprise et intro vers la problématique
II. réponse a la problématique
III. pour aller plus loin

Retour sur expérience, parler des frustrations et des points d'améliorations

Soutenance
Choisir un instant précis à présenter et le développer
I. entreprise
II. problématique
III. détailler l'instant choisi (approfondi)

*/
