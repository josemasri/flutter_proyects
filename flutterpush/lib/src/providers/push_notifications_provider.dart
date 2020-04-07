import 'package:firebase_messaging/firebase_messaging.dart';

// elQ8HiRZMfo:APA91bF6woit2y1I6SqHYhcidBo2DFH6dNkRgbd09xdsIqAV5JOg4KN2EKvR9MuQnb1tpxx9SSHhl-_TXQFpuj4-G7z0w_-DKjfRfYF3rK6F2uCJqAYyB4bjXTYM2PD58F_fg5L_HvHe
class PushNotificationProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
      print(data);
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
      print(notification);
    }

    // Or do other work.
  }

  initNotofications() async {
    await _firebaseMessaging.requestNotificationPermissions();
    final token = await _firebaseMessaging.getToken();
    print(token);

    _firebaseMessaging.configure(
      onMessage: (info) async {
        print('======== On Message=================');
        print(info);
      },
      onLaunch: (info) async {
        print('======== On Launch=================');
        print(info);
      },
      onResume: (info) async {
        print('======== On Resume=================');
        print(info);
      },
      onBackgroundMessage: myBackgroundMessageHandler,
    );
  }
}
