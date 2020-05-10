import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:gradution_app/UI/Widgets/ButtonApply.dart';



class CalenderPage extends StatefulWidget {
  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {


  DateTime _currentDate2 = DateTime.now();

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

      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: CalendarCarousel(

              height: MediaQuery.of(context).size.height-height*.4,
              onDayPressed: (DateTime date, List<Event> events) {
                this.setState(() => _currentDate2 = date);
                events.forEach((event) => print(event.title));
              },
              iconColor: Theme.of(context).primaryColor,
              selectedDateTime: _currentDate2,
              markedDateIconBorderColor: Theme.of(context).primaryColor,
              selectedDayBorderColor: Theme.of(context).primaryColor,
              selectedDayButtonColor: Theme.of(context).primaryColor,
              todayButtonColor: Colors.greenAccent,
              headerTextStyle: TextStyle(color: Colors.black ),
              weekendTextStyle: TextStyle(color: Colors.black),
              weekdayTextStyle: TextStyle(color: Theme.of(context).primaryColor ),
              firstDayOfWeek: 6,

            ),
          ),
          ButtonAplly('Comfrim reservation','you reserve for hospital')



        ],
      )

    );
  }
}
