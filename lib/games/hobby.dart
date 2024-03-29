import 'package:alzh/games/clothes.dart';
import 'package:alzh/games/thankyou.dart';
import 'package:alzh/games/validLetters1.dart';
import 'package:alzh/scoped_models/model.dart';
import 'package:flutter/material.dart';
import 'package:alzh/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoped_model/scoped_model.dart';

class HobbyCheck extends StatefulWidget {
  @override
  _HobbyCheckState createState() => _HobbyCheckState();
}

class _HobbyCheckState extends State<HobbyCheck> {
  int hobbyCheck = 0;
  bool selected1 = false;
  bool selected2 = false;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryTeal,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: white,
          ),
        ),
        backgroundColor: primaryTeal,
        body: Column(children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.center,
              color: primaryTeal,
              child: Center(
                child: Text(
                    "Do you enjoy any hobby? Like reading, dancing or playing some musical instrument, gardening, drawing and painting, playing with pets etc.",
                    style: primaryFont),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(75),
                      topRight: Radius.circular(75))),
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selected1 = true;
                              selected2 = false;
                              hobbyCheck = 1;
                            });
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 50.0,
                                width: 120.0,
                                child: Text("YES",
                                    style: GoogleFonts.signika(
                                        color: black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0)),
                              )),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selected1 = false;
                              selected2 = true;
                              hobbyCheck = 0;
                            });
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 50.0,
                                width: 120.0,
                                child: Text("NO",
                                    style: GoogleFonts.signika(
                                        color: black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0)),
                              )),
                        )
                      ])),
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryTeal,
          child: Icon(Icons.arrow_forward_ios, color: white),
          onPressed: () {
            setState(() {
              model.addScore(hobbyCheck);
              model.addEmoScore(hobbyCheck);
            });
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ClothesCheck()));
          },
        ),
      );
    });
  }
}
