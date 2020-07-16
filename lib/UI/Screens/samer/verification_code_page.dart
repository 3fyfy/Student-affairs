import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'package:gradution_app/UI/Screens/samer/uploaddocument.dart';
import 'package:gradution_app/UI/Widgets/ButtonNext.dart';

class verification_Code_Page extends StatefulWidget {
  @override
  _verification_Code_PageState createState() => _verification_Code_PageState();
}

class _verification_Code_PageState extends State<verification_Code_Page> {

  TextEditingController verificationCodeNum=TextEditingController();

  DateTime initTime;

  @override
  void initState() {
    initTime=DateTime.now();
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Verification",
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontFamily: 'Nunito-Regular',
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: false,
        backgroundColor: Color(0xff2EB97F),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white), onPressed: () {
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
              padding:  EdgeInsets.only( top: height*.081),
              child: Text(
                "Verification",
                style: TextStyle(
                    fontSize: height * .039,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000)),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only( top: height*.013),
              child: Text("Enter 4 digital code we sent to 01063383029",
                  style: TextStyle(
                      fontSize: height * .032,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff2EB97F))),
            ),
            Center(
              child: Padding(
                padding:  EdgeInsets.only(top: height * .067,right:width*.03),
                child: Container(
                height: 60,
                  padding: EdgeInsets.only(right: width*.03,left:width*.03 ),

                  color: Colors.transparent,
                  child: VerificationCodeInput(
                    itemSize:50,
                    autofocus: true,
                    textStyle: TextStyle(fontSize: 20, color: Color(0xff2EB97F)),
                    itemDecoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                        border:Border.all(color: Theme.of(context).primaryColor)
//                      boxShadow: [
//                        BoxShadow(
//                          color: Colors.black38,
//                          blurRadius: 1.0, // has the effect of softening the shadow
//                          spreadRadius: .2, // has the effect of extending the shadow
//                          offset: Offset(
//                            2.0, // horizontal, move right 10
//                            2.0, // vertical, move down 10
//                          ),
//                        )
//                      ],
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
              padding:  EdgeInsets.only( top: height*.03,right: width*.05,left:width*.03),
              child: Text("Resend Code in ${DateTime.now().difference(initTime).inSeconds}",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff2EB97F))),
            ),

            Padding(
              padding:  EdgeInsets.only(top:height*.1,right: width*.03,left:width*.03),
              child:InkWell(
                  onTap: (){
                    bool _validate = false;

                    verificationCodeNum.text.isEmpty ? _validate = true : _validate = false;
                    if(!_validate){
                    Navigator.of(context).pushNamed(RoutePaths.UploadedHome);

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
