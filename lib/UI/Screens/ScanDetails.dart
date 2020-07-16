import 'package:flutter/material.dart';
import 'dart:io';

import 'package:gradution_app/Core/Models/ocr_model.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';

import 'package:gradution_app/UI/Screens/ScanFiles.dart';
import 'package:provider/provider.dart';

class ScanDetails extends StatefulWidget {

  File file;
  String title;
  OCRModel ocrModel;
  ScanDetails(this.title,this.file,this.ocrModel);

  @override
  _ScanDetailsState createState() => _ScanDetailsState();
}

class _ScanDetailsState extends State<ScanDetails> {

  String textaa='';
  String name='';
  String address='';
  String gender='';
  String relation='';
  String religion='';
  String job='';
  String guardianName='';
  String guardianAddress='';
  String guardianGender='';
  String guardianRelation='';
  String guardianReligion='';
  String guardianJob='';
  String nameNomination='';
String previousQualification='';
String collage='';
String university='';
String total='';



  readTextIDFront()  {
    MainProvider mainProvider=Provider.of<MainProvider>(context);

    String description=widget.ocrModel.responses[0].textAnnotations[0].description;

bool check = true;
int lineData = 0;

List<String> descriptionSplit=description.split("\n");

for(int idxDes=0;idxDes<descriptionSplit.length;idxDes++ ){
  String word = descriptionSplit[idxDes];


  if(check){
    List<String> wordSplit=descriptionSplit[idxDes].split(" ");
if(wordSplit[0]=='بطاقة'||wordSplit[0]=='بطافة'){
  check=false;
  continue;
}
  }

  else{
    if(lineData<2){
      name=name+descriptionSplit[idxDes]+' ';
      lineData=lineData+1;
      print("name$name");
    }
    else if(lineData<4){
address=address+descriptionSplit[idxDes]+' ';
      lineData=lineData+1;
print("address $address");


    }
    else{
      break;
    }

  }
}
     if('guardian National Id Front'==widget.title){
mainProvider.setguardianName(name);
mainProvider.setguardianAddress(address);
    }
     else{
       mainProvider.setnameAr(name);
       mainProvider.setaddress(address);

     }

return Column(
              children: <Widget>[
                build_Input("Full Name", this.name),
                build_Input("Address", this.address),
                //build_Input("National ID", "29705051501058"),
              ],
            );

  }

readTextIDBack(){
  MainProvider mainProvider=Provider.of<MainProvider>(context);

    int check=0;

    String description=widget.ocrModel.responses[0].textAnnotations[0].description;
    print(description);


    List<String> descriptionSplit=description.split("\n");

    for(int idxDes=0;idxDes<descriptionSplit.length;idxDes++ ) {
      String word = descriptionSplit[idxDes];
      if (gender != '' && religion != '' && relation != '') {
            break;
          }

            if (word == 'ذكر' ||word=='ذکر'|| word == 'انثى') {

              gender = word;
              check=check+1;
            }
            if (word == 'مسلم' || word == 'مسلمة' || word == 'مسيحى') {
              religion = word;
              check=check+1;
            }
            if (word == "أعزب" ||word=="اعزب"|| word == 'متزوج' || word == 'متزوجة' ||
                word == 'أنسة' || word == 'أرملة') {
              relation = word;
              check=check+1;
            }
    }
  if('guardian National Id Front'==widget.title){
    mainProvider.setguardianRelationship(relation);
    if(religion == 'مسلم' || religion == 'مسلمة')
      mainProvider.setguardianReligion(0);
    else if(religion == 'مسيحى'){
      mainProvider.setguardianReligion(1);

    }
    if (gender == 'ذكر' ||gender=='ذکر')
      mainProvider.setguardianGender(true);
    else
      mainProvider.setguardianGender(false);

  }
  else{
    mainProvider.setrelationship(relation);
    if(religion == 'مسلم' || religion == 'مسلمة')
      mainProvider.setreligion(1);
    else{
      mainProvider.setreligion(0);

    }
    if (gender == 'ذكر' ||gender=='ذکر')
      mainProvider.setgender(true);
    else
      mainProvider.setgender(false);

  }

    return Column(
      children: <Widget>[
       // build_Input("job", this.job),
        build_Input("relation", this.relation),
        build_Input("relegion", this.religion),
        build_Input("gender", this.gender),
      ],
    );
}

  readTextNomination(){

    MainProvider mainProvider=Provider.of<MainProvider>(context);

    String description=widget.ocrModel.responses[0].textAnnotations[0].description;


    List<String> descriptionSplit=description.split("\n");

    for(int idxDes=descriptionSplit.length-1;idxDes>=0;idxDes=idxDes-1) {
      String word = descriptionSplit[idxDes];
      print("word    $word");
      if(word=='الشهادة'){

        previousQualification=descriptionSplit[idxDes-1];

      }
      else if(word=="الكلية / المعهد"||word=="الكلية  المعهد"||word=="الكلية / المعهد :"){
        List<String> splitCollageUniversity=descriptionSplit[idxDes-1].split(' ');
        university=splitCollageUniversity[splitCollageUniversity.length-1];

        for(int idx=0;idx<splitCollageUniversity.length-1;idx=idx+1){
          
          collage=collage+splitCollageUniversity[idx]+ ' ';
        }
        
      }
      else if(word=="الطالب :"||word=="الطالب"){
        nameNomination=descriptionSplit[idxDes-1];

      }
    }

    mainProvider.setpreviousQualification(previousQualification);
    mainProvider.setuniversity(1);
    mainProvider.setcollage(1);


    return Column(
      children: <Widget>[
        // build_Input("job", this.job),
        build_Input("name", this.nameNomination),
        build_Input("previousQualification", this.previousQualification),
        build_Input("Collage", this.collage),
        build_Input("University", this.university),
      ],
    );
  }

  Widget BuildBodyImage(){
    if('student Nomination Card'==widget.title){

   return   readTextNomination();

    }
    else if('High school certifecate'==widget.title){
    }
    else if('student National Id Front'==widget.title){

    return readTextIDFront();
    }
    else if('student National Id Back'==widget.title){
    return  readTextIDBack();
    }
    else if('guardian National Id Front'==widget.title){
      return  readTextIDFront();

    }
    else if('guardian National Id Back'==widget.title){
      return  readTextIDBack();

    }
    else if('Birth certifecate'==widget.title){

    }
    else if('model2'==widget.title){

    }
    else if('medical'==widget.title){

    }

  }


  Widget build_Input(String title,String data){
      return           Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Text(
             title,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomLeft,
            decoration:BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))
            ),
            child: Text(data),
          )
        ],
      );

  }

  @override
  void initState() {
    // TODO: implement initState
  //  readText();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Scan Done",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        }),
      ),

      body:    ListView
        (
        padding: EdgeInsets.only(right: width * .05, left: width * .05),
        children: <Widget>[
          Container(
            height: height * .3,
            margin: EdgeInsets.only(top: 10, bottom: 20),
            child: Card(
              elevation: 5,
              child: Image.file(widget.file,),
            ),
          ),


          BuildBodyImage(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(textaa),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();


                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanFiles(),));
              },
              child: Container(
                padding: EdgeInsets.only(left: width * .07, right: width * .07),
                //  margin: EdgeInsets.only(left:width*.01,right:width*.01,bottom: height*.04,top: height*.04 ),
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme
                      .of(context)
                      .primaryColor,
                ),
                child: Text(
                  "Continue With this",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.only(left: width * .07, right: width * .07),
                //  margin: EdgeInsets.only(left:width*.01,right:width*.01,bottom: height*.04,top: height*.04 ),
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme
                      .of(context)
                      .primaryColor,
                ),
                child: Text(
                  "Scan again",
                  style: TextStyle(color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ),
          ),


        ],

      )

    );
  }
}
