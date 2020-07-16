import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class military_education extends StatefulWidget {
  @override
  _military_educationState createState() => _military_educationState();
}

class _military_educationState extends State<military_education> {

int ssn=0;
  pref()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.ssn =  prefs.getInt('SSN');
    setState(() {

    });
  }

  @override
  void initState() {
    pref();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Military Education',
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontFamily: 'Nunito-Regular',
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: false,
        backgroundColor: Color(0xff2EB97F),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        }),      ),
      body: (ssn!=0)? BaseView<HomeModel>(
    onModelReady: (model) {
    return model.getMilitaryStudent(ssn,1);},
    builder: (context, model, child) => (model.militaries==null)?Container(
    color: Colors.white,
    child: Center(child: CircularProgressIndicator())):ListView.builder(
    itemCount: model.militaries.length,
        itemBuilder: (context, index) {
      return Column(
      children: <Widget>[
      _Titel('We inform you that you must attend military education for',
    ' ${model.militaries[index].militaryEducation.beginDate.substring(0,4)}'),
    _heading('Date of course :', model.militaries[index].militaryEducation.beginDate),
    _heading('Officer :', model.militaries[index].militaryEducation.officer),
    _heading('Degree :', ' '),
    _heading('Appreciation :',''),
    _heading('passed :', ''),
      ],
      );
    },

      )
      ):CircularProgressIndicator()
    );
  }

  Widget _Titel(String text_title, String year) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 25, right: 15,bottom: 20),
            child: RichText(
                text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: text_title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: year,
                  style: TextStyle(
                    color: Color(0xff2EB97F),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            )),
          ),
        ),
      ],
    );
  }
  Widget _heading(String Text , String answer){
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, left: 25, right: 15),
            child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: Text,
                      style: TextStyle(
                        color: Color(0xffB3B4B7),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: answer,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,

                      ),
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }
  Widget _gap(){
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 40,right: 40),
      child: Container(
        color: Colors.grey,
        width: MediaQuery.of(context).size.width,
        height: 2,
      ),
    );
  }
}
