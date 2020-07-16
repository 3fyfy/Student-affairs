class Housing {
  int degree;
  int distance;
  int ssn;

  Housing({this.degree, this.distance, this.ssn});

  Housing.fromJson(Map<String, dynamic> json) {
    degree = json['degree'];
    distance = json['distance'];
    ssn = json['ssn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['degree'] = this.degree;
    data['distance'] = this.distance;
    data['ssn'] = this.ssn;
    return data;
  }
}