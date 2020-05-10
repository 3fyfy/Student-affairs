import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'dart:io';

import 'package:gradution_app/UI/Widgets/ButtonNext.dart';
class ScanDetails extends StatefulWidget {

  File file;
  String title;
  ScanDetails(this.title,this.file);

  @override
  _ScanDetailsState createState() => _ScanDetailsState();
}

class _ScanDetailsState extends State<ScanDetails> {

  String textaa='';
    Future readText() async {

    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(widget.file);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();

    VisionText readText = await recognizeText.processImage(ourImage);
    print(readText.text);

    for (TextBlock block in readText.blocks) {
      final Rect boundingBox = block.boundingBox;
      final List<Offset> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<RecognizedLanguage> languages = block.recognizedLanguages;

      print(block.text);

      for (TextLine line in block.lines) {
        print(line.text);

        for (TextElement word in line.elements) {
          print(word.text);
       setState(() {
         textaa+=word.text+' ';
       });

        }
      }
    }
  }


  Widget build_Input(String title,String data){
      return           Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Text(
             title,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomLeft,
            decoration:BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))
            ),
            child: Text(data),
          )
        ],
      );

  }

  @override
  void initState() {
    // TODO: implement initState
    readText();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Scan Done",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        }),
      ),

      body: ListView(
        padding:  EdgeInsets.only(right: width * .05, left: width * .05),
        children: <Widget>[
          Container(
            height: height*.3,
            margin:EdgeInsets.only(top: 10,bottom: 20) ,
            child: Card(
              elevation: 5,
              child: Image.file(widget.file,),
            ),
          ),

          build_Input("Full Name", "Ahmed Mustafa Kamel"),
          build_Input("Date Birth", "05/05/1997"),
          build_Input("National ID", "29705051501058"),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(textaa),
          ),

          Padding(
            padding: const EdgeInsets.only(top:20,bottom: 10),
            child:InkWell(
              onTap: (){
                Navigator.of(context).pop();

              },
              child: Container(
                padding:  EdgeInsets.only(left:width*.07,right:width*.07 ),
                //  margin: EdgeInsets.only(left:width*.01,right:width*.01,bottom: height*.04,top: height*.04 ),
                height:40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  "Continue With this",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10,bottom: 10),
            child:InkWell(
              onTap: (){
                Navigator.of(context).pop();

              },
              child: Container(
                padding:  EdgeInsets.only(left:width*.07,right:width*.07 ),
                //  margin: EdgeInsets.only(left:width*.01,right:width*.01,bottom: height*.04,top: height*.04 ),
                height:40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  "Scan again",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ) ,
          ),





        ],
      ),


    );
  }
}
