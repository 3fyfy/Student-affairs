import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/UI/Screens/BasicInfoScreens/componentBasic.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreviousQualification extends StatefulWidget {
  @override
  _PreviousQualificationState createState() => _PreviousQualificationState();
}

class _PreviousQualificationState extends State<PreviousQualification> {

  int ssn=0;

  pref()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.ssn = (prefs.getInt('SSN'));
    setState(() {

    });
  }

  @override
  void initState() {
    pref();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  (ssn!=0)?BaseView<HomeModel>(
      onModelReady: (model) => model.getStudentProfile(ssn),
      builder: (context, model, child) =>(model.student==null)?Center(child: CircularProgressIndicator()): ListView(
        children: <Widget>[
          Form(
              child:Column(
                children: <Widget>[

                  ComponentBasic("Previous Qualification",model.student.previousQualification),
                  ComponentBasic("Institue",model.student.institute),
                  ComponentBasic("Guardian Year","2016"),
                  ComponentBasic("Total","375.5"),
                  ComponentBasic("Percentage","${((375.5/410)*100).toStringAsFixed(2)}"),


                ],
              )),
        ],
      ),
    ):CircularProgressIndicator();
  }
}
