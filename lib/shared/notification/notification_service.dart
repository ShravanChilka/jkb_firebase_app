import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const channelId = "Chat App - Chats";
const channelName = "Chats";

class NotificationService {
  static final plugin = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );
    await plugin.initialize(settings);

    final notificationSettings = await FirebaseMessaging.instance
        .requestPermission(provisional: false);
    print(
      'User granted permission: ${notificationSettings.authorizationStatus}',
    );

    final token = await FirebaseMessaging.instance.getToken();
    print("FCM TOKEN : $token");

    FirebaseMessaging.instance.onTokenRefresh
        .listen((fcmToken) {
          print("FCM TOKEN : $fcmToken");
        })
        .onError((err) {
          // Error getting token.
        });

    FirebaseMessaging.onMessage.listen((event) {
      print("NOTIFICATION : ${event.notification}");
      final notification = event.notification;
      if (notification != null) {
        show(title: notification.title, body: notification.body);
      }
    });
  }

  static void show({String? title, String? body}) async {
    final androidNotification = AndroidNotificationDetails(
      channelId,
      channelName,
      priority: Priority.high,
      importance: Importance.max,
    );

    final notificationDetails = NotificationDetails(
      android: androidNotification,
    );

    plugin.show(1, title, body, notificationDetails);
  }
}
