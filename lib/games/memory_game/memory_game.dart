import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alzh/games/memory_game/data.dart';
import 'package:alzh/games/memory_game/tile_model.dart';
import 'package:alzh/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class MemoryGame extends StatefulWidget {
  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  List<TileModel> gridViewTiles = new List<TileModel>();
  List<TileModel> questionPairs = new List<TileModel>();

  bool letsPlay = false;
  int noOfQuestion = 0;

  @override
  void initState() {
    super.initState();
  }

  void reStart() {
    myPairs = getPairs(gameLevel);
    myPairs.shuffle();

    gridViewTiles = myPairs;

    noOfQuestion = 6;

    // if (gameLevel == "easy") {
    //   noOfQuestion = 6;
    // } else if (gameLevel == "medium") {
    //   noOfQuestion = 8;
    // } else if (gameLevel == "hard") {
    //   noOfQuestion = 12;
    // }

    Future.delayed(const Duration(seconds: 7), () {
      setState(() {
        questionPairs = getQuestionPairs(gameLevel);
        gridViewTiles = questionPairs;
        selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Memory Game',
              style: GoogleFonts.acme(
                color: white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: primaryTeal),
      body: letsPlay
          ? SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    points != noOfQuestion
                        ? GridView(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    mainAxisSpacing: 0.0,
                                    maxCrossAxisExtent: 120),
                            children:
                                List.generate(gridViewTiles.length, (index) {
                              return Tile(
                                imageAssetPath:
                                    gridViewTiles[index].getImageAssetPath(),
                                parent: this,
                                tileIndex: index,
                              );
                            }),
                          )
                        : Center(
                            child: GestureDetector(
                              onTap: () {
                                letsPlay = false;
                                reStart();
                                setState(() {
                                  points = 0;
                                });
                              },
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    " 🎉",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 150),
                                  ),
                                  SizedBox(
                                    height: 80,
                                  ),
                                  Container(
                                    height: 60,
                                    width: 170,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      border: Border.all(
                                          width: 3, color: Colors.black),
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    child: Text(
                                      "REPLAY",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            )
          : Container(
              color: white,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage("Images/jungle4.png"),
              //     fit: BoxFit.fill,
              //   ),
              // ),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 70.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                   Text("Match the pairs of tiles with the same animals", style: primaryFont),
                    GestureDetector(
                      onTap: () {
                        gameLevel = "easy";
                        setState(() {
                          letsPlay = true;
                        });
                        reStart();
                      },
                      child: FractionallySizedBox(
                        widthFactor: 0.7,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            //border: Border.all(width: 2, color: Colors.black),
                            color: primaryTeal,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'Begin',
                              style: GoogleFonts.signika(
                                  color: white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     gameLevel = "medium";
                    //     setState(() {
                    //       letsPlay = true;
                    //     });
                    //     reStart();
                    //   },
                    //   child: FractionallySizedBox(
                    //     widthFactor: 0.7,
                    //     child: Container(
                    //       alignment: Alignment.center,
                    //       decoration: BoxDecoration(
                    //         //border: Border.all(width: 2, color: Colors.black),
                    //         color: primaryTeal,
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       child: Padding(
                    //         padding: const EdgeInsets.symmetric(vertical: 10.0),
                    //         child: Text(
                    //           "MEDIUM",
                    //           style: GoogleFonts.signika(
                    //               color: white,
                    //               fontSize: 28,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // // SizedBox(
                    // //   height: 20,
                    // // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     gameLevel = "hard";
                    //     setState(() {
                    //       letsPlay = true;
                    //     });
                    //     reStart();
                    //   },
                    //   child: FractionallySizedBox(
                    //     widthFactor: 0.7,
                    //     child: Container(
                    //       alignment: Alignment.center,
                    //       decoration: BoxDecoration(
                    //         //border: Border.all(width: 2, color: Colors.black),
                    //         color: primaryTeal,
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       child: Padding(
                    //         padding: const EdgeInsets.symmetric(vertical: 10.0),
                    //         child: Text(
                    //           "HARD",
                    //           style: GoogleFonts.signika(
                    //               color: white,
                    //               fontSize: 28,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
    );
  }
}

class Tile extends StatefulWidget {
  final String imageAssetPath;
  final int tileIndex;
  final _MemoryGameState parent;

  Tile({this.imageAssetPath, this.tileIndex, this.parent});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          setState(() {
            myPairs[widget.tileIndex].setIsSelected(true);
          });
          if (selectedTile != "") {
            if (selectedTile == myPairs[widget.tileIndex].getImageAssetPath()) {
              points = points + 1;
              TileModel tileModel = new TileModel();
              selected = true;
              Future.delayed(const Duration(seconds: 1), () {
                tileModel.setImageAssetPath("");
                myPairs[widget.tileIndex].setImageAssetPath("");
                myPairs[selectedIndex] = tileModel;
                this.widget.parent.setState(() {});
                setState(() {
                  selected = false;
                });
                selectedTile = "";
              });
            } else {
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                this.widget.parent.setState(() {
                  myPairs[widget.tileIndex].setIsSelected(false);
                  myPairs[selectedIndex].setIsSelected(false);
                });
                setState(() {
                  selected = false;
                });
              });

              selectedTile = "";
            }
          } else {
            setState(() {
              selectedTile = myPairs[widget.tileIndex].getImageAssetPath();
              selectedIndex = widget.tileIndex;
            });
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: myPairs[widget.tileIndex].getImageAssetPath() != ""
            ? Image.asset(myPairs[widget.tileIndex].getIsSelected()
                ? myPairs[widget.tileIndex].getImageAssetPath()
                : widget.imageAssetPath)
            : Container(
                child: Image.asset("assets/tests/correct.png"),
              ),
      ),
    );
  }
}
