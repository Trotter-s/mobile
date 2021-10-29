import 'package:flutter/material.dart';
import 'package:trotters_flutter_app/page/home/home.dart';
import 'package:trotters_flutter_app/page/home/widgets/trotters_input_text.dart';
import 'package:trotters_flutter_app/page/main.dart';
import 'package:trotters_flutter_app/page/profil/signup.dart';
import 'package:trotters_flutter_app/utils/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TrottersColors tc = TrottersColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: tc.green,
      ),
      backgroundColor: tc.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.12,
                        bottom: MediaQuery.of(context).size.height * 0.08),
                    child: Image(
                      width: MediaQuery.of(context).size.width * 0.55,
                      image: AssetImage("assets/trotterslogo.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.04),
                    child: Text(
                      "Créez, voyagez, partagez",
                      style: TextStyle(
                          fontSize: 24,
                          color: tc.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                    child: Column(children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pseudo",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              cursorColor: tc.green,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: tc.lightGreen, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintText: "Ex : Killian35",
                                  hintStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                  filled: true,
                                  fillColor: tc.lightgrey),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 32),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mot de passe",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              obscureText: true,
                              cursorColor: tc.green,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: tc.lightGreen, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                  filled: true,
                                  fillColor: tc.lightgrey),
                            )
                          ],
                        ),
                      ),
                    ]),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16, bottom: 32),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => MainPage()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: tc.green,
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Center(
                            child: Text(
                              "Je me connecte",
                              style: TextStyle(color: tc.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Vous avez oublié votre mot de passe ?",
                      style: TextStyle(fontSize: 11),
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Vous n'avez pas de compte ? ", style: TextStyle(fontSize: 16),),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                          },
                          child: Text("Créer un compte", style: TextStyle(fontSize: 16, decoration: TextDecoration.underline),),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


