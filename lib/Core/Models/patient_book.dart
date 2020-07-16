
//part 'patient_books.g.dart';
//part 'patient_books_id.g.dart';

class PatientBooks {

  PatientBooksId patientBooksId;

  PatientBooks({ this.patientBooksId});

    PatientBooks.fromJson(Map<String, dynamic> json)

  //=>_$PatientBooksFromJson(json);
  {

    patientBooksId = json['patient_booksId'] != null
        ? new PatientBooksId.fromJson(json['patient_booksId'])
        : null;
  }

  Map<String, dynamic> toJson()
  //=>_$PatientBooksToJson(this);
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.patientBooksId != null) {
      data['patient_booksId'] = this.patientBooksId.toJson();
    }
    return data;
  }
}




class PatientBooksId {
  int clinic;
  String dateOfBook;
  int student;

  PatientBooksId({this.clinic, this.dateOfBook, this.student});

     PatientBooksId.fromJson(Map<String, dynamic> json)
  //=> _$PatientBooksIdFromJson(json);
  {
    clinic = json['clinic'];
    dateOfBook = json['date_of_book'];
    student = json['student'];
  }

  Map<String, dynamic> toJson()
  //=>_$PatientBooksIdToJson(this);
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinic'] = this.clinic;
    data['date_of_book'] = this.dateOfBook;
    data['student'] = this.student;
    return data;
  }
}




