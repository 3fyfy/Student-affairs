import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';
import 'package:gradution_app/UI/Screens/webscholarship.dart';

class scholarship_Portal extends StatefulWidget {
  int idUniversity;

  scholarship_Portal({this.idUniversity});

  @override
  _scholarship_PortalState createState() => _scholarship_PortalState();
}

class _scholarship_PortalState extends State<scholarship_Portal> {


  Widget _Scholarship(String scholarship,String link){
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Container(

        width: MediaQuery.of(context).size.width*.85,
        height: 60,
        child: RaisedButton(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            child: Text(
              scholarship,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Nunito'),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebScholarship(link),));


            }),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scholarship portal",
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontFamily: 'Nunito-Regular',
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: false,
        backgroundColor: Color(0xff2EB97F),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        }),      ),
      body:  BaseView<HomeModel>(
    onModelReady: (model) {
    return model.getAllScholarshipsInUniversity(1);},
    builder: (context, model, child) => (model.scholarships==null)?Container(
    color: Colors.white,
    child: Center(child: CircularProgressIndicator())):ListView.builder(
      padding: EdgeInsets.only(right: width*.1,left:width*.1 ),
      itemCount: model.scholarships.length,
        itemBuilder: (context, index) => _Scholarship(model.scholarships[index].title,model.scholarships[index].link),

      ),
    )
      );
  }
}
