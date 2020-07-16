import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/UI/Screens/registrationFees.dart';
import 'package:gradution_app/icons/my_flutter_app_icons.dart';
import 'package:gradution_app/UI/Screens/screenfinal/medical_examination_1.dart';
import 'package:gradution_app/UI/Screens/screenfinal/chosing_department.dart';
import 'package:gradution_app/UI/Screens/screenfinal/Military_education.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {




  _BuildItem(String Title,String description){
    return   ListTile(
      onTap: (){
        if(Title=="Registeration fee"){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegistrationFees(),));

        }
        else if(Title=="Training Portal"){

        }
        else if(Title=="Scholarship Portal"){

        }
        else if(Title=="Military education"){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => military_education(),));

        }
        else if(Title=="medical examination"){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => medical_Examination_1(),));

        }
        else if(Title=="Choosing department"){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => chosing_Department(),));

        }

      },
      title: Text(Title),
      subtitle: Text(description),
      leading: Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [ Color(0xff009EFF),Color(0xff00F38D)]),
          borderRadius: BorderRadius.all(Radius.circular(25),
          ),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(MyFlutterApp.bitcoin,color:Colors.white,size: 25,),
        ),
      ),

    );
  }


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, 50),
        child: AppBar(
          title: Text("Notifications",style: TextStyle(color: Colors.white),),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
            Navigator.of(context).pop();
          }),
        ),
      ),

      body: Column(
        children: <Widget>[
          Container(
            width: width,
            padding: EdgeInsets.only(right: width*.05,left:width*.05 ),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Notifications",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                IconButton(icon: Icon(Icons.search), onPressed: (){})

              ],
            ),
          ),
          Container(
            height: height-(50+50+kToolbarHeight),
            child: ListView(
              padding: EdgeInsets.only(right: width*.05,left:width*.05 ),
              children: <Widget>[
            _BuildItem("Registeration fee","Payment this year is now available"),
            _BuildItem("medical examination","Date medical examination "),
            _BuildItem("Choosing department","Choosing your Department"),
          //  _BuildItem("Military education","Choosing your Department"),


              ],
            ),
          )
        ],
      ),

    );
  }
}
