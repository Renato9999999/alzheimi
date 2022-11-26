import 'package:alzh/games/Clock_game.dart';
import 'package:alzh/scoped_models/model.dart';
import 'package:flutter/material.dart';
import 'package:alzh/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoped_model/scoped_model.dart';

class AppNameCheck extends StatefulWidget {
  @override
  _AppNameCheckState createState() => _AppNameCheckState();
}

class _AppNameCheckState extends State<AppNameCheck> {
  int appNameCheck = 0;
  bool selected1 = false;
  bool selected2 = false;
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
        body: Column(children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.center,
              color: primaryTeal,
              child: Center(
                child: Text("Como se llama el robot?", style: primaryFont),
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
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selected1 = true;
                              selected2 = false;
                              appNameCheck = 0;
                            });
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 70.0,
                                //width: 120.0,
                                child: Text("Robotin",
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
                              appNameCheck = 1;
                            });
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 70.0,
                                //width: 120.0,
                                child: Text("Alzheimi",
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
            setState(() => model.addScore(appNameCheck));
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ClockGame()));
          },
        ),
      );
    });
  }
}
