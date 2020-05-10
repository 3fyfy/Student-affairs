import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';

class SuccessfullyApply extends StatefulWidget {
  String text;


  SuccessfullyApply(this.text);

  @override
  _SuccessfullyApplyState createState() => _SuccessfullyApplyState();
}

class _SuccessfullyApplyState extends State<SuccessfullyApply> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), ()=>Navigator.of(context).pushNamed(RoutePaths.Profile));
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffff2EB97F),
      appBar: AppBar(
        backgroundColor: Color(0xff2EB97F),
        elevation: 0,
        leading: Icon(null),
      ),

      body: ListView(
        children: <Widget>[
          Container(
            child: Center(
              child: Padding(
                padding:  EdgeInsets.only(right:width*.05,left: width*.05,top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height/3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage(
                                  'Assets/imags/successfully_hospital_pic.png'),
                              fit: BoxFit.contain)),
                    ),
                    Text(
                      "${widget.text}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 20,
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ),
        ],
      ),
    );
  }
}
