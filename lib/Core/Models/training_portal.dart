import 'package:gradution_app/Core/Models/collage.dart';

class TrainingPortal {
String address;
Collage collage;
int id;
String name;
List<dynamic> training;

TrainingPortal(
    {this.address, this.collage, this.id, this.name, this.training});

TrainingPortal.fromJson(Map<String, dynamic> json) {
address = json['address'];
collage =
json['collage'] != null ? new Collage.fromJson(json['collage']) : null;
id = json['id'];
name = json['name'];
if (json['training'] != null) {
training = new List<dynamic>();
json['training'].forEach((v) {
training.add(v);
});
}
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['address'] = this.address;
  if (this.collage != null) {
    data['collage'] = this.collage.toJson();
  }
  data['id'] = this.id;
  data['name'] = this.name;
  if (this.training != null) {
    data['training'] = this.training.map((v) => v.toJson()).toList();
  }
  return data;
}
}

