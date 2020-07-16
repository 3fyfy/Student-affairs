

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Api/api.dart';
import 'package:gradution_app/Core/Models/Student.dart';
import 'package:gradution_app/Core/Models/ocr_model.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/UI/Screens/PasswrdLogo.dart';
import 'package:gradution_app/UI/Screens/ScanDetails.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ScanFiles extends StatefulWidget {
  String name='';
  String address='';
  String gender='';
  String relation='';
  String religion='';
  String job='';
  String nameNomination='';
  String previousQualification='';
  String collage='';
  String university='';

  ScanFiles(
      {this.name,
      this.address,
      this.gender,
      this.relation,
      this.religion,
      this.job,
      this.nameNomination,
      this.previousQualification,
      this.collage,
      this.university});

  @override
  _ScanFilesState createState() => _ScanFilesState();
}

class _ScanFilesState extends State<ScanFiles>   {

  File nomination;
  File nominationQR;
  File highSchool;
  File IDcardFront;
  File IDcardBack;
  File guardianIDcardFront;
  File guardianIDcardBack;
  File Birth;
  File model2;
  File medical;
  bool done_nomination=false;
  bool done_highSchool=false;
  bool done_IDcardFront=false;
  bool done_IDcardBack=false;
  bool done_guardianIDcardBack=false;
  bool done_guardianIDcardFront=false;
  bool done_Birth=false;
  bool done_model2=false;
  bool done_medical=false;



  bool isImageLoaded = false;
bool loading=false;

  Future pickImage( String title ) async {

    var tempStore = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      loading=true;
    });
    Api api=Api();
    OCRModel ocrModel= await  api.VisionApiCall(tempStore).then((value) {
    setState(() {
      loading=false;
    });
      CircularProgressIndicator();
      print(value);
      return value;
    });

    //MainProvider mainProvider=Provider.of<MainProvider>(context);

    if('student Nomination Card'==title){
      setState(() {
       nomination=tempStore;
       done_nomination=true;
      });
      //mainProvider.setnomination(tempStore);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanDetails(title,tempStore,ocrModel),));

    }
    else if('High school certifecate'==title){
      setState(() {
        highSchool=tempStore;
        done_highSchool=true;
      //  mainProvider.sethighSchool(tempStore);

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanDetails(title,tempStore,ocrModel),));


      });
    }
    else if('student National Id Front'==title){
      setState(() {
        IDcardFront=tempStore;
        done_IDcardFront=true;

        //mainProvider.setIDcardFront(tempStore);

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanDetails(title,tempStore,ocrModel),));


      });
    }
    else if('student National Id Back'==title){
      setState(() {
        IDcardBack=tempStore;
        done_IDcardBack=true;
       // mainProvider.setIDcardBack(tempStore);

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanDetails(title,tempStore,ocrModel),));


      });
    }
    else if('guardian National Id Front'==title){
      setState(() {
        guardianIDcardFront=tempStore;
        done_guardianIDcardFront=true;
        //mainProvider.setguardianIDcardFront(tempStore);

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanDetails(title,tempStore,ocrModel),));


      });
    }
    else if('guardian National Id Back'==title){
      setState(() {
        guardianIDcardBack=tempStore;
        done_guardianIDcardBack=true;
        //mainProvider.setguardianIDcardBack(tempStore);

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanDetails(title,tempStore,ocrModel),));
      });
    }
    else if('Birth certifecate'==title){
      setState(() {
        Birth=tempStore;
        done_Birth=true;
        //mainProvider.setBirth(tempStore);

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanDetails(title,tempStore,ocrModel),));


      });
    }
    else if('Profile Image'==title){
      setState(() {
       model2=tempStore;
       done_model2=true;
      // mainProvider.setmodel2(tempStore);

      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanDetails(title,tempStore,ocrModel),));


      });
    }
    else if('medical'==title){
      setState(() {
        medical=tempStore;
        done_medical=true;
        //mainProvider.setmedical(tempStore);

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanDetails(title,tempStore,ocrModel),));


      });
    }

  }

  Widget buildGridItem(String title,image,bool done){

if(image==null){
  done=false;
}
    double width=MediaQuery.of(context).size.width;

    return Container(
      padding:  EdgeInsets.all(8),
      height: 180,
      child: Stack(

        children: <Widget>[
          InkWell(
            onTap: ()async{
             await pickImage(title);

              if('student Nomination Card'==title){
                setState(() {
                  image=nomination;

                });
              }
              else if('High school certifecate'==title){
                setState(() {
                  image=highSchool;

                });
              }
              else if('student National Id Front'==title){
                setState(() {
                  image=IDcardFront;

                });
              }
              else if('student National Id Back'==title){
                setState(() {
                  image=IDcardBack;

                });
              }
              else if('guardian National Id Front'==title){
                setState(() {
                  image=guardianIDcardFront;

                });
              }
              else if('guardian National Id Back'==title){
                setState(() {
                  image=guardianIDcardBack;

                });
              }
              else if('Birth certifecate'==title){
                setState(() {
                  image=Birth;

                });
              }
              else if('model2'==title){
                setState(() {
                  image=model2;

                });
              }
              else if('medical'==title){
                setState(() {
                  image=medical;

                });
              }
            },
            child: Container(
              width: width*.4,
              padding: EdgeInsets.only(right: width*.03,left:width*.03,top: 10 ),
              decoration: BoxDecoration(
                color: Color(0xffd8f2e7),
                borderRadius: BorderRadius.circular(10),

              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: width*.4,
                    height: 140,
                    decoration: BoxDecoration(
                        image: DecorationImage(image:(image!=null)?FileImage(image):AssetImage((title=="student Nomination QR")?"Assets/Qr.jpg":"Assets/add.png",),fit: BoxFit.fitHeight)

                    ),
                    child: Container(
                      color:(image==null)?Color.fromRGBO(44,185,128,.5):Colors.transparent,

                    ),

                  ),
                  Expanded(
                    child: Container(
                        height: 30,
                        child: Text(title,textAlign: TextAlign.center,)),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 35,
              right: 4,
              child: CircleAvatar(
                  backgroundColor: Color(0xff2cb980),
                  radius: 15,
                  child: Center(child: (done)?Icon(Icons.check,color: Colors.white,size: 18,):Icon(IconData(0xe900, fontFamily: 'iconScanBest1'),color: Colors.white,size: 18,)))
          ),
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
    MainProvider mainProvider=Provider.of<MainProvider>(context);
    print(mainProvider.nameAr());

    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Files",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        }),
      ),
      body:(loading)?Center(child: CircularProgressIndicator()): Padding(
        padding:  EdgeInsets.only(right: width * .05, left: width * .05),
        child: CustomScrollView(

          slivers: <Widget>[


            SliverToBoxAdapter(
                child: Container(
                  width: width,
                     height: 100,
                     padding: EdgeInsets.only(top: 30,bottom: 30),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
     Text("Please scan your files"),
    Text("Scanning your files one by one carefully"),
  ],
),),
              ),

            SliverGrid.count(
              crossAxisCount: 2,
                childAspectRatio: (width*.4)/180,

              children: <Widget>[
                    buildGridItem('student National Id Front',IDcardFront,done_IDcardFront),
                    buildGridItem('student National Id Back',IDcardBack,done_IDcardBack),
                    buildGridItem('guardian National Id Front',guardianIDcardFront,done_guardianIDcardFront),
                    buildGridItem('guardian National Id Back',guardianIDcardBack,done_guardianIDcardBack),
                    buildGridItem('student Nomination Card',nomination,done_nomination),
                buildGridItem('Profile Image',model2,done_model2),
                // buildGridItem('student Nomination QR',nominationQR,done_nomination),
                    buildGridItem('High school certifecate',highSchool,done_highSchool),
                    buildGridItem('Birth certifecate',Birth,done_Birth),
                  //  buildGridItem('medical',medical,done_medical),
              ],
            ),

            SliverToBoxAdapter(
              child:  Padding(
                padding: const EdgeInsets.only(top:20,bottom: 10),
                child:InkWell(
                  onTap: ()async{

                    Api _api=Api();
                    if(ssn!=0){
                      Student  student=await _api.getUserProfile(ssn).then((value) => value);
                      Guardian guardian=await _api.getUserProfile(ssn).then((value) => value.guardian);
                      student.ssn=mainProvider.ssn();
                      student.id=mainProvider.id();
                      student.userName=mainProvider.userName();
                      student.password=mainProvider.password();
                      student.nameAr=mainProvider.nameAr();

                      student.address=mainProvider.address();
                      student.gender=mainProvider.gender();
                      student.religion=mainProvider.religion();
                      student.previousQualification=mainProvider.previousQualification();
                      student.relationship=mainProvider.relationship();
                      guardian.name=mainProvider.guardianName();
                      guardian.ssn=111;
                      guardian.workPlace=mainProvider.guardianAddress();
                    //  student.guardian=guardian;

                      print(student.toJson());
                      await _api.updateStudentData(student);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PasswordLogo(),));

                    }



                  },
                  child: Container(
                    padding:  EdgeInsets.only(left:width*.07,right:width*.07 ),
                    //  margin: EdgeInsets.only(left:width*.01,right:width*.01,bottom: height*.04,top: height*.04 ),
                    height:40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      "Done",
                      style: TextStyle(color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      )

    );
  }
}
