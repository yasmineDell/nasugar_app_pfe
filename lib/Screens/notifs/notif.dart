// import 'package:rxdart/rxdart.dart';
// import 'package:flutter/material.dart';
// import 'dart:io' show Platform;
// import 'package:rxdart/subjects.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class LocalNotiyManager{
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//    var initSetting;
// BehaviorSubject<ReciveNotif> get DidReceiveLocalNotificationPlugin => 
//     BehaviorSubject<ReciveNotif>();

//   LocalNotiyManager.init(){
//         flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//     initializePlatform();
//   }
//    initializePlatform() {
//     var initSettingAndroid = AndroidInitializationSettings('100.png');

//     initSetting = InitializationSettings(android: initSettingAndroid);
//   }

//  setOnNotificationReceive(Function onNotificationReceive) {
//     DidReceiveLocalNotificationSubject.listen((notification) {
//       onNotificationReceive(notification);
//     });
//   }

//     setOnNotificationClick(Function onNotificationClick) async {
//     await flutterLocalNotificationsPlugin.initialize(initSetting,
//         onSelectNotification: (String payload) async {
//       onNotificationClick(payload);
//     });
//   }

//     Future<void> scheduleNotification(DateTime scheduleNotificationDateTime, String title, String body, int id, String payload) async {
//     var androidChannel = AndroidNotificationDetails(
//         'CHANNEL_ID', 'CHANNEL_NAME', 'CHANNEL_DESCRIPTION',
//         importance: Importance.max, priority: Priority.high, playSound: true);

//    // var iosChannel = IOSNotificationDetails();
//     var platformChannel = NotificationDetails(android: androidChannel);
//     await flutterLocalNotificationsPlugin.schedule(
//         id, title, body, scheduleNotificationDateTime, platformChannel,
//         payload: payload);
//   }

 
// }

// LocalNotiyManager localNotifiyManager = LocalNotiyManager.init();


// class ReciveNotif{

//   late final int id;
//   late final String title;
//   late final  String body;
//   late final String  playload;

//   ReciveNotif({
//     required this.id, required this.title, required this.body, required this.playload
//   });
  
// }