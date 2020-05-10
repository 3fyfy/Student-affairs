//import 'package:flutter/material.dart';
//import 'package:gradution_app/UI/Screens/samer/successfully_apply.dart';
//import 'login_form.dart';
//import 'student_photo.dart';
//import 'package:image_picker/image_picker.dart';
//import 'dart:io';
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
//
//
//  File _image;
//
//  Future getImage() async {
//    var image = await ImagePicker.pickImage(source: ImageSource.camera);
//
//    setState(() {
//      _image = image;
//    });
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
//    double height = MediaQuery.of(context).size.height;
//    return Scaffold(
//      backgroundColor: Color(0xffFFFFFF),
//      appBar: AppBar(
//        title: Text(
//          widget.appBartitle,
//          style: TextStyle(
//            color: Color(0xffFFFFFF),
//            fontFamily: 'Nunito-Regular',
//            fontWeight: FontWeight.w300,
//          ),
//        ),
//        centerTitle: false,
//        backgroundColor: Color(0xff2EB97F),
//        leading: IconButton(
//            icon: Icon(
//              Icons.arrow_back_ios,
//              color: Colors.white,
//            ),
//            onPressed: () {
//              Navigator.of(context).pop();
//            }),
//      ),
//      body: Padding(
//        padding: EdgeInsets.only(right: width * .05, left: width * .05),
//        child: ListView(
//          children: <Widget>[
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Padding(
//                  padding: EdgeInsets.only(top: height * .1),
//                  child: Text(
//                    widget.contenttitle,
//                    style: TextStyle(
//                        fontSize: height * .037, fontWeight: FontWeight.w700),
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.only(top: height * .05),
//                  child: Text(
//                    widget.SubTitle,
//                    style: TextStyle(
//                        fontSize: 15,
//                        fontWeight: FontWeight.w700,
//                        color: Color(0xff2EB97F)),
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.only(top: height * .08),
//                  child: Text(
//                    widget.SerialTitle,
//                    style: TextStyle(
//                        fontSize: 20,
//                        fontWeight: FontWeight.w500,
//                        color: Colors.grey),
//                  ),
//                ),
//              ],
//            ),
//            new Row(
//              children: <Widget>[
//                Flexible(
//                  child: Padding(
//                    padding: EdgeInsets.only(top: height*.040, right: 15),
//                    child: Material(
//                      elevation: 7,
//                      borderRadius: BorderRadius.all(Radius.circular(12)),
//                      shadowColor: Colors.grey,
//                      child: TextField(
//                        keyboardType: TextInputType.number,
//                        cursorColor: Color(0xff2EB97F),
//                        obscureText: true,
//                        decoration: InputDecoration(
//                          hintText: 'xxxxxxxxxxx12',
//                          border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(12),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.only(top: height*.040),
//                  child: IconButton(
//                    icon: Icon(IconData(0xe900, fontFamily: 'iconScanBest1')),
//                    color: Color(0xff0ff2EB97F),
//                    iconSize: 40,
//                    onPressed: () {
//
//                      if (widget.appBartitle == "Medical examination") {
//                        Navigator.of(context).push(MaterialPageRoute(
//                          builder: (context) => student_Photo(),
//                        ));
//                      }
//                      else if(widget.appBartitle == "Model 2 enlisted"){
//                        Navigator.of(context).push(
//                          MaterialPageRoute(
//                            builder: (context) => student_Nomination_Card(
//                              "Medical examination",
//                              "Medical examination",
//                              "Please scan your medical examination",
//                              "serial number of Certificate",
//                            ),
//                          ),
//                        );
//                      }
//                      else if(widget.appBartitle == "The student's ID card"){
//                        Navigator.of(context).push(
//                          MaterialPageRoute(
//                            builder: (context) => student_Nomination_Card(
//                              "Model 2 enlisted",
//                              "Model 2 enlistedd",
//                              "Please scan your model 2 enlisted",
//                              "serial number of card",
//                            ),
//                          ),
//                        );
//                      }
//                      else if(widget.appBartitle == "Birth certificate"){
//                        Navigator.of(context).push(
//                          MaterialPageRoute(
//                            builder: (context) => student_Nomination_Card(
//                              "The student's ID card",
//                              "The student's ID card",
//                              "Please scan your the student's ID",
//                              "serial number of card",
//                            ),
//                          ),
//                        );
//                      }
//                      else if(widget.appBartitle == "High school certificate"){
//                        Navigator.of(context).push(
//                          MaterialPageRoute(
//                            builder: (context) => student_Nomination_Card(
//                              "Birth certificate",
//                              "Birth certificate",
//                              "Please scan your birth certificate",
//                              "Birth certificate serial",
//                            ),
//                          ),
//                        );
//                      }
//                      else if(widget.appBartitle == "Student nomination card"){
//                        Navigator.of(context).push(
//                          MaterialPageRoute(
//                            builder: (context) => student_Nomination_Card(
//                              "High school certificate",
//                              "High school certificate",
//                              "Please scan your high school certificate",
//                              "High school certificate serial",
//                            ),
//                          ),
//                        );
//                      }
//
//                      else{
//                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuccessfullyApply("Successfully \n you submit your profiles"),));
//                      }
//
//                    },
//                  ),
//                )
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
