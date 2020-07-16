import 'package:gradution_app/Core/Models/Student.dart';
import 'package:gradution_app/Core/Models/university.dart';

class Military {
  MilitaryEducation militaryEducation;
  MilitaryStudentId militaryStudentId;
  Student student;

  Military(
      {this.militaryEducation, this.militaryStudentId, this.student});

  Military.fromJson(Map<String, dynamic> json) {
    militaryEducation = json['military_education'] != null
        ? new MilitaryEducation.fromJson(json['military_education'])
        : null;
    militaryStudentId = json['military_studentId'] != null
        ? new MilitaryStudentId.fromJson(json['military_studentId'])
        : null;
    student =
    json['student'] != null ? new Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.militaryEducation != null) {
      data['military_education'] = this.militaryEducation.toJson();
    }
    if (this.militaryStudentId != null) {
      data['military_studentId'] = this.militaryStudentId.toJson();
    }
    if (this.student != null) {
      data['student'] = this.student.toJson();
    }
    return data;
  }
}

class MilitaryEducation {
  String beginDate;
  String endDate;
  int id;
  List<dynamic> militaryStudent;
  String officer;
  University university;

  MilitaryEducation(
      {this.beginDate,
        this.endDate,
        this.id,
        this.militaryStudent,
        this.officer,
        this.university});

  MilitaryEducation.fromJson(Map<String, dynamic> json) {
    beginDate = json['begin_date'];
    endDate = json['end_date'];
    id = json['id'];
    if (json['military_student'] != null) {
      militaryStudent = new List<Null>();
      json['military_student'].forEach((v) {
        militaryStudent.add(v);
      });
    }
    officer = json['officer'];
    university = json['university'] != null
        ? new University.fromJson(json['university'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['begin_date'] = this.beginDate;
    data['end_date'] = this.endDate;
    data['id'] = this.id;
    if (this.militaryStudent != null) {
      data['military_student'] =
          this.militaryStudent.map((v) => v.toJson()).toList();
    }
    data['officer'] = this.officer;
    if (this.university != null) {
      data['university'] = this.university.toJson();
    }
    return data;
  }
}


class MilitaryStudentId {
  int militaryEducation;
  int student;

  MilitaryStudentId({this.militaryEducation, this.student});

  MilitaryStudentId.fromJson(Map<String, dynamic> json) {
    militaryEducation = json['military_education'];
    student = json['student'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['military_education'] = this.militaryEducation;
    data['student'] = this.student;
    return data;
  }
}

