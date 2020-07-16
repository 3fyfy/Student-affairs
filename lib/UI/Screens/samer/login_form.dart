import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Api/api.dart';
import 'package:gradution_app/Core/Models/Student.dart';
import 'package:gradution_app/Core/Models/patient_book.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';
import 'package:gradution_app/UI/Screens/screenfinal/chosing_department.dart';
import 'package:gradution_app/UI/Screens/screenfinal/medical_examination_1.dart';
import 'package:gradution_app/UI/Screens/screenfinal/other_services.dart';
import 'package:gradution_app/UI/Screens/screenfinal/reset_password.dart';
import 'package:gradution_app/UI/Screens/screenfinal/scanning_nomination_card.dart';
import 'package:gradution_app/UI/Screens/screenfinal/scholarship_portal.dart';
import 'package:gradution_app/UI/Screens/samer/mobile_phone.dart';
import 'package:gradution_app/UI/Widgets/ButtonNext.dart';
import 'dart:convert' as convert;

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _nationalId=TextEditingController();
  TextEditingController _Password=TextEditingController();
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();


  Future getdata()async{

    Api api=Api();
    //api.updateStudentData();
  }
  @override
  Widget build(BuildContext context) {

   MainProvider mainProvider=Provider.of<MainProvider>(context);

    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: ListView(
          children: <Widget>[
        InkWell(
          onTap:() async{
    if(_nationalId.text.isEmpty&&_Password.text.isEmpty){

    }
    else {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('SSN', int.parse(_nationalId.text)).then((value){
    Navigator.of(context).pushNamed(RoutePaths.Profile);
    return value;
    });
    }
    },
          child: Container(
            height: height/3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(
                        'Assets/imags/logo_page_form.png'),
                    fit: BoxFit.contain)),
          ),
        ),

    Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Padding(
    padding:  EdgeInsets.only(left:width*.05),
    child: Text(
    "Login",
    style: TextStyle(
    fontSize: 30,
    color: Color(0xff131414),
    fontWeight: FontWeight.w900,
    fontFamily: 'Nunito',
    ),
    ),
    ),
    ),

    Container(
      padding:  EdgeInsets.only(left:width*.07,top: 20,right:width*.07 ),
      child: Form(
        key: globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
            "Your National ID",
            style: TextStyle(
            color: Color(0xff131414),
            fontWeight: FontWeight.w600),
            ),

            TextField(
            cursorColor: Color(0xff2EB97F),
            controller: _nationalId,
            decoration: InputDecoration(
            hintText: 'National ID',

            icon: Icon(Icons.person_outline),
            ),
            ),
            SizedBox(
              height: 20,
            ),

            Text(
            "Password",

            style: TextStyle(
            color: Color(0xff131414),
            fontWeight: FontWeight.w600),
            ),

            TextField(
            cursorColor: Color(0xff2EB97F),
            obscureText: true,
            controller: _Password,
            decoration: InputDecoration(

            hintText: 'Password',
            icon: Icon(Icons.lock_outline),
            hoverColor: Colors.green),
            ),

            FlatButton(
                padding:  EdgeInsets.only(left:0),
            onPressed: ()async{
    if(_nationalId.text.isEmpty&&_Password.text.isEmpty){

    }
    else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('SSN', int.parse(_nationalId.text)).then((value){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => mobile_Phone(resetPassword: true,),));
        return value;
      });
    }
            },
            child: Text(
            "forget password ?",
            style: TextStyle(color: Color(0xffDE2727)),
            )),
          ],
        ),
      ),
    ),


            Padding(
              padding:  EdgeInsets.only(top:height*.03,bottom:height*.03,right: width*.05,left: width*.05 ),
              child: InkWell(
                onTap: ()async{

mainProvider.setssn(int.parse(_nationalId.text));
mainProvider.setid(1);
mainProvider.setuserName(_nationalId.text);
mainProvider.setpassword(_Password.text);

if(_nationalId.text.isEmpty&&_Password.text.isEmpty){

}
else{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('SSN', int.parse(_nationalId.text));
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => mobile_Phone(resetPassword: false,),));
}


                },
                child: Container(
                  padding:  EdgeInsets.only(left:width*.07,right:width*.07 ),
                  //  margin: EdgeInsets.only(left:width*.01,right:width*.01,bottom: height*.04,top: height*.04 ),
                  height:40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    "LOG IN",
                    style: TextStyle(color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
              )
              ),

            Container(
      alignment: Alignment.topLeft,
        padding:  EdgeInsets.only(left:width*.05,right:width*.05,bottom: height*.03 ),

        child: Column(
      children: <Widget>[
      Padding(
      padding: const EdgeInsets.only(right: 120),
      child: Text(
        "Register note",
        style: TextStyle(color: Color(0xff2EB97F)),
        ),

      ),
      Text(
      " - username: National Id (14 num)",
      style: TextStyle(
      color: Color(0xff0A0A0A),
      fontWeight: FontWeight.w300,
      fontSize: 14
      ),
      ),
      Text(" - password: National Id (14 num)",
      style: TextStyle(
      color: Color(0xff0A0A0A),
      fontWeight: FontWeight.w300,
      fontSize: 14
      ),
      ),
      ],
      ),
      )
          ],

        ));
  }
}
