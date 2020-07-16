
class University {
  List<dynamic> buildings;
  List<dynamic> clinics;
  List<dynamic> collages;
  List<dynamic> courses;
  int id;
  List<dynamic> medicalExaminations;
  List<dynamic> militaryEducations;
  String name;
  List<dynamic> scholarships;

  University(
      {this.buildings,
        this.clinics,
        this.collages,
        this.courses,
        this.id,
        this.medicalExaminations,
        this.militaryEducations,
        this.name,
        this.scholarships});

  University.fromJson(Map<String, dynamic> json) {
    if (json['buildings'] != null) {
      buildings = new List<dynamic>();
      json['buildings'].forEach((v) {
        buildings.add(v);
      });
    }
    if (json['clinics'] != null) {
      clinics = new List<dynamic>();
      json['clinics'].forEach((v) {
        clinics.add(v);
      });
    }
    if (json['collages'] != null) {
      collages = new List<dynamic>();
      json['collages'].forEach((v) {
        collages.add(v);
      });
    }
    if (json['courses'] != null) {
      courses = new List<dynamic>();
      json['courses'].forEach((v) {
        courses.add(v);
      });
    }
    id = json['id'];
    if (json['medical_examinations'] != null) {
      medicalExaminations = new List<dynamic>();
      json['medical_examinations'].forEach((v) {
        medicalExaminations.add(v);
      });
    }
    if (json['military_educations'] != null) {
      militaryEducations = new List<dynamic>();
      json['military_educations'].forEach((v) {
        militaryEducations.add(v);
      });
    }
    name = json['name'];
    if (json['scholarships'] != null) {
      scholarships = new List<dynamic>();
      json['scholarships'].forEach((v) {
        scholarships.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.buildings != null) {
      data['buildings'] = this.buildings.map((v) => v.toJson()).toList();
    }
    if (this.clinics != null) {
      data['clinics'] = this.clinics.map((v) => v.toJson()).toList();
    }
    if (this.collages != null) {
      data['collages'] = this.collages.map((v) => v.toJson()).toList();
    }
    if (this.courses != null) {
      data['courses'] = this.courses.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    if (this.medicalExaminations != null) {
      data['medical_examinations'] =
          this.medicalExaminations.map((v) => v.toJson()).toList();
    }
    if (this.militaryEducations != null) {
      data['military_educations'] =
          this.militaryEducations.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    if (this.scholarships != null) {
      data['scholarships'] = this.scholarships.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
