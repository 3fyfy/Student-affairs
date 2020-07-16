import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Api/api.dart';
import 'package:gradution_app/Core/Models/Student.dart';
import 'package:gradution_app/UI/Screens/profile.dart';
import 'package:gradution_app/UI/Screens/screenfinal/reset_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordChange extends StatefulWidget {

 final bool restPassword;


  PasswordChange(this.restPassword);

  @override
  _PasswordChangeState createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {

  final GlobalKey<ScaffoldState> _scaffolkey = new GlobalKey<ScaffoldState>();

  TextEditingController currentPassword=TextEditingController();

  TextEditingController newPassword=TextEditingController();

  TextEditingController confirmPassword=TextEditingController();
  String errorText="";
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



  int ssn=0;

  pref()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.ssn = (prefs.getInt('SSN'));
    setState(() {

    });
  }

  @override
  void initState() {
    pref();

    if(widget.restPassword){
      currentPassword.text="000000";
    }

    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      key:_scaffolkey ,
      body: ListView(
        padding:  EdgeInsets.only(right: width * .05, left: width * .05,top: height*.05),

        children: <Widget>[
          (widget.restPassword)?Container():BuildInput("Current Password", "Current Password", currentPassword),
          BuildInput("New Password", "New Password", newPassword),
          BuildInput("confirm new Password", "confirm new Password", confirmPassword),
          Text(errorText,style: TextStyle(color: Colors.red),),
          Padding(
            padding:  EdgeInsets.only(top:height*.2,bottom: 10),
            child:InkWell(
              onTap: ()async{
    Api _api=Api();
    if(ssn!=0){
                if(!(currentPassword.text.isEmpty&&confirmPassword.text.isEmpty&&newPassword.text.isEmpty)){


                  Student student=await _api.getUserProfile(ssn).then((value) => value);

                  if(currentPassword.text!=student.password){
                    errorText="كلمة المرور الخالية غير صحيحة";
                  }
                  if(confirmPassword.text==newPassword.text){
                    student.password=confirmPassword.text;
                    _api.updateStudentData(student);
                  }
                  else{
                    errorText="كلمة المرور غير متطابقة";

                  }
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile(),));

                }
                else{
                  errorText="املأ البيانات";
                }

              }

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
