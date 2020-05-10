import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
                Text("New",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor),),


                Divider(thickness: 1.5,),
                Text("Earlier",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor),),



              ],
            ),
          )
        ],
      ),

    );
  }
}
