import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';

class medical_Examination_1 extends StatefulWidget {
  @override
  _medical_Examination_1State createState() => _medical_Examination_1State();
}

class _medical_Examination_1State extends State<medical_Examination_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "medical examination",
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
      body:BaseView<HomeModel>(
    onModelReady: (model) {
    return model.getAllMidicalExaminitionInUniversity(1);},
    builder: (context, model, child) => (model.examinitions==null)?Container(
    color: Colors.white,
    child: Center(child: CircularProgressIndicator())): ListView.builder(
    itemCount: model.examinitions.length,
        itemBuilder: (context, index) {
   return Padding(
     padding: const EdgeInsets.only(top:10.0,bottom: 10),
     child: Column(
      children: <Widget>[
      _heading("Examination data : ", model.examinitions[index].dateExamination),
      _heading("place : ",model.examinitions[index].place ),
      SizedBox(
        height: 10,
      ),
      Divider(thickness: 2,indent: 20,endIndent: 20,),

      ],
      ),
   );
        }

      ),
      )
    );
  }
  Widget _heading(String Text , String answer){
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 20),
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
                        fontWeight: FontWeight.w700,

                      ),
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
