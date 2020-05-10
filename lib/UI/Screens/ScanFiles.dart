
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/UI/Screens/PasswrdLogo.dart';
import 'package:gradution_app/UI/Screens/ScanDetails.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class ScanFiles extends StatefulWidget {
  @override
  _ScanFilesState createState() => _ScanFilesState();
}

class _ScanFilesState extends State<ScanFiles>   {

  File nomination;
  File highSchool;
  File IDcard;
  File Birth;
  File model2;
  File medical;
  bool done_nomination=false;
  bool done_highSchool=false;
  bool done_IDcard=false;
  bool done_Birth=false;
  bool done_model2=false;
  bool done_medical=false;



  bool isImageLoaded = false;


  Future pickImage( String title ) async {
    var tempStore = await ImagePicker.pickImage(source: ImageSource.gallery);

    if('student Nomination Card'==title){
      setState(() {
       nomination=tempStore;
       done_nomination=true;
      });
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanDetails(title,tempStore),));

    }
    else if('High school certifecate'==title){
      setState(() {
        highSchool=tempStore;
        done_highSchool=true;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanDetails(title,tempStore),));


      });
    }
    else if('The students ID Card'==title){
      setState(() {
        IDcard=tempStore;
        done_IDcard=true;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanDetails(title,tempStore),));


      });
    }
    else if('Birth certifecate'==title){
      setState(() {
        Birth=tempStore;
        done_Birth=true;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanDetails(title,tempStore),));


      });
    }
    else if('model2'==title){
      setState(() {
       model2=tempStore;
       done_model2=true;
       Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanDetails(title,tempStore),));


      });
    }
    else if('medical'==title){
      setState(() {
        medical=tempStore;
        done_medical=true;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanDetails(title,tempStore),));


      });
    }

  }

  Widget buildGridItem(String title,image,bool done){


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
              else if('The students ID Card'==title){
                setState(() {
                  image=IDcard;

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
                        image: DecorationImage(image:(image!=null)?FileImage(image):AssetImage("Assets/add.png",),fit: BoxFit.fitHeight)

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

  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Scan Files",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        }),
      ),
      body: Padding(
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

                    buildGridItem('student Nomination Card',this.nomination,done_nomination),
                    buildGridItem('High school certifecate',highSchool,done_highSchool),
                    buildGridItem('The students ID Card',IDcard,done_IDcard),
                    buildGridItem('Birth certifecate',Birth,done_Birth),
                    buildGridItem('model2',model2,done_model2),
                    buildGridItem('medical',medical,done_medical),
              ],
            ),

            SliverToBoxAdapter(
              child:  Padding(
                padding: const EdgeInsets.only(top:20,bottom: 10),
                child:InkWell(
                  onTap: (){

                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PasswordLogo(),));

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
