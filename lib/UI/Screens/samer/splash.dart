import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.of(context).pushNamed(RoutePaths.Login));
  }

  @override
  Widget build(BuildContext context) {

    double _fontsize = MediaQuery.of(context).size.width * .06;
    double _copyRightFontSize = MediaQuery.of(context).size.width * .025;


    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width ,
        height: MediaQuery.of(context).size.height ,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/imags/logo_page_form.png'),fit: BoxFit.contain,alignment: Alignment.center),),
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
