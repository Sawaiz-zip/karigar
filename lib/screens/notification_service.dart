import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:karigar/controllers/location_controller.dart';
import 'package:timezone/timezone.dart' as tz;

final locationController = Get.find<LocationController>();

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();
  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
            "@drawable/ic_flutter_location_notification_icon");

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(
      int id, String title, String body, int seconds) async {
    print("Local Notification");
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.now(tz.getLocation('Topi/Pakistan'))
            .add(Duration(seconds: seconds)),
        const NotificationDetails(
            android: AndroidNotificationDetails('main_channel', 'Main Channel',
                importance: Importance.max,
                priority: Priority.max,
                icon: "@drawable/ic_flutter_location_notification_icon"),
            iOS: IOSNotificationDetails(
                sound: 'default.wav',
                presentAlert: true,
                presentBadge: true,
                presentSound: true)),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
    print("Local Notification");
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
