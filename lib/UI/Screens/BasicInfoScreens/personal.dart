import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/basicInfoProvider.dart';
import 'package:gradution_app/UI/Screens/BasicInfoScreens/componentBasic.dart';

import 'package:provider/provider.dart';

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



  @override
  Widget build(BuildContext context) {

    BasicInfoProvider basicInfoProvider=Provider.of<BasicInfoProvider>(context);

    return  ListView(
      children: <Widget>[
        Form(
            child:Column(
          children: <Widget>[

            ComponentBasic("Name(Ar)",basicInfoProvider.nameArController),
            ComponentBasic("Name (En)",basicInfoProvider.nameEnController),
            ComponentBasic("Organization",basicInfoProvider.organizationController),
            ComponentBasic("Religion",basicInfoProvider.religionController),
            ComponentBasic("Gender",basicInfoProvider.genderController),
            ComponentBasic("Nationality",basicInfoProvider.nationalityController),
            ComponentBasic("Birth data",basicInfoProvider.controller),
            ComponentBasic("Birth Place",basicInfoProvider.controller),
            ComponentBasic("Relationship",basicInfoProvider.controller),
            ComponentBasic("ID Type",basicInfoProvider.controller),
            ComponentBasic("National ID",basicInfoProvider.controller),


          ],
        )),
      ],
    );
  }
}
