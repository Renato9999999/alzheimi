import 'package:alzh/games/identify2.dart';
import 'package:flutter/material.dart';
import 'package:alzh/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:alzh/scoped_models/model.dart';

class IdentifyObj1 extends StatefulWidget {
  @override
  _IdentifyObj1State createState() => _IdentifyObj1State();
}

class _IdentifyObj1State extends State<IdentifyObj1> {
  int obj1Score = 0;
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
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.center,
              color: primaryTeal,
              child: Center(
                child: Text("Identify the object showed in the picture below?",
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
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: (MediaQuery.of(context).size.height) / 3,
                          width: (MediaQuery.of(context).size.width) * 0.7,
                          child: Image.asset(
                            "assets/images/Watch.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selected1 = true;
                              selected2 = false;
                              obj1Score = 0;
                            });
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 70.0,
                                //width: 120.0,
                                child: Text("Bat",
                                    style: GoogleFonts.signika(
                                        color: black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0)),
                              )),
                        ),
                        SizedBox(height: 30.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selected1 = false;
                              selected2 = true;
                              obj1Score = 1;
                            });
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 70.0,
                                //width: 120.0,
                                child: Text("Watch",
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
            setState(() => model.addScore(obj1Score));
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => IdentifyObj2()));
          },
        ),
      );
    });
  }
}
