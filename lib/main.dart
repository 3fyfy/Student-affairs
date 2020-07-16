import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/Core/Provider/base_model.dart';
import 'package:gradution_app/Core/Provider/basicInfoProvider.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'package:gradution_app/UI/Screens/screenfinal/reset_password.dart';
import 'package:gradution_app/UI/router.dart';
import 'package:gradution_app/locator.dart';
import 'package:provider/provider.dart';
import 'dart:io';

void main() async{
  setupLocator();
  return runApp(MyApp());

}


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
        ChangeNotifierProvider<MainProvider>.value(value: MainProvider(),),
//          ChangeNotifierProvider<BaseModel>.value(value: BaseModel(),),
        //  ChangeNotifierProvider<HomeModel>.value(value: HomeModel(),),

    ],
    child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff2EB97F),
          accentColor: Color(0xff2ec185),
          accentColorBrightness: Brightness.light,

        ),

//home:reset_Password()
      initialRoute: RoutePaths.Splash,
      onGenerateRoute: Router.generateRoute,
    ));
  }
}
