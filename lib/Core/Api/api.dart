import 'dart:io';

import 'package:async/async.dart';
import 'package:gradution_app/Core/Models/clinic.dart';
import 'package:gradution_app/Core/Models/courses.dart';
import 'package:gradution_app/Core/Models/fee.dart';
import 'package:gradution_app/Core/Models/midical_examination.dart';
import 'package:gradution_app/Core/Models/military_education.dart';
import 'package:gradution_app/Core/Models/ocr_model.dart';
import 'package:gradution_app/Core/Models/scholarships.dart';
import 'package:gradution_app/Core/Models/training_portal.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:gradution_app/Core/Models/Student.dart';
import 'package:gradution_app/Core/Models/university.dart';
import 'package:gradution_app/Core/Models/collage.dart';
import 'package:gradution_app/Core/Models/patient_book.dart';
import 'package:path/path.dart';


class Api {

  static const url = 'http://192.168.43.220:8080/webservice/webapi/';

  var client = new http.Client();

  /////////////// Student ////////////////////

  Future<Student> getUserProfile(int userId) async {
    var response = await client.get('${url}student?ssn=${userId}', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader:'utf-8',
    });

    String body = convert.utf8.decode(response.bodyBytes);
print(body);
    return Student.fromJson(convert.json.decode(body));
  }


  updateStudentData(Student data)async{


    var sendUrl = '${url}student';
    await http.post(sendUrl, headers: {
      'Content-Type': 'application/json; charset=UTF-8'
    }, body: convert.utf8.encode(convert.jsonEncode(data.toJson())),
    ).then((response) {

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });
  }


//////////////////////////// Fee Student ///////////////////////////////

  Future<List<Fee>> getAllFeeStudent(int userId) async {
    var fees = List<Fee>();
    var response = await client.get('${url}student/fees?ssn=${userId}', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader:'utf-8',
    });

    var parsed = convert.json.decode(convert.utf8.decode(response.bodyBytes)) as List<dynamic>;

    for (var fee in parsed) {
      fees.add(Fee.fromJson(fee));
    }
    return fees;
  }


  /////////////////////////////////Military //////////////////////

  Future<List<Military>> getMilitaryStudent(int ssn,int militaryId) async {
    var militaries = List<Military>();
    var response = await client.get('${url}university/military_student?ssn=${ssn}&military=${militaryId}', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader:'utf-8',
    });

    var parsed = convert.json.decode(convert.utf8.decode(response.bodyBytes)) as List<dynamic>;

    for (var military in parsed) {
      militaries.add(Military.fromJson(military));
    }
    return militaries;
  }



  ////////////////////////////  All University /////////////////////////
  Future<List<University>> getAllUniversity() async {
    var universities = List<University>();
    var response = await client.get('${url}university', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader:'utf-8',
    });

    var parsed = convert.json.decode(convert.utf8.decode(response.bodyBytes)) as List<dynamic>;

    for (var university in parsed) {
      universities.add(University.fromJson(university));
    }
    return universities;
  }


  //Collages In University
  Future<List<Collage>> getAllCollageInUniversity(int universityId) async {
    var collages = List<Collage>();
    var response = await client.get('${url}university/collage?id=${universityId}', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader:'utf-8',
    });

    var parsed = convert.json.decode(convert.utf8.decode(response.bodyBytes)) as List<dynamic>;

    for (var collage in parsed) {
      collages.add(Collage.fromJson(collage));
    }
    return collages;
  }

  ////////////////// Departments inCollage //////////////////

  Future<List<Department>> getAllDepartmentInCollage(int collageId) async {
    var departments = List<Department>();
    var response = await client.get('${url}university/department?collage=${collageId}', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader:'utf-8',
    });

    var parsed = convert.json.decode(convert.utf8.decode(response.bodyBytes)) as List<dynamic>;

    for (var department in parsed) {
      departments.add(Department.fromJson(department));
    }
    return departments;
  }


  //MidicalExaminition In University
  Future<List<MidicalExaminition>> getAllMidicalExaminitionInUniversity(int universityId) async {
    var examinitions = List<MidicalExaminition>();
    var response = await client.get('${url}university/medical_examination?id=${universityId}', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader:'utf-8',
    });

    var parsed = convert.json.decode(convert.utf8.decode(response.bodyBytes)) as List<dynamic>;

    for (var examinition in parsed) {
      examinitions.add(MidicalExaminition.fromJson(examinition));
    }
    return examinitions;
  }


  ///////////////////Scholarships In University///////////////////////////////////////////
  Future<List<Scholarship>> getAllScholarshipsInUniversity(int universityId) async {
    var scholarships = List<Scholarship>();
    var response = await client.get('${url}university/scholarship?id=${universityId}', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader:'utf-8',
    });

    var parsed = convert.json.decode(convert.utf8.decode(response.bodyBytes)) as List<dynamic>;

    for (var scholarship in parsed) {
      scholarships.add(Scholarship.fromJson(scholarship));
    }
    return scholarships;
  }


  ///////////////////Courses In University///////////////////////////////////////////
  Future<List<Courses>> getAllCoursesInUniversity(int universityId) async {
    var courses = List<Courses>();
    var response = await client.get('${url}university/courses?id=${universityId}', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader:'utf-8',
    });

    var parsed = convert.json.decode(convert.utf8.decode(response.bodyBytes)) as List<dynamic>;

    for (var course in parsed) {
      courses.add(Courses.fromJson(course));
    }
    return courses;
  }



  ///////////////////Courses In University///////////////////////////////////////////
  Future<List<TrainingPortal>> getAllTrainingPortalsInCollage(int collageId) async {
    var trainingPortals = List<TrainingPortal>();
    var response = await client.get('${url}university/training_portal?id=${collageId}', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader:'utf-8',
    });

    var parsed = convert.json.decode(convert.utf8.decode(response.bodyBytes)) as List<dynamic>;

    for (var course in parsed) {
      trainingPortals.add(TrainingPortal.fromJson(course));
    }
    return trainingPortals;
  }



////////////////////// Clinics in University///////////////////////
  Future<List<Clinics>> getClinicsUniversity(int universityId) async {
    var clinics = List<Clinics>();
    var response = await client.get('${url}university/clinic?id=${universityId}', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader:'utf-8',
    });

    var parsed = convert.json.decode(convert.utf8.decode(response.bodyBytes)) as List<dynamic>;

    for (var clinic in parsed) {
        clinics.add(Clinics.fromJson(clinic));

    }
    return clinics;
  }

  ///////////////////  get PatientBook student ///////////
  Future<List<PatientBooks>> getPatientBooksStudent(int studenId) async {
    var patient_books = List<PatientBooks>();
    var response = await client.get('${url}student/patient?ssn=${studenId}', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader:'utf-8',
    });

    var parsed = convert.json.decode(convert.utf8.decode(response.bodyBytes)) as List<dynamic>;

    for (var book in parsed) {
      patient_books.add(PatientBooks.fromJson(book));
    }
    return patient_books;
  }

  ////////////////// /get spesific book of clinic student //////////////////
  Future<PatientBooks> getBookCLinic(int studenId,int clicicId) async {
    PatientBooks patient_book=PatientBooks(patientBooksId: null);
    var response = await client.get('${url}student/patient?ssn=${studenId}', headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader:'utf-8',
    });

    var parsed = convert.json.decode(convert.utf8.decode(response.bodyBytes)) as List<dynamic>;

    for (var book in parsed) {
      if(PatientBooks.fromJson(book).patientBooksId.clinic==clicicId){
        patient_book=PatientBooks.fromJson(book);
      }
    }
    return patient_book;
  }

  ////////////////// /Post spesific book of clinic student //////////////////

  postPatientBookStudent(PatientBooks data) async {

    // Map patientBooks=data.toJson();
    print(convert.jsonEncode(data.toJson()));
    var sendUrl = '${url}student/patient';
    http.post(sendUrl,headers: {"Content-Type": "application/json; charset=UTF-8"}, body:  convert.utf8.encode(convert.jsonEncode(data.toJson())),
    )
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });
  }
  ////////////////// /Delete spesific book of clinic student //////////////////

  deletePatientBookStudent(PatientBooks data) async {

    // Map patientBooks=data.toJson();
    print(convert.jsonEncode(data.toJson()));
    var sendUrl = '${url}student/patient/delete';
    http.post(sendUrl,headers: {"Content-Type": "application/json"}, body:  convert.utf8.encode(convert.jsonEncode(data.toJson())),)
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });
  }









  static const _api_key ="aa0a7e7c18msh648b4b75fd51228p1c6160jsncec78c552c75";

  static const Map<String, String> _headers = {
    "x-rapidapi-host": "microsoft-azure-microsoft-computer-vision-v1.p.rapidapi.com",
    "x-rapidapi-key": _api_key,
    "content-type": "multipart/form-data",
    "Accept": "application/json"
  };
  Future<OCRModel> Upload(File imageFile) async {

    OCRModel ocrModel=OCRModel();
    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();

    var uri = Uri.parse("https://microsoft-azure-microsoft-computer-vision-v1.p.rapidapi.com/ocr");

    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('file', stream, length,
      filename: basename(imageFile.path), );
    request.headers.addAll(_headers);

    request.files.add(multipartFile);

    try {
      final  streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode != 200) {
        return null;
      }
      var responseData = convert.json.decode(response.body);
      OCRModel ocrModel=OCRModel.fromJson(responseData);
      print(responseData);
      return ocrModel;
    } catch (e) {
      print(e);
      return null;
    }

  }


  static const _api_vision_key="AIzaSyA9nzmFnvqZkAx9eXyj3NBvf4R18QSzpCc";
  Future VisionApiCall(File image)async{


  List<int>imageBytes=image.readAsBytesSync();

  String base64Image=convert.base64Encode(imageBytes);
  var request=  {
    "requests": [
      {
        "image": {
          "content": "$base64Image"
        },
        "features": [
          {
            "type": "TEXT_DETECTION"
          }
        ]
      }
    ]
  };
  var url ="https://vision.googleapis.com/v1/images:annotate?key=$_api_vision_key";

  var response=await http.post(url,body: convert.json.encode(request));

    var responseData = convert.json.decode(response.body);
    OCRModel ocrModel=OCRModel.fromJson(responseData);

    return ocrModel;


  }





}
