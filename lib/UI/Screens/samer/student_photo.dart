import 'package:flutter/material.dart';
import 'package:gradution_app/UI/Screens/samer/successfully_apply.dart';


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
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: () {
          Navigator.of(context).pop();
        }),
      ),


      body: Padding(
          padding:  EdgeInsets.only(left:width*.07,right:width*.07 ),
      child:ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),

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

          InkWell(
            onTap: (){},
            child: Container(
                padding:  EdgeInsets.only(left:width*.07,right:width*.07 ),
                margin: EdgeInsets.only(top: height*.07 ),
                height:40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,

                ),
                  child: Text(
                    "Upload photo",
                    style: TextStyle(color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Nunito',
                    ),
                  ),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuccessfullyApply("Successfully \n you submit your profiles"),));


            },
            child: Container(
                padding:  EdgeInsets.only(left:width*.07,right:width*.07 ),
                margin: EdgeInsets.only(top: height*.07 ),
                height:40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,

                ),
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Nunito',
                    ),

              ),
            ),
          ),
        ],
      )),
    );
  }
}
