import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrecautionsScreen extends StatefulWidget {
  final imgPath;
  final Color color;


  PrecautionsScreen({this.imgPath, this.color});

  @override
  _PrecautionsScreenState createState() => _PrecautionsScreenState();
}

class _PrecautionsScreenState extends State<PrecautionsScreen> {
  int selectedIndex=0;
  List<Map<String, String>> preventions = [
    {
      "prevention": "Protective Mask",
      "desc":
      "Always remember to wear a protective mask when stepping out.",
      "imgPath": "assets/prevention/mask.png",
    },
    {
      "prevention": "Wash Hands",
      "desc": "Wash your hands often with soap and water and for 20 seconds atleast.",
      "imgPath": "assets/prevention/wash.png",
    },
    {
      "prevention": "Cover Cough",
      "desc": "Cough or sneeze into your elbow or cover your mouth with a disposable napkin.",
      "imgPath": "assets/prevention/coughCover.png",
    },
    {
      "prevention": "Sanitize Often",
      "desc": "Use alchohol based sanitizer if water and soap are unavailable.",
      "imgPath": "assets/prevention/sanitizer.png",
    },
    {
      "prevention": "No Face Touching",
      "desc": "Don't touch your eyes, nose or mouth often and with unwashed hands.",
      "imgPath": "assets/prevention/touch.png",
    },
    {
      "prevention": "Social Distancing",
      "desc":
      "Keep 7m distance from other people. Stay at home and avoid gatherings.",
      "imgPath": "assets/prevention/socialDistance.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: widget.color,
              size: 28,
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          //image container
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
            ),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                  color: widget.color.withOpacity(0.2)),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  //Name
                  Positioned.fill(
                    top: -10,
                    left: 20,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Precautions",
                        style: TextStyle(
                            color: widget.color,
                            fontFamily: "Montserrat",
                            fontSize: 31,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),

                  //Image
                  Positioned.fill(
                    bottom: -25.0,
                    right: -6.0,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Hero(
                          tag: widget.imgPath,
                          child: Image(
                            image: AssetImage(widget.imgPath),
                            height: 230.0,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Precaution Card Grid
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              width: 360.0,
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 15.0,
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                childAspectRatio: 0.70,
                children: preventions.asMap().entries.map((MapEntry entry) {
                  int index=entry.key;
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedIndex=index;
                      });
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(15.0),
                      elevation: 5,
                      child: AnimatedContainer(
                        curve: Curves.fastOutSlowIn,
                        duration: Duration(milliseconds: 650),
                        decoration: BoxDecoration(
                          color: selectedIndex==index? Colors.blue[50]:Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: const EdgeInsets.fromLTRB(14, 16, 14, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Image(
                              image: AssetImage(entry.value["imgPath"]),
                              height: 100.0,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${entry.value["prevention"]}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Montserrat",
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Expanded(
                              child: Text(
                                "${entry.value['desc']}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Montserrat",
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
