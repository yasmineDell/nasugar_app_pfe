import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isOn =false;
  int alarmId=1;
    int alarmId2=2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(11,44,135,1),
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text( 
              "Réglages",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Color.fromRGBO(11,44,135,1),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Compte",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Changer le mot de passe"),
            buildAccountOptionRow(context, "Langue"),
            
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: Color.fromRGBO(11,44,135,1),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
           // buildNotificationOptionRow("Activer les notifications", true),
            Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text("Activer les notifications",
                   style: TextStyle(fontSize: 18,color: Colors.black54 ),),
                   CupertinoSwitch(value: isOn,
                   
                    onChanged: (value)
                    {
                      setState(() {
                         isOn =value;
                       //AndroidAlarmManager.oneShot(Duration(seconds: 5), alarmId, sendNotification);
                     //  AndroidAlarmManager.oneShotAt(DateTime(2021,06,27,15,09), alarmId, sendNotification);
//alarmId=2;
                      

                      });

                      if(isOn==true){
                         AndroidAlarmManager.periodic(
                           Duration(seconds: 5),
                            alarmId, 
                            sendNotification
                            );

                      }else{
                        AndroidAlarmManager.cancel(alarmId);
                      }
                    }
                    )
                ],
            ),
            SizedBox(
              height: 150,
            ),
            Center(
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
                child: Text("Se déconnecter",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

void fireAlarm(){
  print("Alarm Fireed at ${DateTime.now()}");
}
sendNotification() {
      flutterLocalNotificationsPlugin.show(0,
     'Reminder ',
      'veuillez verifier votre taux de glycemie',
       NotificationDetails(
         android:AndroidNotificationDetails(
           channel.id,
           channel.name,
           channel.description,
           importance: Importance.high,
           color: Colors.blue,
           playSound: true,
           icon: '@mipmap/ic_launcher'
         ) )

       );
  

    


  }
