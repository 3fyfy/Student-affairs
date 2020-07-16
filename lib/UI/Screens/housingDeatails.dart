import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';
import 'package:gradution_app/UI/Screens/samer/successfully_apply.dart';
import 'package:gradution_app/UI/Widgets/ButtonApply.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HousingDetails extends StatefulWidget {
  final double distance;

  HousingDetails(this.distance);

  @override
  _HousingDetailsState createState() => _HousingDetailsState();
}

class _HousingDetailsState extends State<HousingDetails> {


  Widget _buildInput(String controller){

    return  Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey))
      ),
      padding: EdgeInsets.only(top: 10),
      child: Text(controller,maxLines: 1,overflow: TextOverflow.ellipsis,),
    );



  }

  Widget _buildRow(String Title,String controller){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Text(Title,style: TextStyle(color: Color(0xffB3B4B7)),),
        _buildInput(controller ),
        SizedBox(
          height: 10,
        ),
      ],
    );

  }
  int ssn=0;

  pref()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.ssn = (prefs.getInt('SSN'));
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


    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "University Housing",
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

      body: (ssn!=0)?BaseView<HomeModel>(
    onModelReady: (model) => model.getStudentProfile(ssn),
    builder: (context, model, child) => (model.student==null)?Container(
    color: Colors.white,
    child: Center(child: CircularProgressIndicator())): Padding(
        padding:  EdgeInsets.only(right:width*.05,left: width*.05,top: 30),
        child: ListView(
          children: <Widget>[

            _buildRow("Student's name",model.student.nameAr),
            _buildRow("Section",model.student.department.name),
            _buildRow("Place",model.student.address),
            _buildRow("Distance calculation",widget.distance.toString()),

      InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuccessfullyApply("Successfully \n "),));

        },

        child: ButtonAplly("Apply"))
          ],
      ),),

    ):CircularProgressIndicator()
    );
  }
}
