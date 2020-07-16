import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/Core/Provider/basicInfoProvider.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/UI/Screens/BasicInfoScreens/componentBasic.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GradutionInfo extends StatefulWidget {
  @override
  _GradutionInfoState createState() => _GradutionInfoState();
}

class _GradutionInfoState extends State<GradutionInfo> {
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

    return  (ssn!=0)?  BaseView<HomeModel>(
      onModelReady: (model) => model.getStudentProfile(ssn),
      builder: (context, model, child) =>(model.student==null)?Center(child: CircularProgressIndicator()): ListView(
        children: <Widget>[
          Form(
              child:Column(
                children: <Widget>[

                  ComponentBasic("Name",model.student.guardian.name),
                  ComponentBasic("ID Nationality","٢٦٧١٠٢٢١٥٠٠٢٧٥"),
                  ComponentBasic("Job Title",model.student.guardian.jobTitle),
                  ComponentBasic("Work Place",model.student.guardian.workPlace),
                  ComponentBasic("Relationship",model.student.guardian.relation.toString()),
                  ComponentBasic("Address",model.student.address),
                  ComponentBasic("Home Tel",model.student.guardian.homeTel),
                  ComponentBasic("Mobile",model.student.guardian.mobile),
                  ComponentBasic("Email",model.student.guardian.email),
                  ComponentBasic("Fax",model.student.guardian.fax),



                ],
              )),
        ],
      ),
    ):CircularProgressIndicator();
  }
}
