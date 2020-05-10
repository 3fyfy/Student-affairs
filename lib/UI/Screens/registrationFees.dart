import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'package:gradution_app/UI/Screens/samer/registration_fees.dart';
import 'package:provider/provider.dart';

class RegistrationFees extends StatefulWidget {
  @override
  _RegistrationFeesState createState() => _RegistrationFeesState();
}

class _RegistrationFeesState extends State<RegistrationFees> {

  List<bool> listYear=[false,false,false,false];
bool flag=false;

  Widget _build_card_item(String year,String department,int idx){
    MainProvider mainProvider=Provider.of<MainProvider>(context);

    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

     if(!mainProvider.flag(idx)){
       return Padding(
      padding:  EdgeInsets.all(width*.02),
      child: Card(
        elevation: 10,

        child: Padding(
          padding:  EdgeInsets.only(right:8.0,left: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("$year , $department",),
              IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: (){

                setState(() {
                  mainProvider.setflag(idx);
                });

              })
            ],
          ),
        ) ,
      ),
    );
     }
    else {
      return Container(
      padding:  EdgeInsets.all(8),
      child: Card(

        elevation: 8,

        child: Column(

          children: <Widget>[
            Card(
              margin: EdgeInsets.all(0),
              child: Padding(
                padding:  EdgeInsets.only(right:8.0,left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("$year , $department",),
                    IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: (){
                      setState(() {
                        mainProvider.setflag(idx);
                      });
                    })
                  ],
                ),
              ) ,
            ),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      alignment: Alignment.centerLeft,
                      width:(width-40)/3,
                      height: 30,
                      child: Text("Amount",maxLines: 1,overflow: TextOverflow.ellipsis,)),
                  Container(
                      alignment: Alignment.center,
                      width:(width-40)/3,
                      height: 30,
                      child: Text("Fees type",maxLines: 1,overflow: TextOverflow.ellipsis,)),
                  Container(
                      alignment: Alignment.center,
                      width:(width-40)/3,
                      height: 30,
                      child: Text("Payment",maxLines: 1,overflow: TextOverflow.ellipsis,)),


                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(8),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.centerLeft,
                          width:(width-40)/3,
                          height: 30,
                          child: Text("600 EGP",maxLines: 1,overflow: TextOverflow.ellipsis,)),
                      Container(
                          alignment: Alignment.center,
                          width:(width-40)/3,
                          height: 30,
                          child: Text("Registration fees",maxLines: 1,overflow: TextOverflow.ellipsis,)),
                      Container(
                          alignment: Alignment.center,
                          width:(width-40)/3,
                          height: 30,
                          child: RaisedButton(

                              color: Theme.of(context).primaryColor,

                              child: Text("Payment",maxLines: 1,overflow: TextOverflow.ellipsis,),
                            onPressed: (){

                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => registration_Fees(),));

                            },

                          ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.centerLeft,
                          width:(width-40)/3,
                          height: 30,
                          child: Text("100 EGP",maxLines: 1,overflow: TextOverflow.ellipsis,)),
                      Container(
                          alignment: Alignment.center,
                          width:(width-40)/3,
                          height: 30,
                          child: Text("Re-examination",maxLines: 1,overflow: TextOverflow.ellipsis,)),
                      Container(
                          alignment: Alignment.center,
                          width:(width-40)/3,
                          height: 30,
                          child: Text("15/12/2018",maxLines: 1,overflow: TextOverflow.ellipsis,)),


                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );}
  }


  @override
  Widget build(BuildContext context) {

    MainProvider mainProvider=Provider.of<MainProvider>(context);

    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Fees",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        }),
      ),

      body: Container(
        height: height,
        //color: Color(0xffB3B4B7),
        child: ListView(
          children: <Widget>[

            _build_card_item("Fourth","Information Technology",3),
            _build_card_item("Third","Information Technology",2),
            _build_card_item("Second","General",1),
            _build_card_item("First","General",0),




          ],
        ),
      ),


    );
  }
}
