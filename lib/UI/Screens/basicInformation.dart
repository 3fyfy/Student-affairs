import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/UI/Screens/BasicInfoScreens/contact.dart';
import 'package:gradution_app/UI/Screens/BasicInfoScreens/gradution.dart';
import 'package:gradution_app/UI/Screens/BasicInfoScreens/personal.dart';
import 'package:gradution_app/UI/Screens/BasicInfoScreens/previousqualification.dart';
import 'package:gradution_app/icons/my_flutter_app_icons.dart';




class BasicInfo extends StatefulWidget {
  @override
  _BasicInfoState createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo>with SingleTickerProviderStateMixin {






  int _selectedIndex=3;
  Widget body=PersonalInfo();
      List <Widget> pages=[
    PreviousQualification(),
    GradutionInfo(),
    Contact(),
    PersonalInfo(),

  ];

  void _onItemTapped(int index) {
    setState(() {
        _selectedIndex = index;
        body= pages[_selectedIndex];

    });
  }


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(

      appBar: AppBar(
        title: Text("Basic Information",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        }),
      ),

      body: body,

      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(

              icon: Icon(MyFlutterApp.patent,color: (_selectedIndex==0)?Theme.of(context).primaryColor:Colors.black54,),
              title:Text("previous qualification",textAlign: TextAlign.center,)

          ),
          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.group,color: (_selectedIndex==1)?Theme.of(context).primaryColor:Colors.black54,),
              title: Text("guardian",textAlign: TextAlign.center,)
          ),
          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.contact,color: (_selectedIndex==2)?Theme.of(context).primaryColor:Colors.black54,),
              title: Text("contact",textAlign: TextAlign.center,)
          ),


          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.account,color: (_selectedIndex==3)?Theme.of(context).primaryColor:Colors.black54,),
              title: Text("personal",textAlign: TextAlign.center,),


          ),
        ],
        elevation: 3,
        backgroundColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: Colors.black54,fontSize: 10,),
        selectedLabelStyle: TextStyle(color: Colors.black54,fontSize: 10) ,

        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,

    ),
      )

    );
  }
}
