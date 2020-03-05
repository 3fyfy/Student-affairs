import 'package:flutter/material.dart';
import 'package:gradution_app/Screens/samer/successfully_apply.dart';


// ignore: camel_case_types
class student_Photo extends StatefulWidget {
  @override
  _student_PhotoState createState() => _student_PhotoState();
}

class _student_PhotoState extends State<student_Photo> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double _fontsize = MediaQuery.of(context).size.width * .06;


    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Student Photo",
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
          Text(
            "Add personal photo of you",
            style: TextStyle(
              color: Color(0xff000000),
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Nunito',
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .35,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(
                        'Assets/imags/student_photo_pic.png'))),
          ),

          Container(
            padding:  EdgeInsets.only(left:width*.05,right:width*.05,top: height*.1),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color(0xff2EB97F),
                child: Text(
                  "Upload photo",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                  ),
                ),
                onPressed: () {}
            ),
          ),

          Container(
            padding:  EdgeInsets.only(left:width*.05,right:width*.05,top: height*.02),

            child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color(0xff2EB97F),
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuccessfullyApply("Successfully \n you submit your profiles"),));
                }
            ),
          ),
        ],
      ),
    );
  }
}
