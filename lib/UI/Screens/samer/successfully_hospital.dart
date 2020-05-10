import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class successfully_hospital extends StatefulWidget {
  @override
  _successfully_hospitalState createState() => _successfully_hospitalState();
}

class _successfully_hospitalState extends State<successfully_hospital> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff2EB97F),
      appBar: AppBar(
        backgroundColor: Color(0xff2EB97F),
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
      ),
      body: Container(

        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width * .5,
                  width: MediaQuery.of(context).size.height * .27,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage(
                              'assets/imags/successfully_hospital_pic.png'),
                          fit: BoxFit.cover)),
                ),
                Text(
                  "Successfully \n you reserve for hospital",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 30,
                    fontFamily: 'Nunito',
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
