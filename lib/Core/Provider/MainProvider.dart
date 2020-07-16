import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gradution_app/Core/Models/Student.dart';


class MainProvider with ChangeNotifier{


  int _indexGrid=-1;

  TextEditingController _dirctorController=TextEditingController(text: 'Information Technology instute ');
  TextEditingController _StudentNameController=TextEditingController(text: 'Information Technology instute');
  TextEditingController _SectionController=TextEditingController(text: 'Information Technology instute');
  TextEditingController _organization=TextEditingController(text: '');
  TextEditingController _description=TextEditingController(text: '');

  Student _currentStudent;

  Student  currentStudent() => _currentStudent;

  setcurrentStudent(Student value) {
    _currentStudent = value;
    notifyListeners();

  } //Images
  File _nomination=null;
  File _highSchool=null;

  File  IDcardFront() => _IDcardFront;

   setIDcardFront(File value) {
    _IDcardFront = value;

  }

  File _IDcardFront=null;
  File _IDcardBack=null;
  File _guardianIDcardFront=null;
  File _guardianIDcardBack=null;
  File _Birth=null;
  File _model2=null;
  File _medical=null;


  //Data Student
  String _address='';

  String _birthDate='';
  bool _gender=false;
  String _graduationYear='';

  String  address() => _address;

  setaddress(String value) {
    _address = value;


  }

  String _homeTel='';
  int _id=0;
  String _institute='';
  String _mobile='';
  String _nameAr='';
  String _password='';
  int _percentage=0;
  String _previousQualification='';
  String _relationship='';
  int _religion=0;
  String _guardianName='';
  String _guardianAddress='';
  bool _guardianGender=false;
  String _guardianRelationship='';

  String  guardianName() => _guardianName;

  setguardianName(String value) {
    _guardianName = value;
  }

  int _guardianReligion=0;
  String _guardianJob='';
  int _ssn=0;
  int _status=0;
  String _total='';
  String _userName='';
  int _yearCollage=0;
  int _university=0;
  int _collage=0;


  int  university() => _university;

  setuniversity(int value) {
    _university = value;
  }

  File  nomination()=>_nomination;
  File  highSchool()=>_highSchool;
  File  Birth()=>_Birth;
  File  model2()=>_model2;
  File  medical()=>_medical;

  setnomination( value){
    _nomination=value;

  }
  sethighSchool( value){

    _highSchool=value;

  }


  setBirth( value){

    _Birth=value;

  }
  setmodel2( value){

    _model2=value;

  }
  setmedical( value){

    _medical=value;

  }


  double _distance=0;
  double  distance()=>_distance;

  setdistance(double value){

    _distance=value;
  }

  int _selectedCity=0;
  int _selectedCountry=0;
  int _selectedRegion=0;

  int  selectedCity()=>_selectedCity;
  int  selectedCountry()=>_selectedCountry;
  int  selectedRegion()=>_selectedRegion;


  setselectedCity(int value) {
    _selectedCity = value;


  }

  setselectedCountry(int value){
    _selectedCountry=value;


  }

  setselectedRegion(int value){
    _selectedRegion=value;


  }



  TextEditingController get dirctorController =>_dirctorController;
  TextEditingController get StudentNameController =>_StudentNameController;
  TextEditingController get SectionController =>_SectionController;
  TextEditingController  organization() =>_organization;
  TextEditingController  description() =>_description;



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

  setorganization (value){

    _organization=value;
    notifyListeners();

  }

  setdescription (value){

    _description=value;
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

  String get birthDate => _birthDate;

  set birthDate(String value) {
    _birthDate = value;

    notifyListeners();
  }

  bool  gender() => _gender;

  void setgender(bool value) {
    _gender = value;
   }

  String  graduationYear() => _graduationYear;

  setgraduationYear(String value) {
    _graduationYear = value;


  }

  String  homeTel() => _homeTel;

  sethomeTel(String value) {
    _homeTel = value;


  }

  int  id() => _id;

  setid(int value) {
    _id = value;


  }

  String  institute() => _institute;

  setinstitute(String value) {
    _institute = value;


  }

  String  mobile() => _mobile;

  setmobile(String value) {
    _mobile = value;
  }

  String  nameAr() => _nameAr;

  setnameAr(String value) {
    _nameAr = value;

  }

  String  password() => _password;

  setpassword(String value) {
    _password = value;


  }

  int  percentage() => _percentage;

  setpercentage(int value) {
    _percentage = value;


  }

  String  previousQualification() => _previousQualification;

  setpreviousQualification(String value) {
    _previousQualification = value;


  }

  String  relationship() => _relationship;

  setrelationship(String value) {
    _relationship = value;


  }

  int  religion() => _religion;

  setreligion(int value) {
    _religion = value;


  }

  int  ssn() => _ssn;

  setssn(int value) {
    _ssn = value;


  }

  int  status() => _status;

  setstatus(int value) {
    _status = value;


  }

  String  total() => _total;

  settotal(String value) {
    _total = value;


  }

  String  userName() => _userName;

  setuserName(String value) {
    _userName = value;


  }

  int  yearCollage() => _yearCollage;

  setyearCollage(int value) {
    _yearCollage = value;


  }

  File  IDcardBack() => _IDcardBack;

  setIDcardBack(File value) {
    _IDcardBack = value;


  }

  File  guardianIDcardFront() => _guardianIDcardFront;

  setguardianIDcardFront(File value) {
    _guardianIDcardFront = value;


  }

  File  guardianIDcardBack() => _guardianIDcardBack;

  setguardianIDcardBack(File value) {
    _guardianIDcardBack = value;


  }

  int  collage() => _collage;

  setcollage(int value) {
    _collage = value;
  }

  String  guardianAddress() => _guardianAddress;

  setguardianAddress(String value) {
    _guardianAddress = value;
  }

  bool  guardianGender() => _guardianGender;

  setguardianGender(bool value) {
    _guardianGender = value;
  }

  String  guardianRelationship() => _guardianRelationship;

  setguardianRelationship(String value) {
    _guardianRelationship = value;
  }

  int  guardianReligion() => _guardianReligion;

  setguardianReligion(int value) {
    _guardianReligion = value;
  }

  String  guardianJob() => _guardianJob;

  setguardianJob(String value) {
    _guardianJob = value;
  }












}