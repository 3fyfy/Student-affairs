import 'package:flutter/material.dart';

class ComponentBasic extends StatefulWidget {
  String title;
  String detail;
  TextEditingController controller;

  ComponentBasic(this.title,this.controller);

  @override
  _ComponentBasicState createState() => _ComponentBasicState();
}

class _ComponentBasicState extends State<ComponentBasic> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text("${widget.title} : ",style: TextStyle(color: Colors.black54,fontSize: 20),),
           Expanded(child:Text("${widget.controller.text}",maxLines: 1,)),

        ],
      ),
    );
  }
}


