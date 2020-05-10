import 'package:flutter/material.dart';

class ButtonNext extends StatelessWidget {
  final String title;
  final String root;

  ButtonNext(this.title, this.root);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return  InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(root);

      },
      child: Container(
        padding:  EdgeInsets.only(left:width*.07,right:width*.07 ),
      //  margin: EdgeInsets.only(left:width*.01,right:width*.01,bottom: height*.04,top: height*.04 ),
        height:40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.white,
            fontSize: 16,
            fontFamily: 'Nunito',
          ),
        ),
      ),
    );
  }
}
