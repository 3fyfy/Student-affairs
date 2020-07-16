
import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';
import 'package:gradution_app/UI/Screens/samer/successfully_apply.dart';
import 'package:shared_preferences/shared_preferences.dart';

class chosing_Department extends StatefulWidget {
  @override
  _chosing_DepartmentState createState() => _chosing_DepartmentState();
}

class _chosing_DepartmentState extends State<chosing_Department> {


int ssn=0;
int value=0;
String first="";
String second="";
String third="";

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chosing department",
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
        }),      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 25),
                child: Text(
                  "Choosing order of the department to which progress is bounced",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              _dept("first dept"),
              _dept("Second dept"),
              _dept("third dept"),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*.8,
                  height: MediaQuery.of(context).size.height*.065,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Color(0xff2EB97F),
                      child: Text(
                        "Apply",
                        style: TextStyle(color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SuccessfullyApply("Successfully \n"),));

                      }
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }



  Widget _dept(String dept_name) {
    String text="";
    return BaseView<HomeModel>(
        onModelReady: (model) {
      return model.getAllDepartmentInCollage(1);},
    builder: (context, model, child) => (model.departments==null)?Container(
    color: Colors.white,
    child: Center(child: CircularProgressIndicator())): Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 220,top: 25),
          child: Text(
            dept_name,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: InkWell(
              onTap: (){

    },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .07,
                child: Material(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  elevation: 8,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
   Center(child: (dept_name=="first dept")?Text(first,style: TextStyle(color: Colors.black),textAlign: TextAlign.center,):(dept_name=="Second dept")?Text(second,style: TextStyle(color: Colors.black),):(dept_name=="third dept")?Text(third,style: TextStyle(color: Colors.black),):Text("Choose department",style: TextStyle(color: Colors.black),),),

                      new PopupMenuButton(
                        child:Icon(Icons.arrow_drop_down),


                        itemBuilder: (_) =>   model.departments.map((dept){

                          return PopupMenuItem<String>(
                              value: dept.name,

                              child:Directionality(
                                textDirection: TextDirection.rtl,
                                child: Container(
                                    width: MediaQuery.of(context).size.width-80,
                                    child: Text(dept.name)),
                              ));

                        }).toList(),
                        onSelected: (String value){
                          setState(() {
                            if(dept_name=="first dept"){

                              first=value;
                            }
                            else  if(dept_name=="Second dept"){

                              second=value;
                            }
                            else if(dept_name=="third dept"){

                              third=value;
                            }
                          });

                        },

                      ),

                    ],
                  ),
//
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
