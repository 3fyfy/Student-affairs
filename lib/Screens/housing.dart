import 'package:flutter/material.dart';
import 'package:gradution_app/icons/my_flutter_app_icons.dart';

class Housing extends StatefulWidget {
  @override
  _HousingState createState() => _HousingState();
}

class _HousingState extends State<Housing> {

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
        title: Text("University Housing",style: TextStyle(color: Colors.white),),
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
              Expanded(child: _buildCircleItem("Apply to University",Icons.add,"/housinghome")),
              Expanded(child: _buildCircleItem("See the acceptance",Icons.check_circle_outline,"")),



            ],
          ),
        ),
      ),

    );
  }
}
