//import 'package:camera/camera.dart';
//import 'package:firebase_ml_vision/firebase_ml_vision.dart';
//import 'package:flutter/material.dart';
//import 'package:gradution_app/Core/Models/Utils.dart';
//import 'package:gradution_app/UI/Screens/samer/successfully_apply.dart';
//import 'dart:io';
//import 'package:image_picker/image_picker.dart';
//
//class student_Nomination_Card extends StatefulWidget {
//  final String appBartitle;
//  final String contenttitle;
//  final String SubTitle;
//  final String SerialTitle;
//  final TextEditingController controller;
//
//  student_Nomination_Card(
//      this.appBartitle, this.contenttitle, this.SubTitle, this.SerialTitle,
//      {this.controller});
//
//  @override
//  _student_Nomination_CardState createState() =>
//      _student_Nomination_CardState();
//}
//
//class _student_Nomination_CardState extends State<student_Nomination_Card> {
//  File pickedImage;
//
//  bool isImageLoaded = false;
//
//
//  Future pickImage() async {
//    var tempStore = await ImagePicker.pickImage(source: ImageSource.gallery);
//
//    setState(() {
//      pickedImage = tempStore;
//      isImageLoaded = true;
//    });
//  }
//
//  Future readText() async {
//    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);
//    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
//    VisionText readText = await recognizeText.processImage(ourImage);
//    print(readText.text);
//
//    for (TextBlock block in readText.blocks) {
//      print(block.text);
//
//      for (TextLine line in block.lines) {
//        print(line.text);
//
//        for (TextElement word in line.elements) {
//          print(word.text);
//
//        }
//      }
//    }
//  }
//
//  Future decode() async {
//    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);
//    BarcodeDetector barcodeDetector = FirebaseVision.instance.barcodeDetector();
//    List barCodes = await barcodeDetector.detectInImage(ourImage);
//
//    for (Barcode readableCode in barCodes) {
//      print(readableCode.displayValue);
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: Column(
//          children: <Widget>[
//            SizedBox(height: 100.0),
//            isImageLoaded
//                ? Center(
//              child: Container(
//                  height: 200.0,
//                  width: 200.0,
//                  decoration: BoxDecoration(
//                      image: DecorationImage(
//                          image: FileImage(pickedImage), fit: BoxFit.cover))),
//            )
//                : Container(),
//            SizedBox(height: 10.0),
//            RaisedButton(
//              child: Text('Pick an image'),
//              onPressed: pickImage,
//            ),
//            SizedBox(height: 10.0),
//            RaisedButton(
//              child: Text('Read Text'),
//              onPressed: readText,
//            ),
//            RaisedButton(
//              child: Text('Read Bar Code'),
//              onPressed: decode,
//            )
//          ],
//        ));
//
//  }
//}
