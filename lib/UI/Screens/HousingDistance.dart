import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gradution_app/UI/Screens/copy.dart';
import 'package:gradution_app/UI/Screens/map.dart';

class HousingDistance extends StatefulWidget {
  @override
  _HousingDistanceState createState() => _HousingDistanceState();
}

class _HousingDistanceState extends State<HousingDistance> {


  List<String>City=['Egypt','USA','malawi','Macedonia'];
  List<String>Country=['Kfs','Damietta','Alexandria','Aswan','Cairo',];
  List<String>Region=['First damietta','Faraskur','Zarqa','Gamasa','Ras ElBar'];



  int _selectedCity=0;
  int _selectedCountry=0;
  int _selectedRegion=0;




  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(

      appBar: AppBar(
        title: Text(
          "University Housing",
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
        }),
      ),

      body: Padding(
        padding:  EdgeInsets.only(right:width*.05,left: width*.05,top: 30),
        child: ListView(
          children: <Widget>[
            Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(
                    'Assets/imags/Distanceimagecrop.png'),fit: BoxFit.contain)
              ),
              ),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: height*.02),
              child: Text("Place of residence and Distance calculation"),
            ),

            Container(
              margin: EdgeInsets.only(top: height*.1),
              alignment: Alignment.center,
              child: Text("What's your place of residence?"),
            ),

            Container(
              margin: EdgeInsets.only(top: height*.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height:60,
                    width: width*.25,
                    alignment: Alignment.center,
                    child: ListWheelScrollView(
                        itemExtent: 18,
                        useMagnifier: true,
                        magnification: 1.01,
                        onSelectedItemChanged: (value){
                          setState(() {

                            _selectedCity=value;
                            print(_selectedCity);
                          });
                        },
                        children: City.asMap().map((index, element) =>MapEntry(index,

                            Text(element,style:TextStyle(color: (index==_selectedCity)?Colors.black:Colors.grey),maxLines: 1,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)

                        )
                        ).values.toList()
                    ),
                  ),
                  Container(
                    height:60,
                    width: width*.25,
                    alignment: Alignment.center,
                    child: ListWheelScrollView(
                        itemExtent: 18,
                        useMagnifier: true,
                        magnification: 1.01,
                        onSelectedItemChanged: (value){
                          setState(() {

                            _selectedCountry=value;
                          });
                        },
                        children: Country.asMap().map((index, element) =>MapEntry(index,

                            Text(element,style:TextStyle(color: (index==_selectedCountry)?Colors.black:Colors.grey),maxLines: 1,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)

                        )
                        ).values.toList()
                    ),
                  ),

                  Container(
                    height:60,
                    width: width*.25,
                    alignment: Alignment.center,
                    child: ListWheelScrollView(
                        itemExtent: 18,
                        useMagnifier: true,
                        magnification: 1.01,
                        onSelectedItemChanged: (value){
                          setState(() {

                            _selectedRegion=value;
                          });
                        },
                        children: Region.asMap().map((index, element) =>MapEntry(index,

                            Text(element,style:TextStyle(color: (index==_selectedRegion)?Colors.black:Colors.grey),maxLines: 1,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)

                        )
                        ).values.toList()
                    ),
                  ),


                ],
              ),
            ),

            Container(

              alignment: Alignment.center,
              margin: EdgeInsets.only(top: height*.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: 20,right: 20),
                      child: Text("Distance calculation.")),
                  Container(
                    width: 60,
                    height: 60,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top:20,
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapPage(),));
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                border:Border.all(color:Colors.black,width: 1),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5.0) //                 <--- border radius here
                                ),
                                  color: Colors.white,
                                  boxShadow: [new BoxShadow(
                                    color: Theme.of(context).primaryColor,
                                    blurRadius: 7.0,
                                  ),],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top:0,
                            left: 1,
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapPage(),));

                              },
                                child: Icon(Icons.location_on,color: Theme.of(context).primaryColor,size: 40,))),

                      ],
                    ),
                  )

                ],
              ),
            ),


            Container(
              margin: EdgeInsets.only(top: height*.03,left: width*.06,right: width*.06),
              child: Text("You must be at your place of residence in order to determine the distance correctly",textAlign: TextAlign.center,),
            ),



          ],
        ),
      ),

    );
  }
}
