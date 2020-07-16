import 'package:flutter/material.dart';

class chosing_Department_1 extends StatefulWidget {
  @override
  _chosing_Department_1State createState() => _chosing_Department_1State();
}

class _chosing_Department_1State extends State<chosing_Department_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chosing department",
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontFamily: 'Nunito-Regular',
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: false,
        backgroundColor: Color(0xff2EB97F),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        }),      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25, right: 80, bottom: 15),
                child: Text(
                  "Available department",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _dept_order("Computer Science"),
              _dept_order("Information Technology"),
              _dept_order("Information Systems"),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 15, left: 30),
                child: Text(
                  "Choose the order of the sections to which progress is bounced",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*.8,
                  height: MediaQuery.of(context).size.height*.06,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Color(0xff2EB97F),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dept_order(String dept_name) {
    return Padding(
      padding: const EdgeInsets.only(left: 55, right: 40, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            dept_name,
            style: TextStyle(fontSize: 20),
          ),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 35,
              color: Colors.green,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
