import 'package:flutter/material.dart';


class other_Services_Search extends StatefulWidget {
  @override
  _other_Services_SearchState createState() => _other_Services_SearchState();
}

class _other_Services_SearchState extends State<other_Services_Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Other services",
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontFamily: 'Nunito-Regular',
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: false,
        backgroundColor: Color(0xff2EB97F),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: () {
          Navigator.of(context).pop();
        }),      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Center(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .07,
                      child: TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search,color: Colors.green,),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
