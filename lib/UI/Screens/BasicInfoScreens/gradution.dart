import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/basicInfoProvider.dart';
import 'package:gradution_app/UI/Screens/BasicInfoScreens/componentBasic.dart';

import 'package:provider/provider.dart';

class GradutionInfo extends StatefulWidget {
  @override
  _GradutionInfoState createState() => _GradutionInfoState();
}

class _GradutionInfoState extends State<GradutionInfo> {


  @override
  Widget build(BuildContext context) {
    BasicInfoProvider basicInfoProvider=Provider.of<BasicInfoProvider>(context);

    return  ListView(
      children: <Widget>[
        Form(
            child:Column(
              children: <Widget>[


                ComponentBasic("Job Title",basicInfoProvider.controller),
                ComponentBasic("Work Place",basicInfoProvider.controller),
                ComponentBasic("Relationship",basicInfoProvider.controller),
                ComponentBasic("Country",basicInfoProvider.controller),
                ComponentBasic("City",basicInfoProvider.controller),
                ComponentBasic("State",basicInfoProvider.controller),
                ComponentBasic("Address",basicInfoProvider.controller),
                ComponentBasic("Home Tel",basicInfoProvider.controller),
                ComponentBasic("Mobile",basicInfoProvider.controller),
                ComponentBasic("Email",basicInfoProvider.controller),


              ],
            )),
      ],
    );
  }
}
