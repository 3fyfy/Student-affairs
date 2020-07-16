
//
//import 'package:json_annotation/json_annotation.dart';
//
//@JsonSerializable(nullable: false)
import 'package:gradution_app/Core/Models/collage.dart';


class Student {
  int acadimicYear=0;
  String address="";
  String birthDate="";
  Department department;
  List<dynamic> departmentStudents=[];
  List<dynamic> desiredCollages=[];
  String fax="";
  List<dynamic> fees=[];
  bool gender=false;
  String graduationYear="";
  Guardian guardian;
  String homeTel="";
  List<dynamic> housings=[];
  int id=0;
  String idType="";
  String institute="";
  String mailBox="";
  List<dynamic> militaryStudents=[];
  String mobile="";
  String nameAr="";
  String nameEn="";
  String nationality="";
  List<dynamic> notificationsMedicals=[];
  String password="";
  List<dynamic> patientBooks=[];
  int percentage=0;
  int position=0;
  String postalCode="";
  String previousQualification="";
  String relationship="";
  int religion=0;
  int ssn=0;
  int status=0;
  String total="";
  String userName="";
  int yearCollage=0;

  Student(
      {this.acadimicYear,
        this.address,
        this.birthDate,
        this.department,
        this.departmentStudents,
        this.desiredCollages,
        this.fax,
        this.fees,
        this.gender,
        this.graduationYear,
        this.guardian,
        this.homeTel,
        this.housings,
        this.id,
        this.idType,
        this.institute,
        this.mailBox,
        this.militaryStudents,
        this.mobile,
        this.nameAr,
        this.nameEn,
        this.nationality,
        this.notificationsMedicals,
        this.password,
        this.patientBooks,
        this.percentage,
        this.position,
        this.postalCode,
        this.previousQualification,
        this.relationship,
        this.religion,
        this.ssn,
        this.status,
        this.total,
        this.userName,
        this.yearCollage});

  Student.fromJson(Map<String, dynamic> json) {
    acadimicYear = json['acadimic_year'];
    address = json['address'];
    birthDate = json['birth_date'];
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
    if (json['department_students'] != null) {
      departmentStudents = new List<dynamic>();
      json['department_students'].forEach((v) {
        departmentStudents.add(v);
      });
    }
    if (json['desired_collages'] != null) {
      desiredCollages = new List<dynamic>();
      json['desired_collages'].forEach((v) {
        desiredCollages.add(v);
      });
    }
    fax = json['fax'];
    if (json['fees'] != null) {
      fees = new List<dynamic>();
      json['fees'].forEach((v) {
        fees.add(v);
      });
    }
    gender = json['gender'];
    graduationYear = json['graduation_year'];
    guardian = json['guardian'] != null
        ? new Guardian.fromJson(json['guardian'])
        : null;
    homeTel = json['home_tel'];
    if (json['housings'] != null) {
      housings = new List<dynamic>();
      json['housings'].forEach((v) {
        housings.add(v);
      });
    }
    id = json['id'];
    idType = json['id_type'];
    institute = json['institute'];
    mailBox = json['mail_box'];
    if (json['military_students'] != null) {
      militaryStudents = new List<dynamic>();
      json['military_students'].forEach((v) {
        militaryStudents.add(v);
      });
    }
    mobile = json['mobile'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    nationality = json['nationality'];
    if (json['notifications_medicals'] != null) {
      notificationsMedicals = new List<dynamic>();
      json['notifications_medicals'].forEach((v) {
        notificationsMedicals.add(v);
      });
    }
    password = json['password'];
    if (json['patient_books'] != null) {
      patientBooks = new List<dynamic>();
      json['patient_books'].forEach((v) {
        patientBooks.add(v);
      });
    }
    percentage = json['percentage'];
    position = json['position'];
    postalCode = json['postal_code'];
    previousQualification = json['previous_qualification'];
    relationship = json['relationship'];
    religion = json['religion'];
    ssn = json['ssn'];
    status = json['status'];
    total = json['total'];
    userName = json['user_name'];
    yearCollage = json['year_collage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acadimic_year'] = this.acadimicYear;
    data['address'] = this.address;
    data['birth_date'] = this.birthDate;
    if (this.department != null) {
//      data['department'] = this.department.toJson();
    }
    if (this.departmentStudents != null) {
//      data['department_students'] =
//          this.departmentStudents.map((v) => v.toJson()).toList();
    }
    if (this.desiredCollages != null) {
//      data['desired_collages'] =
//          this.desiredCollages.map((v) => v.toJson()).toList();
    }
    data['fax'] = this.fax;
    if (this.fees != null) {
//      data['fees'] = this.fees.map((v) => v.toJson()).toList();
    }
    data['gender'] = this.gender;
    data['graduation_year'] = this.graduationYear;
  if (this.guardian != null) {
//  data['guardian'] = this.guardian.toJson();
  }
    data['home_tel'] = this.homeTel;
    if (this.housings != null) {
//      data['housings'] = this.housings.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['id_type'] = this.idType;
    data['institute'] = this.institute;
    data['mail_box'] = this.mailBox;
    if (this.militaryStudents != null) {
//      data['military_students'] =
//          this.militaryStudents.map((v) => v.toJson()).toList();
    }
    data['mobile'] = this.mobile;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['nationality'] = this.nationality;
    if (this.notificationsMedicals != null) {
//      data['notifications_medicals'] =
//          this.notificationsMedicals.map((v) => v.toJson()).toList();
    }
    data['password'] = this.password;
    if (this.patientBooks != null) {
//      data['patient_books'] = this.patientBooks.map((v) => v.toJson()).toList();
    }
    data['percentage'] = this.percentage;
    data['position'] = this.position;
    data['postal_code'] = this.postalCode;
    data['previous_qualification'] = this.previousQualification;
    data['relationship'] = this.relationship;
    data['religion'] = this.religion;
    data['ssn'] = this.ssn;
    data['status'] = this.status;
    data['total'] = this.total;
    data['user_name'] = this.userName;
    data['year_collage'] = this.yearCollage;
    return data;
  }
}

class Department {
  Collage collage;
  String header="";
  int id=0;
  String name="";
  List<dynamic> students=[];

  Department({this.collage, this.header, this.id, this.name, this.students});

  Department.fromJson(Map<String, dynamic> json) {
    collage =
    json['collage'] != null ? new Collage.fromJson(json['collage']) : null;
    header = json['header'];
    id = json['id'];
    name = json['name'];
    if (json['students'] != null) {
      students = new List<dynamic>();
      json['students'].forEach((v) {
        students.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.collage != null) {
      data['collage'] = this.collage.toJson();
    }
    data['header'] = this.header;
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.students != null) {
      data['students'] = this.students.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Guardian {
  String email="";
  String fax="";
  String homeTel="";
  String jobTitle="";
  String mobile="";
  String name="";
  int relation=0;
  int ssn=0;
  String workPlace="";

  Guardian({this.email,
    this.fax,
    this.homeTel,
    this.jobTitle,
    this.mobile,
    this.name,
    this.relation,
    this.ssn,
    this.workPlace});

  Guardian.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fax = json['fax'];
    homeTel = json['home_tel'];
    jobTitle = json['job_title'];
    mobile = json['mobile'];
    name = json['name'];
    relation = json['relation'];
    ssn = json['ssn'];
    workPlace = json['work_place'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['fax'] = this.fax;
    data['home_tel'] = this.homeTel;
    data['job_title'] = this.jobTitle;
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    data['relation'] = this.relation;
    data['ssn'] = this.ssn;
    data['work_place'] = this.workPlace;
    return data;
  }
}