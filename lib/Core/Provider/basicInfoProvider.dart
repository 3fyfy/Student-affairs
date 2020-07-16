//import 'package:flutter/cupertino.dart';
//import 'package:provider/provider.dart';
//
//class BasicInfoProvider with ChangeNotifier{
//
//  TextEditingController _nameArController=TextEditingController(text: "");
//  TextEditingController _nameEnController=TextEditingController(text: "");
//  TextEditingController _organizationController=TextEditingController(text: "");
//  TextEditingController _religionController=TextEditingController(text: "");
////  TextEditingController _genderController=TextEditingController(text: "");
//  TextEditingController _nationalityController=TextEditingController(text: "");
//  TextEditingController _controller=TextEditingController(text: "");
//
//  TextEditingController get nameArController =>_nameArController;
//  TextEditingController get nameEnController =>_nameEnController;
//  TextEditingController get organizationController =>_organizationController;
//  TextEditingController get religionController =>_religionController;
//  TextEditingController get genderController =>_genderController;
//  TextEditingController get nationalityController =>_nationalityController;
//  TextEditingController get controller =>_controller;
//
//
//  set nameArController (value){
//
//    _nameArController=value;
//    notifyListeners();
//
//  }
//
//  set nameEnController (value){
//
//    _nameEnController=value;
//    notifyListeners();
//
//  }
//  set organizationController (value){
//
//    _organizationController=value;
//    notifyListeners();
//
//  }
//  set religionController (value){
//
//    _religionController=value;
//    notifyListeners();
//
//  }
//  set genderController (value){
//
//    _genderController=value;
//    notifyListeners();
//
//  }
//  set nationalityController (value){
//
//    _nationalityController=value;
//    notifyListeners();
//
//  }
//
//  set controller (value){
//
//    _controller=value;
//    notifyListeners();
//
//  }
//
//
//
//
//
//
//  @override
//  void dispose() {
//  _nameArController.dispose();
//  _nameEnController.dispose();
//  _organizationController.dispose();
//  _religionController.dispose();
//  _genderController.dispose();
//  _nationalityController.dispose();
//  _controller.dispose();
//
//
//  // TODO: implement dispose
//    super.dispose();
//  }
//
//}