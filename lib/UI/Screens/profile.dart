import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'package:gradution_app/icons/my_flutter_app_icons.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


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

  Widget _buildGridItem(String title,String icon,String root ){
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
                  Navigator.of(context).pushNamed(root);
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
                      child: Icon(MyFlutterApp.military,color: Colors.white,size: 40,),
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

  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,

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
                    title: Text("Ahmed Mostafa  Kamel Ali",style: TextStyle(color: Colors.white),maxLines: 2,textAlign: TextAlign.center,),
                    subtitle: Text("100007576",style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("Assets/profile.jpg",),
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
                            _buildGridItem("Basic Information","Assets/military.png",RoutePaths.BasicInfo),
                            _buildGridItem("Registration fees","Assets/military.png",RoutePaths.RegistrationFees),
                            _buildGridItem("University housing","Assets/military.png",RoutePaths.Housing),
                            _buildGridItem("Hospital reservation","Assets/military.png",RoutePaths.Hospital),
                            _buildGridItem("Training portal","Assets/military.png",RoutePaths.Training),
                            _buildGridItem("Scholarship portal","Assets/military.png",RoutePaths.Training),
                            _buildGridItem("Military education","Assets/military.png",""),
                            _buildGridItem("Disclaimer from university","Assets/military.png",""),

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

      drawer: Drawer(
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
                  Text("Ahmed Afify",style: TextStyle(color: Colors.black),maxLines: 2,textAlign: TextAlign.center,),

                ],
              ),


            ),
            SizedBox(
              height: 70,
            ),


            _buildItemDraw("Other Services"),
            _buildItemDraw("My Card"),
            _buildItemDraw("Help"),
            _buildItemDraw("Setting")


          ],
        ) ,
      ),



    );
  }
}
