import 'package:gradution_app/Core/Models/university.dart';

class MidicalExaminition {
  String dateExamination;
  int id;
  String place;
  University university;

  MidicalExaminition(
      {this.dateExamination, this.id, this.place, this.university});

  MidicalExaminition.fromJson(Map<String, dynamic> json) {
    dateExamination = json['date_examination'];
    id = json['id'];
    place = json['place'];
    university = json['university'] != null
        ? new University.fromJson(json['university'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_examination'] = this.dateExamination;
    data['id'] = this.id;
    data['place'] = this.place;
    if (this.university != null) {
      data['university'] = this.university.toJson();
    }
    return data;
  }
}

