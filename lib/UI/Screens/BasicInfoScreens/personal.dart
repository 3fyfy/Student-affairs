import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/Core/Provider/basicInfoProvider.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/UI/Screens/BasicInfoScreens/componentBasic.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {

  TextEditingController nameArController;
  TextEditingController nameEnController;
  TextEditingController organizationController;
  TextEditingController religionController;
  TextEditingController genderController;
  TextEditingController nationalityController;
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


    return   (ssn!=0)?BaseView<HomeModel>(
      onModelReady: (model) => model.getStudentProfile(ssn),
      builder: (context, model, child)  {
       if (model.student==null)
       return  Center(child: CircularProgressIndicator());
      else  {
        String religion="";
        if(model.student.religion==1){
          religion="مسيحي";
        }
        else{
          religion="مسلم";
        }
        String gender="";
        if(model.student.gender){
          gender="ذكر";
        }
        else{
          gender="انثى";
        }
        return ListView(
        children: <Widget>[
          Form(
              child:Column(
            children: <Widget>[

              ComponentBasic("Name(Ar)",model.student.nameAr),
              ComponentBasic("Name (En)",model.student.nameEn),
              ComponentBasic("Organization",model.student.department.collage.name),
              ComponentBasic("Religion",religion),
              ComponentBasic("Gender",gender),
              ComponentBasic("Nationality",model.student.nationality),
              ComponentBasic("Birth data",model.student.birthDate),
              ComponentBasic("Birth Place",model.student.address),
              ComponentBasic("Relationship",model.student.relationship),
              ComponentBasic("ID Type",model.student.idType),
              ComponentBasic("National ID",model.student.ssn.toString()),


            ],
          )),
        ],
      );
      }
            }
    ):CircularProgressIndicator();
  }
}
