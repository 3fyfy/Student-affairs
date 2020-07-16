import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';
import 'package:gradution_app/icons/my_flutter_app_icons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gradution_app/UI/Screens/screenfinal/other_services.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

int ssn=0;
  BoxDecoration _buildBoxDecorition(){

    MainProvider mainProvider=Provider.of<MainProvider>(context);

    mainProvider.Increase();

  debugPrint( mainProvider.indexGrid().toString());
  return BoxDecoration(
    border: Border(
      right: BorderSide(
        color: mainProvider.indexGrid() % 2 == 0 ? Colors.black26 : Colors.transparent,
        width: 1.5,
      ),
      top: BorderSide(
        color: mainProvider.indexGrid()%8 > 1 ? Colors.black26 : Colors.transparent,
        width: 1.5,
      ),
    ),
  );
}

  Widget _buildGridItem(String title,IconData icon,String root,Widget PageRout ){
    double height=MediaQuery.of(context).size.height;

    return Container(
      decoration: _buildBoxDecorition(),
       height: 200,
       padding: EdgeInsets.only(top: 20),
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: (){
                  if(PageRout==null)
{                  Navigator.of(context).pushNamed(root);
}                  else{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageRout,));

                  }
                },
                child: Center(
                  child: Container(
                    width: 60,
                    height: 60,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [ Color(0xff009EFF),Color(0xff00F38D)]),
                      borderRadius: BorderRadius.all(Radius.circular(30),
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(icon,color:Colors.white,size: 30,),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(child: Text(title,style: TextStyle(fontSize: 14,color: Colors.black45),textAlign: TextAlign.center,)),

            ],
          ),
       )

    );
  }

  Widget _buildItemDraw(String title){
    double width=MediaQuery.of(context).size.width;

    return   Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Text(title),
          Divider(endIndent: width*.1,indent: width*.1,)
        ],
      ),
    );
  }

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
//print(ssn);
    return (ssn!=0)? BaseView<HomeModel>(
      onModelReady: (model) {
        print(ssn);
        return model.getStudentProfile(ssn);},
      builder: (context, model, child) => (model.student==null)?Container(
          color: Colors.white,
          child: Center(child: CircularProgressIndicator())):
      Scaffold(
        key: _scaffoldKey,
backgroundColor: Colors.white,
        body: ListView(

          children: <Widget>[

            Container(
              height: 40,
              child: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: IconButton(icon: Icon(Icons.more_vert,color: Colors.white,), onPressed: (){
                    _scaffoldKey.currentState.openDrawer();
                  }),
                ) ,

                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right:10.0),
                    child: IconButton(icon: Icon(Icons.notifications,color: Colors.white,size: 30,), onPressed: (){

                      Navigator.of(context).pushNamed(RoutePaths.Notification);

                    }),
                  )
                ],
              ),
            ),

            // Background Green
            Container(
              width: width,
              height: height-40,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor
              ),
              child: Stack(

                children: <Widget>[
                  // Title
                  Container(
                    width: width,
                    height: 80,
                    padding: EdgeInsets.only(left: width*.1,right: width*.1),
                    alignment: Alignment.center,
                    child: ListTile(
                      title: Text(model.student.nameAr,style: TextStyle(color: Colors.white),maxLines: 2,textAlign: TextAlign.center,),
                      subtitle: Text(model.student.id.toString(),style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage:AssetImage("Assets/profile.jpg",),
                      ),
                    ),
                  ),
// Grid View
                  Positioned(
                    top: 130,
                      child: SafeArea(
                        child: Container(
                          width: width,
                          height: height-170,
                          padding:EdgeInsets.only(top:70) ,
                          decoration: BoxDecoration(
                            color: Colors.white,
                              borderRadius:  BorderRadius.only(
                                  topLeft:  const  Radius.circular(30.0),
                                  topRight: const  Radius.circular(30)),
                          ),
                          child:GridView.count(
                            crossAxisCount: 2,
                           childAspectRatio: (width/2)/(200),

                            shrinkWrap: true,
                            padding: EdgeInsets.only(right: width*.07,left:width*.07 ),

                            children: <Widget>[
                              _buildGridItem("Basic Information",MyFlutterApp.add_contact,RoutePaths.BasicInfo,null),
                              _buildGridItem("Registration fees",MyFlutterApp.bitcoin,RoutePaths.RegistrationFees,null),
                              _buildGridItem("University housing",MyFlutterApp.university_housing,RoutePaths.Housing,null),
                              _buildGridItem("Hospital reservation",MyFlutterApp.first_aid_kit,RoutePaths.Hospital,null),
                              _buildGridItem("Training portal",MyFlutterApp.seminar,RoutePaths.Training,null),
                              _buildGridItem("Scholarship portal",MyFlutterApp.scholarship, RoutePaths.scholarship_Portal,null),
                              _buildGridItem("Military education",MyFlutterApp.military,RoutePaths.military_education,null),
                              _buildGridItem("Disclaimer from university",MyFlutterApp.certifecate,RoutePaths.Disclaimer,null),

                            ],
                  ),
                        ),
                      )
                  ),
// QR
                  Positioned(
                    top: 95,
                    left: width*.5-45,
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:  BorderRadius.all(Radius.circular(20)),
                        boxShadow:[
                          BoxShadow(
                            color: Theme.of(context).primaryColor,
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                            offset: Offset(
                              0.0,
                              3.0,
                            ),
                          )
                        ]
                    ),
                      child: Padding(padding: EdgeInsets.all(5),
                        child:Image(image: AssetImage("Assets/qr.png")),

                      ),
                  )),


                ],
              ),

            ),

          ],
        ),

        drawer: Container(
          height: height,
          width: width*.8,
          child: Drawer(
            child:ListView(
              children: <Widget>[

                //              height: height*.4,
                Container(
                  height: height*.4,
                  padding: EdgeInsets.only(top: 10,right: 15,left: 10),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){}),
                          Text("Back"),

                        ],
                      ),
                      CircleAvatar(
                        radius: height*.09,
                        backgroundImage: AssetImage("Assets/profile.jpg"),
                        backgroundColor: Colors.grey,
                      ),
                      Text(model.student.nameAr,style: TextStyle(color: Colors.black),maxLines: 2,textAlign: TextAlign.center,),

                    ],
                  ),


                ),
                SizedBox(
                  height: 70,
                ),


                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => otherServices(),));

                  },
                    child: _buildItemDraw("Other Services")),
                _buildItemDraw("My Card"),
                _buildItemDraw("Help"),
                _buildItemDraw("Setting"),

                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: MaterialButton(
                    child: Container(

                      height: 50,
                      width:  width*.8,
                      padding: EdgeInsets.only(right:  width*.1,left:  width*.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                              onTap: (){

                              },
                              child: Text("English")),
                          InkWell(
                              onTap: (){

                              },
                              child: Text("العربية")),


                        ],
                      ),
                    ),
                  ),
                )


              ],
            ) ,
          ),
        ),



      ),
    ):CircularProgressIndicator();
  }
}
