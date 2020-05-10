import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MainProvider with ChangeNotifier{

  int _indexGrid=-1;

  TextEditingController _dirctorController=TextEditingController(text: 'Information Technology instute ');
  TextEditingController _StudentNameController=TextEditingController(text: 'Information Technology instute');
  TextEditingController _SectionController=TextEditingController(text: 'Information Technology instute');
  TextEditingController _HeadController=TextEditingController(text: 'Information Technology instute');
  TextEditingController _ViceDeanController=TextEditingController(text: 'Information Technology instute');

  File _nomination;
  File _highSchool;
  File _IDcard;
  File _Birth;
  File _model2;
  File _medical;

  File get nomination=>_nomination;
  File get highSchool=>_highSchool;
  File get IDcard=>_IDcard;
  File get Birth=>_Birth;
  File get model2=>_model2;
  File get medical=>_medical;

  set nomination( value){
    _nomination=value;
    notifyListeners();
  }
  set highSchool( value){

    _highSchool=value;
    notifyListeners();
  }

  set IDcard( value){

    _IDcard=value;
    notifyListeners();
  }
  set Birth( value){

    _Birth=value;
    notifyListeners();
  }
  set model2( value){

    _model2=value;
    notifyListeners();
  }
  set medical( value){

    _medical=value;
    notifyListeners();
  }


  double _distance=0;
  double get distance=>_distance;

  set distance(double value){

    _distance=value;
    notifyListeners();
  }

  int _selectedCity=0;
  int _selectedCountry=0;
  int _selectedRegion=0;

  int get selectedCity=>_selectedCity;
  int get selectedCountry=>_selectedCountry;
  int get selectedRegion=>_selectedRegion;


  set selectedCity(int value) {
    _selectedCity = value;
  }

  set selectedCountry(int value){
    _selectedCountry=value;
  }

  set selectedRegion(int value){
    _selectedRegion=value;
  }



  TextEditingController get dirctorController =>_dirctorController;
  TextEditingController get StudentNameController =>_StudentNameController;
  TextEditingController get SectionController =>_SectionController;
  TextEditingController get HeadController =>_HeadController;
  TextEditingController get ViceDeanController =>_ViceDeanController;



  set dirctorController (value){

    _dirctorController=value;
    notifyListeners();

  }

  set StudentNameController (value){

    _StudentNameController=value;
    notifyListeners();

  }

  set SectionController (value){

    _SectionController=value;
    notifyListeners();

  }

  set HeadController (value){

    _HeadController=value;
    notifyListeners();

  }

  set ViceDeanController (value){

    _ViceDeanController=value;
    notifyListeners();

  }


  int  indexGrid(){
   return _indexGrid;
  }
  void Increase(){
    _indexGrid+=1;

  }
List<bool> _flag=[false,false,false,false];
  bool  flag(int idx){
   return _flag[idx];
  }

  void setflag(int idx){
    _flag[idx]=!_flag[idx];
  }


}