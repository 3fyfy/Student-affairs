import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'package:provider/provider.dart';

class AcceptTraining extends StatefulWidget {
  @override
  _AcceptTrainingState createState() => _AcceptTrainingState();
}

class _AcceptTrainingState extends State<AcceptTraining> {


  Widget _buildInput(TextEditingController controller){

    return  Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey))
      ),
      padding: EdgeInsets.only(top: 10),
      child: Text(controller.text,maxLines: 1,overflow: TextOverflow.ellipsis,),
    );


    
  }

Widget _buildRow(String Title,TextEditingController controller){
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

      body:Padding(
        padding:  EdgeInsets.only(right:width*.07,left: width*.07),
        child: ListView(
          children: <Widget>[

            _buildRow("Student's name",mainProvider.StudentNameController),
            _buildRow("Section",mainProvider.SectionController),
            _buildRow("Place",mainProvider.StudentNameController),
            _buildRow("Acceptance status",mainProvider.StudentNameController),
            
            Container(
              width: width,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30),
              child:InkWell(
                  child: Text("view the application",style: TextStyle(color: Theme.of(context).primaryColor),),
                onTap: (){
                  Navigator.of(context).pushNamed(RoutePaths.ApplyTraining);

                },

              ),
            )



          ],
        ),
      ) ,

    );
  }
}
