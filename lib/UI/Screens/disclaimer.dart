import 'package:flutter/material.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';

class Disclaimer extends StatefulWidget {
  @override
  _DisclaimerState createState() => _DisclaimerState();
}

class _DisclaimerState extends State<Disclaimer> {


  Widget _buildGridItem(String image,String title,  String root) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => root,));
        // Navigator.of(context).pushNamed(RoutePaths.CalenderPage);
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(5),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Color(0xff324a5e),
              radius: 25,
             // backgroundImage: AssetImage(image),
              child: Image.asset(image,fit: BoxFit.cover,height: 40,width: 30,),
            ),
            Text(
              title, style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,),
          ],
        )),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Disclaimer", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),

      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[

          Container(
              padding: EdgeInsets.only(
                  right: width * .1, left: width * .1, bottom: height * .01),
              height: height * .1,
              alignment: Alignment.bottomLeft,
              child: Text("Check",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
          Container(
            height: height - height * .2,
            padding: EdgeInsets.only(bottom: height * .01),
            child: GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,


              padding: EdgeInsets.only(
                  right: width * .1, left: width * .1, bottom: height * .05),
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,

              children: <Widget>[
                _buildGridItem("Assets/disclamir/library.png","library", "/calender"),
                _buildGridItem("Assets/disclamir/offer.png","Student Welfare", "/calender"),
                _buildGridItem("Assets/disclamir/Cities.png","Cities",""),
                _buildGridItem("Assets/disclamir/Training.png", "Training",""),
                _buildGridItem("Assets/disclamir/Other.png", "Other",""),
                _buildGridItem("Assets/disclamir/soldier.png", "Military education",""),

              ],
            ),
          ),


        ],

      ),
    );
  }
}