import 'package:alzh/games/goodspirits.dart';
import 'package:alzh/games/memory_game/memory_game.dart';
import 'package:flutter/material.dart';
import 'package:alzh/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:alzh/scoped_models/model.dart';

class ValidWordCheck2 extends StatefulWidget {
  @override
  _ValidWordCheckState createState() => _ValidWordCheckState();
}

class _ValidWordCheckState extends State<ValidWordCheck2> {
  int validWordCheck2 = 0;
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Scaffold(
        backgroundColor: primaryTeal,
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
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.center,
              color: primaryTeal,
              child: Center(
                child: Text("Cuanto es 16 + 17", style: primaryFont),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(75),
                      topRight: Radius.circular(75))),
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selected1 = true;
                              selected2 = false;
                              selected3 = false;
                              validWordCheck2 = 1;
                            });
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 50.0,
                                width: 120.0,
                                child: Text("45",
                                    style: GoogleFonts.signika(
                                        color: black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0)),
                              )),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selected1 = false;
                              selected2 = true;
                              selected3 = false;
                              validWordCheck2 = 0;
                            });
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 50.0,
                                width: 120.0,
                                child: Text("23",
                                    style: GoogleFonts.signika(
                                        color: black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0)),
                              )),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selected1 = false;
                              selected2 = false;
                              selected3 = true;
                              validWordCheck2 = 0;
                            });
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 50.0,
                                width: 120.0,
                                child: Text("33",
                                    style: GoogleFonts.signika(
                                        color: black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0)),
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
            /*  setState(() => model.addScore(validWordCheck2));
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => GoodSpiritCheck())); */
          },
        ),
      );
    });
  }
}
