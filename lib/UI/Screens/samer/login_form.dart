import 'package:flutter/material.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'package:gradution_app/UI/Widgets/ButtonNext.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: ListView(
          children: <Widget>[
        Container(
          height: height/3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage(
                      'Assets/imags/logo_page_form.png'),
                  fit: BoxFit.contain)),
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
          decoration: InputDecoration(

          hintText: 'Password',
          icon: Icon(Icons.lock_outline),
          hoverColor: Colors.green),
          ),

          FlatButton(
              padding:  EdgeInsets.only(left:0),
          onPressed: () {},
          child: Text(
          "forget password ?",
          style: TextStyle(color: Color(0xffDE2727)),
          )),
        ],
      ),
    ),


            Padding(
              padding:  EdgeInsets.only(top:height*.03,bottom:height*.03,right: width*.05,left: width*.05 ),
              child: ButtonNext("LOG IN",RoutePaths.mobile_Phone),
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
