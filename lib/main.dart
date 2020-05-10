import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Provider/MainProvider.dart';
import 'package:gradution_app/Core/Provider/basicInfoProvider.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'package:gradution_app/UI/router.dart';
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
          primaryColor: Color(0xff2EB97F),
          accentColor: Color(0xff2ec185),
          accentColorBrightness: Brightness.light,

        ),

//home: the_Student_ID_Card(),
      initialRoute: RoutePaths.Splash,
      onGenerateRoute: Router.generateRoute,
    ));
  }
}
