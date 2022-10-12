import 'package:flutter/material.dart';
import 'package:transport_expense_tracker/widgets/notification_widget.dart';
import 'package:timezone/data/latest.dart' as tz;


class NotificationsPage extends StatefulWidget {
  static String routeName = '/notification';

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();

}

class _NotificationsPageState extends State<NotificationsPage> {

  @override
  void initState(){
    // super.initState();
    NotificationWidget.init();
    tz.initializeTimeZones();


  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Column(
        children: [

Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    // InkWell(
    //   onTap: (){
    //     NotificationWidget.showNotification(title: 'Notification', body: 'hello');
    //   },
    //   child:Container(
    //     padding: const EdgeInsets.all(12.0),
    //     decoration: BoxDecoration(
    //       color: Colors.lightBlue,
    //       borderRadius: BorderRadius.circular(8.0),
    //     ),
    //     child: const Text('Send Notification'),
    //   ),
    //
    // ),
    InkWell(
      onTap: (){
        NotificationWidget.showScheduledDailyNotification(
          title: 'Scheduled Notification',
              body: 'This is a daily notification',
          scheduleTime: DateTime.now().add(Duration(seconds: 5))
        );
      },
      child:Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text('Daily'),
      ),

    ),
    InkWell(
      onTap: (){
        NotificationWidget.showScheduledWeeklyNotification(
            title: 'Weekly',
            body: 'This is a weekly notification',
            scheduleTime: DateTime.now().add(Duration(seconds: 5))
        );
      },
      child:Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text('Schedule Weekly Notification'),
      ),

    ),
    // InkWell(
    //   onTap: (){
    //     NotificationWidget.showScheduledNotification(
    //         title: 'Weekly Notification',
    //         body: 'hello2',
    //         scheduleTime: DateTime.now().add(Duration(seconds: 5))
    //     );
    //   },
    //   child:Container(
    //     padding: const EdgeInsets.all(12.0),
    //     decoration: BoxDecoration(
    //       color: Colors.lightBlue,
    //       borderRadius: BorderRadius.circular(8.0),
    //     ),
    //     child: const Text('Schedule Notification'),
    //   ),
    //
    // )

  ],
)


        ],
      ),
    );

  }
}
