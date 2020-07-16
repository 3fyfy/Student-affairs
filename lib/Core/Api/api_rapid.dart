//import 'dart:convert';
//import 'dart:io';
//import 'package:async/async.dart';
//import 'package:dio/adapter.dart';
//import 'package:dio/dio.dart';
//import 'package:gradution_app/Core/Models/ocr_model.dart';
//import 'package:gradution_app/Core/Provider/MainProvider.dart';
//import 'package:http/http.dart' as http;
//import 'package:flutter/material.dart';
//import 'package:path/path.dart';
//import 'dart:async';
//
//import 'package:provider/provider.dart';
//
//
//class APIService {
//  // API key
//
//
//  OCRModel ocrModel=OCRModel();
//
//
//  // Base API request to get response
//  Future<dynamic> getOcr(File image) async {
//
//   // var bytes = image.readAsBytesSync();
//   var bytes = image.uri;
//
//    final response = await http.post("https://microsoft-azure-microsoft-computer-vision-v1.p.rapidapi.com/ocr", headers: _headers,
//        body: { "file":image},
//        encoding: Encoding.getByName("utf-8")
//    );
//
//
//    if (response.statusCode == 200) {
//      // If server returns an OK response, parse the JSON.
//
//      return json.decode(response.body);
//    } else {
//      // If that response was not OK, throw an error.
//      throw Exception('Failed to load json data');
//    }
//
//
//  }
//
//
////  Future<FormData> FormData1() async {
////    return FormData.fromMap({
////      "name": "wendux",
////      "age": 25,
////      "file":
////      await MultipartFile.fromFile("./example/xx.png", filename: "xx.png"),
////      "files": [
////        await MultipartFile.fromFile("./example/upload.txt",
////            filename: "upload.txt"),
////        MultipartFile.fromFileSync("./example/upload.txt",
////            filename: "upload.txt"),
////      ]
////    });
////  }
////
////  Future<FormData> FormData2() async {
////    var formData = FormData();
////    formData.fields..add(MapEntry("name", "wendux"))..add(MapEntry("age", "25"));
////
////    formData.files.add(MapEntry(
////      "file",
////      await MultipartFile.fromFile("./example/xx.png", filename: "xx.png"),
////    ));
////
////    formData.files.addAll([
////      MapEntry(
////        "files[]",
////        await MultipartFile.fromFile("./example/upload.txt",
////            filename: "upload.txt"),
////      ),
////      MapEntry(
////        "files[]",
////        MultipartFile.fromFileSync("./example/upload.txt",
////            filename: "upload.txt"),
////      ),
////    ]);
////    return formData;
////  }
////
////  Future<FormData> FormData3(File fileImage) async {
////    return FormData.fromMap({
////      "file": await MultipartFile.fromFile(fileImage.path,
////          filename: "uploadfile"),
////    });
////  }
////  Future uploadImageMedia(File fileImage) async {
////
////
////    var dio = Dio();
////    dio.options.baseUrl = "https://microsoft-azure-microsoft-computer-vision-v1.p.rapidapi.com/ocr";
////    dio.interceptors.add(LogInterceptor());
////    //dio.interceptors.add(LogInterceptor(requestBody: true));
////    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
////        (HttpClient client) {
////      client.findProxy = (uri) {
////        //proxy all request to localhost:8888
////        return "PROXY localhost:8888";
////      };
////      client.badCertificateCallback =
////          (X509Certificate cert, String host, int port) => true;
////    };
////    Response response;
////
////    var formData1 = await FormData1();
////    var formData2 = await FormData2();
////    var bytes1 = await formData1.readAsBytes();
////    var bytes2 = await formData2.readAsBytes();
////    assert(bytes1.length == bytes2.length);
////
////    var t = await FormData3(fileImage);
////    print(utf8.decode(await t.readAsBytes()));
////
////    response = await dio.post(
////      //"/upload",
////      "https://microsoft-azure-microsoft-computer-vision-v1.p.rapidapi.com/ocr",
////      data: await FormData3(fileImage),
////     options: Options(headers: _headers)
////    );
////    print(response);
////  }
////
////
//
//}
