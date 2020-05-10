import 'package:flutter/material.dart';

class birth_Certificate extends StatefulWidget {
  @override
  _birth_CertificateState createState() => _birth_CertificateState();
}

class _birth_CertificateState extends State<birth_Certificate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text(
          "Birth certificate",
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
                child: Text("Birth certificate",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w700),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,top: 30),
                child: Text("Please scan your birth certificate",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700,color: Color(0xff2EB97F)),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:75,left: 30),
                child: Text("Birth certificate serial",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey),),
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
