import 'package:flutter/material.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';


class Training extends StatefulWidget {
  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  Widget _buildCircleItem(String title,IconData icon, String root){
    return    InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(root);
      },
      child: Column(

        children: <Widget>[
          Center(
            child: Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [ Color(0xff009EFF),Color(0xff00F38D)]),
                borderRadius: BorderRadius.all(Radius.circular(30),
                ),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(icon,color: Colors.white,size: 40,),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,maxLines: 2,overflow: TextOverflow.ellipsis,),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
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

      body: Padding(
        padding:  EdgeInsets.only(top:height*.1),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(child: _buildCircleItem("Apply to Training",Icons.add,RoutePaths.training_Portal)),
              Expanded(child: _buildCircleItem("See the acceptance",Icons.check_circle_outline,RoutePaths.AcceptTraining)),



            ],
          ),
        ),
      ),

    );
  }
}
