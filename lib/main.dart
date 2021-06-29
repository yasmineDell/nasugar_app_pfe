
//import 'package:login/screens/Authenticate/Login/LoginPage.dart';


import 'package:appf/Screens/Authenticate/Login/LoginPage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}


 Future <void> main( )async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

 await AndroidAlarmManager.initialize();

  runApp(MyApp());
  
  } 

class MyApp extends StatelessWidget{
  static Color lightBackground = Color(0xfffcfcff);
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        theme: ThemeData(
         fontFamily: 'Circular',
         
        // primaryColor: Color.fromRGBO(	65,106,190,1),),
         primaryColor: // Color.fromRGBO(37,136,166,1), vert
         Color.fromRGBO(11,44,135,1),
         //Color(0xFF3B72FF),
         scaffoldBackgroundColor: lightBackground,
         backgroundColor: lightBackground,


       ),

      debugShowCheckedModeBanner: false,
      
      home:LoginPage(), //HomeScreen(),
    );
  }
}



