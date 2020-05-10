import 'package:flutter/material.dart';
import 'package:gradution_app/UI/PasswordChange.dart';
class PasswordLogo extends StatefulWidget {
  @override
  _PasswordLogoState createState() => _PasswordLogoState();
}

class _PasswordLogoState extends State<PasswordLogo> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        padding:  EdgeInsets.only(right: width * .05, left: width * .05),

        children: <Widget>[
          Container(
            height: height*.4,
            padding: EdgeInsets.only(top: height*.05,bottom: height*.02),
            child: Image(image: AssetImage("Assets/secure.png")),
          ),
          Container(
            height: height*.2,
            alignment: Alignment.center,
            child: Text("Password Changing",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
          ),
          Container(
            height: height*.1,
            alignment: Alignment.center,
            child: Text("Your Password is Successfully ",style: TextStyle(fontSize: 20,color: Colors.black38),),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20,bottom: 10),
            child:InkWell(
              onTap: (){

                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PasswordChange(),));

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
                  "Continue",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
