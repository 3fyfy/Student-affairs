import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/Core/Provider/basicInfoProvider.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/UI/Screens/BasicInfoScreens/componentBasic.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController controller;


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


    return   (ssn!=0)? BaseView<HomeModel>(
      onModelReady: (model) => model.getStudentProfile(ssn),
      builder: (context, model, child) =>(model.student==null)?Center(child: CircularProgressIndicator()): ListView(
        children: <Widget>[
          Form(
              child:Column(
                children: <Widget>[
                ComponentBasic("City",model.student.address.split('-')[1]),
                ComponentBasic("Address",model.student.address),
                ComponentBasic("Home Tel",model.student.homeTel),
                ComponentBasic("Mobile",model.student.mobile),
                ComponentBasic("Email",model.student.mailBox),
                ComponentBasic("Fax",model.student.fax),
                ComponentBasic("Postal Code",model.student.postalCode),


                ],
              )),
        ],
      ),
    ):CircularProgressIndicator();
  }
}
