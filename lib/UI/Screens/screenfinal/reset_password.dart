import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'package:gradution_app/UI/Screens/PasswordChange.dart';
import 'package:gradution_app/UI/Screens/PasswrdLogo.dart';
import 'package:gradution_app/UI/Widgets/ButtonNext.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class reset_Password extends StatefulWidget {
  @override
  _reset_PasswordState createState() => _reset_PasswordState();
}

class _reset_PasswordState extends State<reset_Password> {


  TextEditingController verificationCodeNum=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset password",
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontFamily: 'Nunito-Regular',
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: false,
        backgroundColor: Color(0xff2EB97F),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: () {
          Navigator.of(context).pop();

        }),
      ),
      body: ListView(
        padding: EdgeInsets.only(right: width * .05, left: width * .05),

        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50, left: 35),
                child: Text(
                  "Update your password",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
//                        image: DecorationImage(
//                          image: ExactAssetImage("assets/imags/chat_pic.png"),
//                        ),
                      ),
                    ),
                    Text(
                      "enter the code we just sent \n to *********29",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 25,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: VerificationCodeInput(
                      itemSize: 60,
                      autofocus: true,

                      textStyle:
                          TextStyle(fontSize: 18, color: Color(0xff2EB97F)),
                      itemDecoration: BoxDecoration(
                        border: Border.all(width: 2, color: Color(0xff2EB97F)),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      keyboardType: TextInputType.number,
                      length: 4,
                   onCompleted: (String value) {
    verificationCodeNum.text=value;
    },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: Text("Back",
                          style: TextStyle(color: Colors.grey, fontSize: 18)),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: FlatButton(
                        child: Text("Resend Code",
                            style: TextStyle(color: Colors.grey, fontSize: 18)),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top:height*.1,right: width*.03,left:width*.03),
                child:  InkWell(
                    onTap: (){
                      bool _validate = false;

                      verificationCodeNum.text.isEmpty ? _validate = true : _validate = false;
                      if(!_validate){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PasswordChange(true),));

                        //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PasswordChange(true) ,));

                      }
                      else{
                        print("empty");
                      }

                    },
                    child: ButtonNext('Continue')),
              )
            ],
          ),
        ],
      ),
    );
  }
}
