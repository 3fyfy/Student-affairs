import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/UI/Widgets/ButtonApply.dart';
import 'package:provider/provider.dart';

class ApplyTraining extends StatefulWidget {
  @override
  _ApplyTrainingState createState() => _ApplyTrainingState();
}

class _ApplyTrainingState extends State<ApplyTraining> {


  bool head=false;
  bool viceDean=false;
  TextEditingController dirctorController=TextEditingController(text: 'Information Technology instute');
  TextEditingController StudentNameController=TextEditingController(text: 'Information Technology instute');
  TextEditingController SectionController=TextEditingController(text: 'Information Technology instute');
  TextEditingController HeadController=TextEditingController(text: 'Information Technology instute');
  TextEditingController ViceDeanController=TextEditingController(text: 'Information Technology instute');





  Widget _buildInput({TextEditingController controller,bool secure,TextInputType type,String hintText}){

    return  TextFormField(
      controller:controller ,
      keyboardType:type,

      validator: (value) => value.isEmpty ? " لا يجب ان يكون فارغا " : null,
      textAlign: TextAlign.justify,
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
              child: _buildInput(type: TextInputType.text,controller: controller)
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
        title: Text("Training portal",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        }),
      ),

      body: Padding(
        padding:  EdgeInsets.only(right:width*.04,left:width*.05),
        child: ListView(

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
    _build_RowInput(title:'Mr. Director /',type: TextInputType.text,controller: dirctorController ),

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


    _build_RowInput(title: "Students name",type: TextInputType.text,controller: StudentNameController),

    _build_RowInput(title: 'Section',type: TextInputType.text,controller: SectionController),

    Container(
      height: 40,
      padding: EdgeInsets.only(top: 20,left: width*.05),
      child: Text('Head of the Scientific Department',style: TextStyle(fontSize: 15,color: Colors.black),),
    ),

    Container(
      height: 50,
      width: width,
      margin: EdgeInsets.only(top: 20,left: width*.04,bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              width:width-width*.4,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xffededee),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: _buildInput(type: TextInputType.text,controller: HeadController)
          ),

          InkWell(
            onTap: (){
              setState(() {
                head = !head;
              });
            },
            child: Container(
                height: 40,
                width: width*.1,

                decoration: BoxDecoration(

                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
                  color: Color(0xffededee),

                ),
                child: (head)? Icon(Icons.check, color: Theme.of(context).primaryColor,):Icon(null)
            ),
          ),

        ],
      ),
    ),

    Container(
      height: 40,
      padding: EdgeInsets.only(top: 20,left: width*.05),
      child: Text('Vice Dean for Education and Student Affairs',style: TextStyle(fontSize: 15,color: Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,),
    ),

    Container(
      height: 50,
      width: width,
      margin: EdgeInsets.only(top: 20,left: width*.04,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              width:width-width*.4,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xffededee),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: _buildInput(type: TextInputType.text,controller: ViceDeanController)
          ),

          InkWell(
            onTap: (){
              setState(() {
                viceDean = !viceDean;
              });
            },
            child: Container(
                height: 40,
                width: width*.1,

                decoration: BoxDecoration(

                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
                  color: Color(0xffededee),

                ),
                child: (viceDean)? Icon(Icons.check,color: Theme.of(context).primaryColor,):Icon(null)
            ),
          ),

        ],
      ),
    ),
  ],
)),


            ButtonAplly('Apply','you apply for training')

          ],
        ),
      ),
    );
  }

}

