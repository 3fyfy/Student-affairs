import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/basicInfoProvider.dart';
import 'package:gradution_app/UI/Screens/BasicInfoScreens/componentBasic.dart';

import 'package:provider/provider.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {

    BasicInfoProvider basicInfoProvider=Provider.of<BasicInfoProvider>(context);

    return  ListView(
      children: <Widget>[
        Form(
            child:Column(
              children: <Widget>[
                ComponentBasic("Country",basicInfoProvider.controller),
                ComponentBasic("City",basicInfoProvider.controller),
                ComponentBasic("State",basicInfoProvider.controller),
                ComponentBasic("Address",basicInfoProvider.controller),
                ComponentBasic("Home Tel",basicInfoProvider.controller),
                ComponentBasic("Mobile",basicInfoProvider.controller),
                ComponentBasic("Email",basicInfoProvider.controller),
                ComponentBasic("Fax",basicInfoProvider.controller),
                ComponentBasic("Postal Code",basicInfoProvider.controller),


              ],
            )),
      ],
    );
  }
}
