import 'package:flutter/material.dart';
import 'package:gradution_app/UI/Screens/profile.dart';

class PasswordChange extends StatefulWidget {
  @override
  _PasswordChangeState createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {


  TextEditingController currentPassword=TextEditingController();

  TextEditingController newPassword=TextEditingController();

  TextEditingController confirmPassword=TextEditingController();
  Widget BuildInput(String title,String hint,TextEditingController controller){
   return Column(
     mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 30,right: 2),
          child: Text(title,style: TextStyle(fontSize: 15,color: Theme.of(context).primaryColor,fontWeight: FontWeight.w400),),
        ),
        TextFormField(
          validator: (value) => value.isEmpty ? " لا يجب ان يكون فارغا " : null,
          obscureText: true,
          controller: controller,
          style: new TextStyle(color:Theme.of(context).primaryColor,fontSize: 20),
          decoration:InputDecoration(
            hintText:hint,
            border:UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black,)
            ),
            hintStyle: TextStyle(fontSize: 16,),
          ),
          cursorColor: Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        padding:  EdgeInsets.only(right: width * .05, left: width * .05,top: height*.05),

        children: <Widget>[
          BuildInput("Current Password", "Current Password", currentPassword),
          BuildInput("New Password", "New Password", newPassword),
          BuildInput("confirm new Password", "confirm new Password", confirmPassword),
          Padding(
            padding:  EdgeInsets.only(top:height*.2,bottom: 10),
            child:InkWell(
              onTap: (){

                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile(),));

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
                  "Update Password",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
          ),



        ],
      ),
    );
  }
}
