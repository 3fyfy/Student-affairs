import 'package:flutter/material.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'package:gradution_app/UI/Screens/AcceptTraining.dart';
import 'package:gradution_app/UI/Screens/ApplyTraining.dart';
import 'package:gradution_app/UI/Screens/Calender.dart';
import 'package:gradution_app/UI/Screens/Hospital.dart';
import 'package:gradution_app/UI/Screens/ScanFiles.dart';
import 'package:gradution_app/UI/Screens/basicInformation.dart';
import 'package:gradution_app/UI/Screens/housing.dart';
import 'package:gradution_app/UI/Screens/housingDeatails.dart';
import 'package:gradution_app/UI/Screens/profile.dart';
import 'package:gradution_app/UI/Screens/registrationFees.dart';
import 'package:gradution_app/UI/Screens/samer/housing_home.dart';
import 'package:gradution_app/UI/Screens/samer/login_form.dart';
import 'package:gradution_app/UI/Screens/samer/medical_examination.dart';
import 'package:gradution_app/UI/Screens/samer/mobile_phone.dart';
import 'package:gradution_app/UI/Screens/samer/model_2_enlisted.dart';
import 'package:gradution_app/UI/Screens/samer/splash.dart';
import 'package:gradution_app/UI/Screens/samer/student_photo.dart';
import 'package:gradution_app/UI/Screens/samer/uploaddocument.dart';
import 'package:gradution_app/UI/Screens/samer/verification_code_page.dart';
import 'package:gradution_app/UI/Screens/training.dart';
import 'package:gradution_app/UI/Screens/notification.dart';



class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Splash:
        return MaterialPageRoute(builder: (_) => Splash());
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => Login());
      case RoutePaths.mobile_Phone:
        return MaterialPageRoute(builder: (_) => mobile_Phone());
      case RoutePaths.Profile:
        return MaterialPageRoute(builder: (_) => Profile());
      case RoutePaths.AcceptTraining:
        return MaterialPageRoute(builder: (_) => AcceptTraining());
      case RoutePaths.ApplyTraining:
        return MaterialPageRoute(builder: (_) => ApplyTraining());
      case RoutePaths.BasicInfo:
        return MaterialPageRoute(builder: (_) => BasicInfo());
      case RoutePaths.CalenderPage:
        return MaterialPageRoute(builder: (_) => CalenderPage());
      case RoutePaths.Hospital:
        return MaterialPageRoute(builder: (_) => Hospital());
      case RoutePaths.Housing:
        return MaterialPageRoute(builder: (_) => Housing());
      case RoutePaths.HousingDetails:
        return MaterialPageRoute(builder: (_) => HousingDetails());
      case RoutePaths.HousingHome:
        return MaterialPageRoute(builder: (_) => HousingHome());
      case RoutePaths.medical_Examination:
        return MaterialPageRoute(builder: (_) => medical_Examination());
      case RoutePaths.model_2_Enlisted:
        return MaterialPageRoute(builder: (_) => model_2_Enlisted());
      case RoutePaths.RegistrationFees:
        return MaterialPageRoute(builder: (_) => RegistrationFees());
      case RoutePaths.studentPhoto:
        return MaterialPageRoute(builder: (_) => student_Photo());
      case RoutePaths.Training:
        return MaterialPageRoute(builder: (_) => Training());
      case RoutePaths.UploadedHome:
        return MaterialPageRoute(builder: (_) => UploadedHome());
      case RoutePaths.Notification:
        return MaterialPageRoute(builder: (_) => NotificationPage());
      case RoutePaths.verification_Code_Page:
        return MaterialPageRoute(builder: (_) => verification_Code_Page());
        case RoutePaths.ScanFiles:
        return MaterialPageRoute(builder: (_) => ScanFiles());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
