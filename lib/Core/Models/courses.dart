import 'package:gradution_app/Core/Models/university.dart';

class Courses {
  String beginDate;
  String description;
  int duration;
  String email;
  String endDate;
  int id;
  int maxStudent;
  String name;
  int price;
  String professor;
  int typeCourse;
  University university;
  String website;

  Courses(
      {this.beginDate,
        this.description,
        this.duration,
        this.email,
        this.endDate,
        this.id,
        this.maxStudent,
        this.name,
        this.price,
        this.professor,
        this.typeCourse,
        this.university,
        this.website});

  Courses.fromJson(Map<String, dynamic> json) {
    beginDate = json['begin_date'];
    description = json['description'];
    duration = json['duration'];
    email = json['email'];
    endDate = json['end_date'];
    id = json['id'];
    maxStudent = json['max_student'];
    name = json['name'];
    price = json['price'];
    professor = json['professor'];
    typeCourse = json['type_course'];
    university = json['university'] != null
        ? new University.fromJson(json['university'])
        : null;
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['begin_date'] = this.beginDate;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['email'] = this.email;
    data['end_date'] = this.endDate;
    data['id'] = this.id;
    data['max_student'] = this.maxStudent;
    data['name'] = this.name;
    data['price'] = this.price;
    data['professor'] = this.professor;
    data['type_course'] = this.typeCourse;
    if (this.university != null) {
      data['university'] = this.university.toJson();
    }
    data['website'] = this.website;
    return data;
  }
}

