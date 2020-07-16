import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gradution_app/Core/Api/api.dart';
import 'package:gradution_app/Core/constants/app_contstants.dart';
import 'package:gradution_app/UI/Screens/notification.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String _debugLabelString = "";
  String _emailAddress;
  String _externalUserId;
  bool _enableConsentButton = false;

  // CHANGE THIS parameter to true if you want to test GDPR privacy consent
  bool _requireConsent = true;

  Future<void> initPlatformState() async {

    if (!mounted) return;
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setRequiresUserPrivacyConsent(_requireConsent);

    var settings = {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.promptBeforeOpeningPushUrl: true
    };

    OneSignal.shared.setNotificationReceivedHandler((notification) {
      this.setState(() {
        _debugLabelString =
        "Received notification: \n${notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      this.setState(() {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationPage(),));
        _debugLabelString =
        "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      print("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
    });

    OneSignal.shared.setEmailSubscriptionObserver(
            (OSEmailSubscriptionStateChanges changes) {
          print("EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
        });

    // NOTE: Replace with your own app ID from https://www.onesignal.com
    await OneSignal.shared
        .init("f90af438-f76a-45f5-8ba2-dc6a0b67af8d", iOSSettings: settings);

    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

    bool requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();

    this.setState(() {
      _enableConsentButton = requiresConsent;
    });

    if(_enableConsentButton)
    { print("Setting consent to true");
    OneSignal.shared.consentGranted(true);

    print("Setting state");
    this.setState(() {
      _enableConsentButton = false;
    });
    }


  }


  @override
  void initState() {
    // TODO: implement initState
    initPlatformState();
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.of(context).pushNamed(RoutePaths.Login));
  }

  @override
  Widget build(BuildContext context) {

    double _fontsize = MediaQuery.of(context).size.width * .06;
    double _copyRightFontSize = MediaQuery.of(context).size.width * .025;


    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width ,
        height: MediaQuery.of(context).size.height ,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/imags/logo_page_form.png'),fit: BoxFit.contain,alignment: Alignment.center),),
      ),
      bottomNavigationBar:Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "All Rights Are Saved ",
              style:
              TextStyle(color: Color(0xff30C184), fontSize: _copyRightFontSize),
            ),
            Icon(
              (Icons.copyright),
              color: Color(0xff817C7C),
              size: _copyRightFontSize +7,
            ),
            Text(
              "Technical and Communication Center",
              style:
              TextStyle(color: Color(0xff817C7C), fontSize: _copyRightFontSize-3),
            ),
          ],
        ),
      ),

    );
  }
}
