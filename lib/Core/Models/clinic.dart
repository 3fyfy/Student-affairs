

class Clinics {
  int id;
  String name;
  List<dynamic> patientBooks;

  Clinics({this.id, this.name, this.patientBooks});

  Clinics.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    name = json['name'];
    if (json['patient_books'] != null) {
      patientBooks = new List<dynamic>();
      json['patient_books'].forEach((v) {
        patientBooks.add(v);
      });
    }

  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.patientBooks != null) {
      data['patient_books'] = this.patientBooks.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



