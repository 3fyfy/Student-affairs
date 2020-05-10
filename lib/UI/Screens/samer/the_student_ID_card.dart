import 'package:flutter/material.dart';

class the_Student_ID_Card extends StatefulWidget {
  @override
  _the_Student_ID_CardState createState() => _the_Student_ID_CardState();
}

class _the_Student_ID_CardState extends State<the_Student_ID_Card> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text(
          "The student's ID card",
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontFamily: 'Nunito-Regular',
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: false,
        backgroundColor: Color(0xff2EB97F),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30,top: 90),
                child: Text("The student's ID card",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w700),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,top: 30),
                child: Text("Please scan your the student's ID",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700,color: Color(0xff2EB97F)),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:75,left: 30),
                child: Text("serial number of card",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey),),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30 ,top: 30,right: 15),
                  child: Material(
                    borderRadius: BorderRadius.all(
                        Radius.circular(12)
                    ),
                    elevation: 7,
                    shadowColor: Colors.grey,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      cursorColor: Color(0xff2EB97F),
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'xxxxxxxxxxx12',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 30,right: 20),
                  child: IconButton(icon: Icon(IconData(0xe900, fontFamily: 'iconScanBest1')),color: Color(0xff0ff2EB97F),iconSize: 50,onPressed: (){},)
              )
            ],
          ),
        ],
      ),
    );
  }
}
