import 'dart:io';
import 'package:gradution_app/Core/Api/api.dart';
import 'package:gradution_app/Core/Models/Student.dart';
import 'package:gradution_app/Core/Models/clinic.dart';
import 'package:gradution_app/Core/Models/courses.dart';
import 'package:gradution_app/Core/Models/fee.dart';
import 'package:gradution_app/Core/Models/midical_examination.dart';
import 'package:gradution_app/Core/Models/military_education.dart';
import 'package:gradution_app/Core/Models/ocr_model.dart';
import 'package:gradution_app/Core/Models/scholarships.dart';
import 'package:gradution_app/Core/Models/training_portal.dart';
import 'package:gradution_app/Core/Provider/base_model.dart';
import 'package:gradution_app/Core/enums/viewstate.dart';
import 'package:gradution_app/locator.dart';
import 'package:gradution_app/Core/Models/university.dart';
import 'package:gradution_app/Core/Models/collage.dart';
import 'package:gradution_app/Core/Models/patient_book.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  OCRModel ocrModel=OCRModel();

  int SSN=2970009;
  Student student;
 List <Clinics> clinics;
  List<University>universities;
  List<Collage> collages;
  List<PatientBooks> books;
  PatientBooks spesificBook=PatientBooks(patientBooksId: null);

  List<Scholarship> scholarships;
  List<MidicalExaminition> examinitions;

  var courses = List<Courses>();
  var militaries = List<Military>();

  List<TrainingPortal> trainingPortals;
List<Fee>fees;
List<Department>departments;

///////////////Student/////////////

  Future getStudentProfile(int userId) async {
    setState(ViewState.Busy);
    student = await _api.getUserProfile(userId);
    setState(ViewState.Idle);
  }

  ////////////Fees /////////////

  Future<List<Fee>> getAllFeeStudent(int userId) async {
    setState(ViewState.Busy);
    fees = await _api.getAllFeeStudent(userId);
    setState(ViewState.Idle);
  }

  /////////////////Militry////////////

  Future getMilitaryStudent(int ssn,int militaryId)async {
    setState(ViewState.Busy);
    militaries = await _api.getMilitaryStudent( ssn,militaryId);
    setState(ViewState.Idle);
  }

///////////////University/////////////
  Future getAllUniversity() async {
    setState(ViewState.Busy);
    universities = await _api.getAllUniversity();
    setState(ViewState.Idle);

  }

  ///////////////Collage/////////////

  Future getAllCollageInUniversity(int universityId) async {
    setState(ViewState.Busy);
    collages = await _api.getAllCollageInUniversity(universityId);
    setState(ViewState.Idle);
  }


  ///////////////Department////////////////
  Future<List<Fee>> getAllDepartmentInCollage(int collageId) async {
    setState(ViewState.Busy);
    departments = await _api.getAllDepartmentInCollage(collageId);
    setState(ViewState.Idle);
  }
  ///////////////MidicalExaminition/////////////

  Future getAllMidicalExaminitionInUniversity(int universityId) async {
    setState(ViewState.Busy);
    examinitions = await _api.getAllMidicalExaminitionInUniversity(universityId);
    setState(ViewState.Idle);
  }

  ///////////////Scholarships/////////////

  Future getAllScholarshipsInUniversity(int universityId) async {
    setState(ViewState.Busy);
    scholarships = await _api.getAllScholarshipsInUniversity(universityId);
    setState(ViewState.Idle);
  }


  ///////////////Courses/////////////

  Future getAllCoursesInUniversity(int universityId) async {
    setState(ViewState.Busy);
    courses = await _api.getAllCoursesInUniversity(universityId);
    setState(ViewState.Idle);
  }

  ///////////////Courses/////////////

  Future getAllTrainingPortalsInCollage(int collageId)  async {
    setState(ViewState.Busy);
    trainingPortals = await _api.getAllTrainingPortalsInCollage(collageId);
    setState(ViewState.Idle);
  }


///////////////Clinics/////////////

  Future getClinicsUniversity(int universityId) async {
    setState(ViewState.Busy);
    clinics = await _api.getClinicsUniversity(universityId);
    setState(ViewState.Idle);
  }

  ///////////////BookCLinic/////////////

  Future getBookCLinic(int studenId,int clicicId) async {
    setState(ViewState.Busy);
    spesificBook = await _api.getBookCLinic(studenId,clicicId);
    setState(ViewState.Idle);
  }

  ///////////////PatientBook/////////////

  Future getPatientBookStudent(int studenId) async {
    setState(ViewState.Busy);
    books = await _api.getPatientBooksStudent(studenId);
    setState(ViewState.Idle);
  }




  ///////////////   Ocr   /////////////

  Future getDataOCR(File image)async{
    setState(ViewState.Busy);
    ocrModel = await _api.Upload(image);
    setState(ViewState.Idle);
  }



}