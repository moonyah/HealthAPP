import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        title: 'Calendar',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Health Calendar'),
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