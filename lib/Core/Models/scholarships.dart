import 'package:gradution_app/Core/Models/university.dart';



class Scholarship {
  String link;
  String title;
  University university;

  Scholarship({this.link, this.title, this.university});

  Scholarship.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    title = json['title'];
    university = json['university'] != null
        ? new University.fromJson(json['university'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['title'] = this.title;
    if (this.university != null) {
      data['university'] = this.university.toJson();
    }
    return data;
  }
}

