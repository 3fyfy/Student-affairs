import 'package:flutter/material.dart';
import 'package:gradution_app/UI/Screens/samer/successfully_apply.dart';

class ButtonAplly extends StatelessWidget {
 final String title;
 final String SuccessMessage;

 ButtonAplly(this.title, this.SuccessMessage);

 @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return  InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuccessfullyApply("Successfully \n $SuccessMessage"),));

      },
      child: Container(
        padding:  EdgeInsets.only(left:width*.07,right:width*.07 ),
        margin: EdgeInsets.only(left:width*.07,right:width*.07,bottom: height*.1,top: height*.1 ),
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
