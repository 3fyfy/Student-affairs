import 'package:flutter/material.dart';


class AppBarWidget extends StatefulWidget {
  final String title;


  AppBarWidget(this.title);
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: TextStyle(
          color: Color(0xffFFFFFF),
          fontFamily: 'Nunito-Regular',
          fontWeight: FontWeight.w300,
        ),
      ),
      centerTitle: false,
      backgroundColor: Color(0xff2EB97F),
      leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white), onPressed: () {}),
    );
  }
}


