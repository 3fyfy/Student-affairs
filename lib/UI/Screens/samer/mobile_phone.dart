import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'package:gradution_app/UI/Screens/samer/verification_code_page.dart';
import 'package:gradution_app/UI/Widgets/ButtonNext.dart';
import 'package:tel_input/tel_input.dart';
import 'package:country_code_picker/country_code_picker.dart';

class mobile_Phone extends StatefulWidget {
  @override
  _mobile_PhoneState createState() => _mobile_PhoneState();
}

class _mobile_PhoneState extends State<mobile_Phone> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mobile phone",
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
                padding:  EdgeInsets.only(top: height*.07),
                child: Text(
                  "Mobile phone",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: height*.03),
                child: Text(
                  "Please scan your Mobile phone",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff2EB97F)),
                ),
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(right: width*.03,left: width*.03),
            child: Row(
              children: <Widget>[
                Padding(
                  padding:  EdgeInsets.only( top: height*.05,right: 1),

                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topLeft: Radius.circular(15)
                    ),
                    child: SizedBox(
                      height: 50,
                      child: CountryCodePicker(
                        initialSelection: 'EG',
                        favorite: ['+20', 'EG'],
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(top: height*.05),
                    child:
                    Material(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      elevation: 3,
                      shadowColor: Colors.grey,
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          style: TextStyle(
                            fontSize: height*.024,
                          ),
                          keyboardType: TextInputType.number,
                          cursorColor: Color(0xff2EB97F),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(right:8.0,left:8,top: 0),

                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                  color: Colors.grey,
                                  style: BorderStyle.none

                              ),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top:height*.08,bottom: height*.04,right: width*.03,left: width*.03),
            child: ButtonNext("Send code",RoutePaths.verification_Code_Page),
          ),
          Center(
            child: Padding(
              padding:  EdgeInsets.only(top: height*.040,right: width*.03,left: width*.03),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "By clicking. start you to our ",
                      style: TextStyle(
                        fontSize: height*.024,
                        color: Color(0xff2EB97F),
                      ),
                    ),
                    TextSpan(
                      text: "privacy Policy ",
                      style: TextStyle(
                          fontSize: height*.024,
                          color: Color(0xff2EB97F),
                          decoration: TextDecoration.underline),
                    ),
                    TextSpan(
                      text: "and ",
                      style: TextStyle(
                        fontSize: height*.024,
                        color: Color(0xff2EB97F),
                      ),
                    ),
                    TextSpan(
                      text: "Conditions ",
                      style: TextStyle(
                        fontSize: height*.024,
                        color: Color(0xff2EB97F),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
