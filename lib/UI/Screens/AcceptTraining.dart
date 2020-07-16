import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AcceptTraining extends StatefulWidget {
  @override
  _AcceptTrainingState createState() => _AcceptTrainingState();
}

class _AcceptTrainingState extends State<AcceptTraining> {


  Widget _buildInput(String controller){

    return  Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey))
      ),
      padding: EdgeInsets.only(top: 10),
      child: Text(controller,maxLines: 1,overflow: TextOverflow.ellipsis,),
    );


    
  }

Widget _buildRow(String Title,String controller){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Text(Title,style: TextStyle(color: Color(0xffB3B4B7)),),
        _buildInput(controller ),
        SizedBox(
          height: 10,
        ),
      ],
    );

} int ssn=0;

  pref()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.ssn = (prefs.getInt('SSN'));
    setState(() {

    });
  }

  @override
  void initState() {
    pref();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

        MainProvider mainProvider=Provider.of<MainProvider>(context);


    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Training Portal",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        }),
      ),

      body:(ssn!=0)?  BaseView<HomeModel>(
      onModelReady: (model) => model.getStudentProfile(ssn),
      builder: (context, model, child) =>(model.student==null)?Center(child: CircularProgressIndicator()):ListView(
        padding:  EdgeInsets.only(right:width*.07,left: width*.07),

        children: <Widget>[

          _buildRow("Student's name",model.student.nameAr),
          _buildRow("Department",model.student.department.name),
          _buildRow("Organization",mainProvider.organization().text),
          _buildRow("Acceptance status","pending"),

          Container(
            width: width,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30),
            child:InkWell(
                child: Text("view the application",style: TextStyle(color: Theme.of(context).primaryColor),),
              onTap: (){
              //  Navigator.of(context).pushNamed(RoutePaths.ApplyTraining);

              },

            ),
          )



        ],
      ) ,

    ):CircularProgressIndicator(),
    );
  }
}
