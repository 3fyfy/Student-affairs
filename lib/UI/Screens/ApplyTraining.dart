import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Models/training_portal.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';
import 'package:gradution_app/UI/Screens/samer/successfully_apply.dart';
import 'package:gradution_app/UI/Widgets/ButtonApply.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplyTraining extends StatefulWidget {

 final TrainingPortal training;

 ApplyTraining(this.training);

  @override
  _ApplyTrainingState createState() => _ApplyTrainingState();
}

class _ApplyTrainingState extends State<ApplyTraining> {


  bool head=false;
  bool viceDean=false;
//  TextEditingController dirctorController=TextEditingController(text: 'Information Technology instute');
//  TextEditingController StudentNameController=TextEditingController(text: 'Information Technology instute');
//  TextEditingController SectionController=TextEditingController(text: 'Information Technology instute');
  //TextEditingController Organization=TextEditingController(text: '');
  TextEditingController Description=TextEditingController(text: '');





  Widget _buildInput({String title,TextEditingController controller,bool secure,TextInputType type,String hintText}){
    MainProvider mainProvider=Provider.of<MainProvider>(context);

    if(title=="Organization"){
   controller= mainProvider.organization();

    }
    else{
     controller= mainProvider.description();

    }

    return  TextFormField(
      controller:controller ,
      maxLines: 6,
      keyboardType:type,

      validator: (value) => value.isEmpty ? " لا يجب ان يكون فارغا " : null,
      textAlign: TextAlign.justify,
      onChanged: (value){
        if(title=="Organization"){
          mainProvider.setorganization(value);

        }
        else{
          mainProvider.setdescription(value);
        }
      },
      decoration:InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.only(right: 4,left: 4),
        hintStyle: TextStyle(fontSize: 5,),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:Colors.transparent),
        ),
        border: InputBorder.none,
      ),
      cursorColor: Theme.of(context).primaryColor,
    );
  }

  Widget _build_RowInput({String title,TextEditingController controller,TextInputType type,String hintText}){
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return   Container(
      height: 50,
      width: width,
      margin: EdgeInsets.only(top: 30),
      child: Row(
        children: <Widget>[
          Container(
              width:width*.3,
              child: Text(title,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,)),
          Container(
              width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width*.42,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xffededee),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Center(child: _buildInput(title: title,type: TextInputType.text,controller: controller))
          )
        ],
      ),
    );
  }

  Widget _build_RowBox({String title,String Data}){
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return   Container(
      height: 50,
      width: width,
      margin: EdgeInsets.only(top: 30),
      child: Row(
        children: <Widget>[
          Container(
              width:width*.3,
              child: Text(title,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,)),
          Container(
              width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width*.42,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xffededee),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child:Center(child: Text(Data))
          )
        ],
      ),
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
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    MainProvider mainProvider=Provider.of<MainProvider>(context);

    return Scaffold(

      appBar: AppBar(
        title: Text("Training portal",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        }),
      ),

      body: (ssn!=0)?  BaseView<HomeModel>(
    onModelReady: (model) => model.getStudentProfile(ssn),
    builder: (context, model, child) =>(model.student==null)?Center(child: CircularProgressIndicator()): ListView(
        padding:  EdgeInsets.only(right:width*.04,left:width*.05),
        children: <Widget>[

          Container(
            height: 50,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20),
            child: Text('Practical training(2019/2020)',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          ),

 Form(

    child: Column(
  children: <Widget>[
    _build_RowBox(title:'Mr. Director /',Data: "Hassan" ),

    Container(
      height: 40,
      padding: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: Text('After Greetings',style: TextStyle(fontSize: 15,color: Color(0xffB3B4B7)),),
    ),

    Container(
      height:150,
      padding: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: Text('we are honored to report that the colleges regulations stipulate that students perform summer training for a period of (four weeks) at least in one of the factories or companies, both in their specialization, knowing that the training to and that training and that training',style: TextStyle(fontSize: 15,color: Colors.black),),
    ),


    _build_RowBox(title: "Students name",Data: model.student.nameAr),

    _build_RowBox(title: 'Department',Data: model.student.department.name),
    _build_RowBox(title: "Organization",Data: widget.training.name),

    Container(
      height: 40,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 20,left: width*.0),
      child: Text('Description',style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
    ),
    SizedBox(

      width:width-width*.2,
      height: 200,

      child:  Card(
        margin: EdgeInsets.only(top: 20),
          color: Color(0xffededee),
          elevation: 5,
          child: _buildInput(type: TextInputType.text,controller: Description)),
    )
  ],
)),


        InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuccessfullyApply("Successfully \n you apply for training"),));

          },

           child: ButtonAplly('Apply')
        )
        ],
      ),
    ):CircularProgressIndicator()
    );
  }

}

