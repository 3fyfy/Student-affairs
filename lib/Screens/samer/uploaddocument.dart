import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'splash.dart';
import 'housing_home.dart';

class UploadedHome extends StatefulWidget {
  @override
  _UploadedHomeState createState() => _UploadedHomeState();
}

class _UploadedHomeState extends State<UploadedHome> {
  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    double _fontsize = MediaQuery.of(context).size.width * .06;


    return Scaffold(
      appBar: AppBar(
      title: Text(
        "Upload your document",
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
                        'Assets/imags/upload_pic.png'))),
          ),

          Center(
            child: Text(
              "upload your files",
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: _fontsize,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito',
              ),
            ),
          ),

          Container(
            alignment: Alignment.center,
            padding:  EdgeInsets.only(left:width*.05,right:width*.05,top: height*.1 ),
            child: Text(
              "we'll help you to upload your files in few easy steps",
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 20,
                  fontFamily: 'Nunito'
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Container(
            padding:  EdgeInsets.only(left:width*.05,right:width*.05,top: height*.1 ),

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
                onPressed: () {
                  Navigator.of(context).pushNamed("/studentPhoto");
                }
            ),
          )

        ],
      ),
    );
  }
}
