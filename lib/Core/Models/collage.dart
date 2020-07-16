
class Collage {
  List<dynamic> departments;
  List<dynamic> desiredCollages;
  int id;
  String name;
  List<dynamic> trainingPortals;

  Collage(
      {this.departments,
        this.desiredCollages,
        this.id,
        this.name,
        this.trainingPortals});

  Collage.fromJson(Map<String, dynamic> json) {
    if (json['departments'] != null) {
      departments = new List<dynamic>();
      json['departments'].forEach((v) {
        departments.add(v);
      });
    }
    if (json['desired_collages'] != null) {
      desiredCollages = new List<dynamic>();
      json['desired_collages'].forEach((v) {
        desiredCollages.add(v);
      });
    }
    id = json['id'];
    name = json['name'];
    if (json['training_portals'] != null) {
      trainingPortals = new List<dynamic>();
      json['training_portals'].forEach((v) {
        trainingPortals.add(v);
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.departments != null) {
      data['departments'] = this.departments.map((v) => v.toJson()).toList();
    }
    if (this.desiredCollages != null) {
      data['desired_collages'] =
          this.desiredCollages.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.trainingPortals != null) {
      data['training_portals'] =
          this.trainingPortals.map((v) => v.toJson()).toList();
    }

    return data;
  }
}