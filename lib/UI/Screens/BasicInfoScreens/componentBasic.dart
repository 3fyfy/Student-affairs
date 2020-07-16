import 'package:flutter/material.dart';

class ComponentBasic extends StatefulWidget {
  String title;
  String detail;
  String data;

  ComponentBasic(this.title,this.data);

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
           Expanded(child:(widget.data==null||widget.data=="null")?Text(""):Text("${widget.data}",maxLines: 1,)),

        ],
      ),
    );
  }
}


