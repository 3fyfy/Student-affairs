import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Models/training_portal.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/UI/Screens/ApplyTraining.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';

class training_Portal extends StatefulWidget {
  @override
  _training_PortalState createState() => _training_PortalState();
}

class _training_PortalState extends State<training_Portal> {


  Widget _traning (TrainingPortal training){
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*.85,
        height: MediaQuery.of(context).size.height*.1,
        child: RaisedButton(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Colors.white,
            child: Text(
              training.name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Nunito'),
            ),
            onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => ApplyTraining(training),));
            }),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Training portal",
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontFamily: 'Nunito-Regular',
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: false,
        backgroundColor: Color(0xff2EB97F),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        }),      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 90,
            child: Padding(
              padding:  EdgeInsets.only(top:25.0,left: width*.05,right: width*.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Available training this year",
                    style: TextStyle(
                        color: Color(0xff2EB97F),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.5),
                      color: Color(0xff2EB97F)
                    ),

                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: (){},
                    )
                  ),
                ],
              ),
            ),
          ),
      BaseView<HomeModel>(
        onModelReady: (model) {
          return model.getAllTrainingPortalsInCollage(1);},
        builder: (context, model, child) => (model.trainingPortals==null)?Container(
            color: Colors.white,
            child: Center(child: CircularProgressIndicator())):  Container(
          height: height-0-kToolbarHeight,
              child: ListView.builder(
                padding:  EdgeInsets.only(top:25.0,left: width*.05,right: width*.05),
itemCount: model.trainingPortals.length,
itemBuilder: (context, index) {
                  return _traning(model.trainingPortals[index]);
},

        ),
            )   )
        ],
      ),
    );
  }
}
