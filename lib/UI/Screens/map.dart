import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gradution_app/UI/Screens/HousingDistance.dart';
import 'package:gradution_app/UI/Screens/housingDeatails.dart';
import 'dart:math' show cos, sqrt, asin;

import 'package:provider/provider.dart';


class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  //  LatLng(31.042089933607876, 31.356653161346912)



  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> marker={};


  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.042089933607876, 31.356653161346912),
    zoom: 19.151926040649414,
  );




  Future<void> _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    CameraPosition _currentPosition = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(position.latitude, position.longitude),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    Marker m = Marker(markerId: MarkerId('1'), position:LatLng(position.latitude, position.longitude) );
    setState(() {
      marker.add(m);
    });

    controller.animateCamera(CameraUpdate.newCameraPosition(_currentPosition));
  }

  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }
double distance=0.0;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;


    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: <Widget>[
            Container(
              height: height,
              width: width,
              child:  GoogleMap(
                markers: marker,
                onTap: (pos) {
                  Marker m = Marker(markerId: MarkerId('1'), position: pos);
                  setState(() {
                    marker.add(m);
                  });
                },
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },

              )),


            Positioned(
                top: 20,
                right: 7,
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color:Theme.of(context).primaryColor ,
                        blurRadius: 2.0, // has the effect of softening the shadow
                        spreadRadius: .09, // has the effect of extending the shadow
                        offset: Offset(
                          1.0, // horizontal, move right 10
                          1.0, // vertical, move down 10
                        ),
                      )
                    ],
                  ),
                  child: IconButton(icon: Icon(Icons.near_me,color: Theme.of(context).primaryColor,), onPressed:_currentLocation),

                )),

            Positioned(
              bottom: 50,
              //left:width*.5-width*.2-20 ,
              child: InkWell(
                onTap: (){

               distance=calculateDistance(marker.last.position.latitude,marker.last.position.longitude,31.042089933607876, 31.356653161346912);
                 print(  calculateDistance(31.548745223887867, 31.099375002086163,31.116373561783796, 30.95443680882454));


                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HousingDetails(distance),));

                },
                child: Container(
                  padding:  EdgeInsets.only(left:width*.02,right:width*.02 ),
                  margin:  EdgeInsets.only(left:width*.04,right:width*.04 ),

                  height:40,
                  width: width-width*.08,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    'Distance calculation',
                    style: TextStyle(color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Nunito',
                      decoration: TextDecoration.none,

                    ),

                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

