import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationWidget{
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future init({bool scheduled = false}) async {
    var initAndroidSettings = AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = IOSInitializationSettings();
    final settings = InitializationSettings(android: initAndroidSettings, iOS: ios);
    await _notifications.initialize(settings);
  }

  static Future showNotification({
  var id = 0,
    var title,
    var body,
    var payload
}) async => _notifications.show(id, title, body, await notificationDetails());

  static Future showScheduledDailyNotification({
    var id = 0,
    var title,
    var body,
    var payload,
    required DateTime scheduleTime,

  })
  async => _notifications.zonedSchedule(id, title, body, _scheduledDaily(Time(07,35)), await notificationDetails(), payload:payload,

    androidAllowWhileIdle: true, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time

  );
  static tz.TZDateTime _scheduledDaily(Time time){
    final now = tz.TZDateTime.now(tz.local);
    final scheduledTime = tz.TZDateTime(tz.local, now.year, now.month, now.day, time.hour, time.minute, time.second);
    print('test now time $now');
    print('test scheduled time $scheduledTime' );

    return scheduledTime.isBefore(now)
        ? scheduledTime.add(Duration(days: 1))
        :scheduledTime;
  }

  static Future showScheduledWeeklyNotification({
    var id = 0,
    var title,
    var body,
    var payload,
    required DateTime scheduleTime,

  })
  async => _notifications.zonedSchedule(id, title, body, _scheduledWeekly(Time(07,36),days:[DateTime.tuesday]), await notificationDetails(), payload:payload,

      androidAllowWhileIdle: true, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime

  );
  static tz.TZDateTime _scheduledWeekly(Time time,{required List<int>days}){
  tz.TZDateTime scheduleDate = _scheduledDaily(time);
  while(!days.contains(scheduleDate.weekday)){
    scheduleDate=scheduleDate.add(Duration(days:1));
    print('test schedule date $scheduleDate');

  }
  return scheduleDate;
  }


  static Future showScheduledNotification({
    var id = 0,
    var title,
    var body,
    var payload,
    required DateTime scheduleTime,
  })
  async => _notifications.zonedSchedule(id, title, body, tz.TZDateTime.from(scheduleTime, tz.local), await notificationDetails(), payload:payload,

      androidAllowWhileIdle: true, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);






  static notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id ', 'channel name', importance: Importance.max,

      ),
          iOS: IOSNotificationDetails(

    )
    );
  }
}