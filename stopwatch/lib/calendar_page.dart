import 'package:flutter/material.dart';
import 'package:stopwatch/main.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class CalendarPage extends StatefulWidget {
  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => CalendarPage(),
      ),
    );
  }

  @override
  _State createState() => _State();
}

class _State extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
      title: 'Calendar',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Health Calendar'),
          leading:
            new IconButton(
                icon: new Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }
            )

        ),
        body: Center(
          child: StartPage(),
        ),//create new widget class for this 'home' to
      ),
    );
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCalendar(
          view: CalendarView.month,
          firstDayOfWeek: 1, // 첫 요일
          dataSource: HealthDataSource(_getDataSource()),
          monthViewSettings: MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        )
    );
  }
  List<Health> _getDataSource() {
    final List<Health> meetings = <Health>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
    DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
        Health('START', startTime, endTime, const Color(0xFF85AECA), false));
    return meetings;
  }
}

class HealthDataSource extends CalendarDataSource {
  HealthDataSource(List<Health> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Health {
  Health(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}