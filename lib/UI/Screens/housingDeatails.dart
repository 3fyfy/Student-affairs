import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/UI/Widgets/ButtonApply.dart';

import 'package:provider/provider.dart';

class HousingDetails extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {

    MainProvider mainProvider=Provider.of<MainProvider>(context);

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

      body:Padding(
        padding:  EdgeInsets.only(right:width*.05,left: width*.05,top: 30),
        child: ListView(
          children: <Widget>[

            _buildRow("Student's name","Saad ahmed elnely"),
            _buildRow("Section","Computer and Information Sciences"),
            _buildRow("Place","Egypt - Damietta -First damietta"),
            _buildRow("Distance calculation",mainProvider.distance.toString()),


            ButtonAplly("Apply","")
          ],
      ),),

    );
  }
}
