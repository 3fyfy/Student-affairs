import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'package:gradution_app/UI/Screens/Calender.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';

class Hospital extends StatefulWidget {
  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {

  Widget _buildGridItem(String title,int clinicId ){

    return InkWell(
      onTap: (){
       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => root,));
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalenderPage(clinicId),));
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(5),
        child: Center(child: Text(title,style:TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Hospital reservation",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        }),
      ),

      body: BaseView<HomeModel>(
        onModelReady: (model) => model.getClinicsUniversity(1),
        builder: (context, model, child) =>
        (model.clinics==null)?Center(child: CircularProgressIndicator()):
        ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(right: width*.1,left:width*.1,bottom: height*.01 ),
                height: height*.1,
                alignment: Alignment.bottomLeft,
                child: Text("Choose a Clinic",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            Container(
              height: height-height*.2,
              padding: EdgeInsets.only(bottom: height*.01 ),
              child:
    GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
  itemCount: model.clinics.length,
  //  itemCount: model.clinics.length,
                    scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(right: width*.1,left:width*.1 ,bottom: height*.05),
    itemBuilder: (BuildContext context, int index) {
     // return _buildGridItem(model.clinics[index].name, "/calender");
      return _buildGridItem(model.clinics[index].name,model.clinics[index].id);
    }
    )

            ),
          ],

        ),
      ),
    );
  }
}
