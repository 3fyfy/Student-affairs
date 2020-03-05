import 'package:flutter/material.dart';
import 'package:gradution_app/Provider/MainProvider.dart';
import 'package:gradution_app/Provider/basicInfoProvider.dart';
import 'package:gradution_app/Screens/Hospital.dart';
import 'package:gradution_app/Screens/basicInformation.dart';
import 'package:gradution_app/Screens/housing.dart';
import 'package:gradution_app/Screens/profile.dart';
import 'package:gradution_app/Screens/registrationFees.dart';
import 'package:gradution_app/Screens/samer/housing_home.dart';
import 'package:gradution_app/Screens/samer/login_form.dart';
import 'package:gradution_app/Screens/samer/splash.dart';
import 'package:gradution_app/Screens/samer/student_photo.dart';
import 'package:gradution_app/Screens/samer/uploaddocument.dart';
import 'package:gradution_app/Screens/training.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
        ChangeNotifierProvider<MainProvider>.value(value: MainProvider(),),
          ChangeNotifierProvider<BasicInfoProvider>.value(value: BasicInfoProvider(),),


        ],
    child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff2ec185),
          accentColor: Color(0xff2ec185),
          accentColorBrightness: Brightness.light,

        ),
        initialRoute: '/splash',
        routes: {
          '/loign': (context) =>login_Form(),
           '/splash': (context) =>LogoPage(),
          '/studentPhoto': (context) =>student_Photo(),
          '/housinghome': (context) =>HousingHome(),
          '/uploadedhome': (context) =>UploadedHome(),
          '/profile': (context) => Profile(),
          '/basicinfo':(context) =>BasicInfo(),
          '/fees':(context) => RegistrationFees(),
          '/housing':(context) =>Housing(),
          '/training':(context) => Training(),
          '/hospital':(context) =>Hospital(),

        }
    ));
  }
}
