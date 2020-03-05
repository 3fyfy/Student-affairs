import 'package:flutter/material.dart';

class login_Form extends StatefulWidget {
  @override
  _login_FormState createState() => _login_FormState();
}

class _login_FormState extends State<login_Form> {
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
    padding: const EdgeInsets.only(top: 20),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
    Padding(
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
    Padding(
    padding:  EdgeInsets.only(right: width*.05),
    child: SizedBox(
    width: 150,
    height: 45,
    child: RaisedButton(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    color: Color(0xff2EB97F),
    child: Text(
    "organization",
    style: TextStyle(
    color: Colors.white,
    fontSize: 17,
    fontFamily: 'Nunito'),
    ),
    onPressed: () {}),
    ),
    )
    ],
    ),
    ),

    Container(
    alignment: Alignment.topLeft,
      padding:  EdgeInsets.only(left:width*.05,top: 20),
    child: Text(
    "Your National ID",
    style: TextStyle(
    color: Color(0xff131414),
    fontWeight: FontWeight.w600),
    ),
    ),

    Center(
    child: Column(
    children: <Widget>[
    Padding(
    padding:
    const EdgeInsets.only(top: 20, left: 20, right: 40),
    child: TextField(
    cursorColor: Color(0xff2EB97F),
    decoration: InputDecoration(
    hintText: 'National ID',
    icon: Icon(Icons.person_outline),
    ),
    ),
    ),
    ],
    ),
    ),

    Container(
    alignment: Alignment.topLeft,
      padding:  EdgeInsets.only(left:width*.05,top: 20),

      child: Text(
    "Password",
    style: TextStyle(
    color: Color(0xff131414),
    fontWeight: FontWeight.w600),
    ),
    ),

    Center(
    child: Padding(
    padding:
    const EdgeInsets.only(top: 20, left: 20, right: 40),
    child: TextField(
    cursorColor: Color(0xff2EB97F),
    obscureText: true,
    decoration: InputDecoration(

    hintText: 'Password',
    icon: Icon(Icons.lock_outline),
    hoverColor: Colors.green),
    ),
    ),
    ),
    Container(
    alignment: Alignment.topLeft,

        child: FlatButton(
            padding:  EdgeInsets.only(left:width*.05),
    onPressed: () {},
    child: Text(
    "forget password ?",
    style: TextStyle(color: Color(0xffDE2727)),
    ))),

    Container(
      padding:  EdgeInsets.only(left:width*.05,right:width*.05 ),

      child: RaisedButton(
          shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      ),
      color: Color(0xff2EB97F),
      child: Text(
      "LOG IN",
      style: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontFamily: 'Nunito'),
      ),
      onPressed: () {
            Navigator.of(context).pushNamed('/uploadedhome');
      }),
    ),
    Container(
    alignment: Alignment.topLeft,
      padding:  EdgeInsets.only(left:width*.05,right:width*.05,top: height*.05 ),

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
