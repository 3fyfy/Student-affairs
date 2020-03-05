import 'dart:async';

import 'package:flutter/material.dart';

class LogoPage extends StatefulWidget {
  @override
  _LogoPageState createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.of(context).pushNamed('/loign'));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double _height_copyright = MediaQuery.of(context).size.height * .32;
    double _fontsize = MediaQuery.of(context).size.width * .06;
    double _copyRightFontSize = MediaQuery.of(context).size.width * .025;

    TextStyle _fontstyle = TextStyle(
      color: Color(0xff30C184),
      fontSize: _fontsize,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w500,
      shadows: <Shadow>[
        Shadow(
            offset: Offset(4, 4), blurRadius: 5, color: Colors.grey.shade400),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 50,
                  height: MediaQuery.of(context).size.height * .27,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage('Assets/imags/sp_logo.png'))),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                  ),
                  child: Transform.translate(
                    offset: Offset(0, -10),
                    child: RichText(
                        text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: "Student  ", style: _fontstyle),
                        TextSpan(
                            text: "Affairs ",
                            style: TextStyle(
                              fontSize: _fontsize,
                              fontFamily: 'Nunito',
                              color: Color(0xff111010),
                              fontWeight: FontWeight.w500,
                              shadows: <Shadow>[
                                Shadow(
                                    offset: Offset(4, 4),
                                    blurRadius: 5,
                                    color: Colors.grey.shade400),
                              ],
                            )),
                        TextSpan(text: "Management  ", style: _fontstyle),
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "All Rights Are Saved ",
              style:
              TextStyle(color: Color(0xff30C184), fontSize: _copyRightFontSize),
            ),
            Icon(
              (Icons.copyright),
              color: Color(0xff817C7C),
              size: _copyRightFontSize +7,
            ),
            Text(
              "Technical and Communication Center",
              style:
              TextStyle(color: Color(0xff817C7C), fontSize: _copyRightFontSize-3),
            ),
          ],
        ),
      ),

    );
  }
}
