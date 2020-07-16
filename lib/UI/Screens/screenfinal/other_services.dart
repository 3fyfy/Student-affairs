import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';
import 'package:gradution_app/UI/Screens/screenfinal/other_services_search.dart';


class otherServices extends StatefulWidget {
  @override
  _otherServicesState createState() => _otherServicesState();
}

class _otherServicesState extends State<otherServices> {



 Widget _buildItem(String image_path,String text_title,int durition,String Professor,String beginDate,String endDate,int Price){
   double width=MediaQuery.of(context).size.width;
   return  Padding(
     padding:  EdgeInsets.only(top: 10,bottom: 10),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         InkWell(
           borderRadius: BorderRadius.all(Radius.circular(15)),

           onTap: (){
             //Navigator.of(context).pushNamed(RoutePaths.ApplyTraining);
           },
           child: Container(
             width: MediaQuery.of(context).size.width*.85,
             height: MediaQuery.of(context).size.height*.2,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.all(Radius.circular(15)),
               image: DecorationImage(
                 image: ExactAssetImage(image_path),fit: BoxFit.cover,
               ),
               boxShadow: [
                 BoxShadow(
                   color: Colors.grey.withOpacity(0.5),
                   spreadRadius: 5,
                   blurRadius: 5,
                   offset: Offset(0, 0), // changes position of shadow
                 ),
               ],
             ),
           ),
         ),
         Padding(
           padding:  EdgeInsets.only(top: 20,left: width*.06,right:  width*.06,bottom: 10),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Text(
                 text_title,
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 20,
                   fontWeight: FontWeight.w800,
                 ),
               ),
               _heading("Professor :", " $Professor"),

               _heading("Duration :", " $durition Hours"),
               _heading("Price :", " $Price LE"),
               _heading("Begin Date :", " $beginDate "),
               _heading("End Date :", " $endDate "),


             ],
           ),
         ),

         Divider(thickness: 2,)
       ],
     ),
   );
 }


  Widget _heading(String Text , String answer){
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: Text,
                      style: TextStyle(
                        color: Color(0xffB3B4B7),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: answer,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,

                      ),
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Other services",
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontFamily: 'Nunito-Regular',
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: false,
        backgroundColor: Color(0xff2EB97F),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: () {
          Navigator.of(context).pop();
        }),
      ),
      body: BaseView<HomeModel>(
    onModelReady: (model) {
    return model.getAllCoursesInUniversity(1);},
    builder: (context, model, child) => (model.courses==null)?Container(
    color: Colors.white,
    child: Center(child: CircularProgressIndicator())): Column(
      children: <Widget>[
        Container(
          width: width,
          height: height*.2,
          padding:  EdgeInsets.only(top: 20, left: width*.05,right: width*.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                  text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "We offer courses \n",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text: 'for',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: ' you',
                    style: TextStyle(
                      color: Color(0xff2EB97F),
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )),
              Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.5),
                    color: Colors.greenAccent,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => other_Services_Search(),));
                    },
                  )),
            ],
          ),
        ),
Container(
  height: height-height*.33,

  child: ListView.builder(
    padding:  EdgeInsets.only( left: width*.05,right: width*.05,top: 10),

    itemCount: model.courses.length,
    itemBuilder: (context, index) {
    return _buildItem("Assets/Network_pic.jpg",model.courses[index].name,model.courses[index].duration,model.courses[index].professor,model.courses[index].beginDate,model.courses[index].endDate,model.courses[index].price);
  },),
),


      ],
    ),
    ));
  }


}
