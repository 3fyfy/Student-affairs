import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:gradution_app/Core/Api/api.dart';
import 'package:gradution_app/Core/Models/patient_book.dart';
import 'package:gradution_app/Core/Provider/home_model.dart';
import 'package:gradution_app/UI/Screens/base_view.dart';
import 'package:gradution_app/UI/Screens/samer/successfully_apply.dart';
import 'package:gradution_app/UI/Widgets/ButtonApply.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';



class CalenderPage extends StatefulWidget {
  final int clinicId;

  CalenderPage(this.clinicId);

  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {


  bool first=true ;
  DateTime _selectedDate=DateTime.now();
  DateTime _initdDate=DateTime.now();

  int ssn=0;

  pref()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.ssn = (prefs.getInt('SSN'));
    setState(() {

    });
  }

  @override
  void initState() {
    pref();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(

      appBar: AppBar(
        title: Text("Hospital reservation",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        }),
      ),

      body:(ssn!=0)? BaseView<HomeModel>(
    onModelReady: (model) => model.getBookCLinic(ssn,widget.clinicId),
    builder: (context, model, child) {

      if(model.spesificBook.patientBooksId!=null){


       String date=model.spesificBook.patientBooksId.dateOfBook;
       _initdDate=DateTime(int.parse(date.substring(0,4)),int.parse(date.substring(5,7)),int.parse(date.substring(8,10)));
       if(first){

         _selectedDate=DateTime(int.parse(date.substring(0,4)),int.parse(date.substring(5,7)),int.parse(date.substring(8,10)));

         first=false;
       }
      print(_selectedDate);
      }

    return   (model.spesificBook==null)?Center(child: CircularProgressIndicator()):ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: CalendarCarousel(

              height: MediaQuery.of(context).size.height-height*.4,
              onDayPressed: (DateTime date, List<Event> events) {
                this.setState(() { _selectedDate = date;});
                events.forEach((event) => print(event.title));
              },
              iconColor: Theme.of(context).primaryColor,
              selectedDateTime:_selectedDate,
              markedDateIconBorderColor: Theme.of(context).primaryColor,
              selectedDayBorderColor: Theme.of(context).primaryColor,
              selectedDayButtonColor: Theme.of(context).primaryColor,
              todayButtonColor: Colors.greenAccent,
              headerTextStyle: TextStyle(color: Colors.black ),
              weekendTextStyle: TextStyle(color: Colors.black),
              weekdayTextStyle: TextStyle(color: Theme.of(context).primaryColor ),
             // firstDayOfWeek: 6,

            ),
          ),
      InkWell(
      onTap: ()async{

        Api _api=Api();
        PatientBooksId book=PatientBooksId();
        PatientBooksId initBook=PatientBooksId();

        book.clinic=widget.clinicId;
        book.student=ssn;
        book.dateOfBook=_selectedDate.toString().split(" ")[0];
        initBook.clinic=widget.clinicId;
        initBook.student=ssn;
        initBook.dateOfBook=_initdDate.toString().split(" ")[0];
        print( book.dateOfBook);
        PatientBooks bookPatient=PatientBooks();
        bookPatient.patientBooksId=initBook;

print("init ${initBook.dateOfBook}");
        await _api.deletePatientBookStudent(bookPatient);
        bookPatient.patientBooksId=book;
print("book ${book.dateOfBook}");
        await _api.postPatientBookStudent(bookPatient);


      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SuccessfullyApply("Successfully \n you reserve for hospital"),));

      },
      child: ButtonAplly('Comfrim reservation')
      )



        ],
      );
    }
      ):CircularProgressIndicator()
    );
  }
}
