import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Models/fee.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';
import 'package:gradution_app/UI/Screens/samer/registration_fees.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationFees extends StatefulWidget {
  @override
  _RegistrationFeesState createState() => _RegistrationFeesState();
}

class _RegistrationFeesState extends State<RegistrationFees> {

  List<bool> listYear=[false,false,false,false];
bool flag=false;

List<String>feeType=["Registration fee","Re-examination","Material","Milarity Education"];


  Widget _build_card_item(String year,String department,int idx,List<Fee>fees){

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
      return  (ssn!=0)? BaseView<HomeModel>(
          onModelReady: (model) {
        print(ssn);
        return model.getAllFeeStudent(ssn);},
    builder: (context, model, child) => (model.fees==null)?Container(
    color: Colors.white,
    child: Center(child: CircularProgressIndicator())):Container(
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
              child:
              Container(
                height: 100,
                child: ListView.builder(
                  itemCount: model.fees.length,

                  itemBuilder: (context, index) {
                    return  ((model.fees[index].yearOfFees-1)==idx)?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10,bottom: 10),
                            alignment: Alignment.centerLeft,
                            width:(width-40)/3,
                            height: 30,
                            child: Text("${model.fees[index].fees} EGP",maxLines: 1,overflow: TextOverflow.ellipsis,)),
                        Container(
                            alignment: Alignment.center,
                            width:(width-40)/3,
                            height: 30,
                            child: Text(feeType[model.fees[index].feesId.feesType],maxLines: 1,overflow: TextOverflow.ellipsis,)),
                        Container(
                          alignment: Alignment.center,
                          width:(width-40)/3,
                          height: 30,
                          child:(model.fees[index].paymentType!=0)?Text(model.fees[index].feesId.datePayment,maxLines: 1,overflow: TextOverflow.ellipsis,):RaisedButton(

                            color: Theme.of(context).primaryColor,

                            child: Text("Payment",maxLines: 1,overflow: TextOverflow.ellipsis,),
                            onPressed: (){

                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => registration_Fees(model.fees[index].fees),));

                            },

                          ),
                        ),
                      ],
                    ):Container(
                      height: 0,
                      width: 0
                    );
                  },


                ),
              ),
            ),
          ],
        ),
      ),
    )): CircularProgressIndicator();
    }
  }

  int ssn=0;
  pref()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.ssn =  prefs.getInt('SSN');
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

      body: (ssn!=0)? BaseView<HomeModel>(
    onModelReady: (model) {
    print(ssn);
    return model.getAllFeeStudent(ssn);},
    builder: (context, model, child) => (model.fees==null)?Container(
        color: Colors.white,
        child: Center(child: CircularProgressIndicator())):
    ListView(
          children: <Widget>[
            _build_card_item("First","General",0,model.fees),
            _build_card_item("Second","General",1,model.fees),
            _build_card_item("Third","Information Technology",2,model.fees),
            _build_card_item("Fourth","Information Technology",3,model.fees),




          ],
        ),
      )

    : CircularProgressIndicator()
    );
  }
}
