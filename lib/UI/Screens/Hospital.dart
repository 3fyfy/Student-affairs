import 'package:flutter/material.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';

class Hospital extends StatefulWidget {
  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {

  Widget _buildGridItem(String title,String root ){

    return InkWell(
      onTap: (){
       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => root,));
        Navigator.of(context).pushNamed(RoutePaths.CalenderPage);
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(5),
        child: Center(child: Text(title,style:TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("University Housing",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        }),
      ),

      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[

          Container(
              padding: EdgeInsets.only(right: width*.1,left:width*.1,bottom: height*.01 ),
              height: height*.1,
              alignment: Alignment.bottomLeft,
              child: Text("Choose a Clinic",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          Container(
            height: height-height*.2,
            padding: EdgeInsets.only(bottom: height*.01 ),
            child: GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,

              padding: EdgeInsets.only(right: width*.1,left:width*.1 ,bottom: height*.05),

              children: <Widget>[
                _buildGridItem("Internal Medical Clinic","/calender"),
                _buildGridItem("Hematology Clinic","/calender"),
                _buildGridItem("Kidney clinic",""),
                _buildGridItem("heart clinic",""),
                _buildGridItem("Neurology Clinic",""),
                _buildGridItem("Physiotherapy clinic",""),

              ],
            ),
          ),




        ],

      ),
    );
  }
}
