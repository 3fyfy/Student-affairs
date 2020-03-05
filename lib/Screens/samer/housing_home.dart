import 'package:flutter/material.dart';
import 'student_photo.dart';

class HousingHome extends StatefulWidget {
  @override
  _HousingHomeState createState() => _HousingHomeState();
}

class _HousingHomeState extends State<HousingHome> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "University Housing",
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontFamily: 'Nunito-Regular',
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: false,
        backgroundColor: Color(0xff2EB97F),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: () {
          Navigator.of(context).pop();
        }),
      ),
      body: ListView(

        children: <Widget>[

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .35,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(
                        'Assets/imags/university_housing_pic.png'))),
          ),

          Center(
            child: Text(
              "University Housing",
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito',
              ),
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(left: width*.05, right: width*.05,top:height*.05 ),
            child: Text(
              "we'll help you to apply for housing in few easy steps",
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 20,
                  fontFamily: 'Nunito'
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding:  EdgeInsets.only(left: width*.05, right: width*.05,top:height*.05 ),

            child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color(0xff2EB97F),
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {}
            ),
          )],
      ),
    );
  }
}
