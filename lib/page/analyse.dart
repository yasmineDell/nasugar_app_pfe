import 'package:appf/Screens/Home/navigation_drawer_widget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mailer/smtp_server/gmail.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '../database.dart';
import 'package:mailer/mailer.dart';
import 'package:toast/toast.dart';
//import 'crediantial.dart';

class Analyses extends StatefulWidget {
  const Analyses({ Key? key }) : super(key: key);

  @override
  _AnalysesState createState() => _AnalysesState();
}

class _AnalysesState extends State<Analyses> {

  sendmail() async{
    String username = "hanetest66@gmail.com";
    String password = "rayaneyasmine123";

    final smtpServer = gmail(username,password);
    //creat gmail server

    // emial msg
    final message = Message()
    ..from = Address(username)
    ..recipients.add('rayanewiza2@gmail.com')
    ..subject = "flutter send mail : ${DateTime.now()}"
    ..html = "<h3> Thanks for connecting with us! </h3>\n<p></p>";

    try{

      final sendReport = await send(message,smtpServer);
      showToast("Message send check your email", duration: 3, garvity: Toast.CENTER);
      print('Message send: '+sendReport.toString());
    } on MailerException catch (e){
      print('Message non envoyer..\n'+ e.toString());
    }
  
  }


  @override
  Widget build(BuildContext context) {
     void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          
        );
      });
    }
    return  Scaffold(
          drawer: NavigationDrawerWidget(),

        appBar: AppBar(centerTitle: true,
         title: Text("Analyse", textAlign:TextAlign.center,style: TextStyle(fontSize: 17),),
         actions: <Widget>[
            IconButton(
            icon: const Icon(Icons.cancel_outlined),
            tooltip: 'annuler',
            onPressed: () {
            //Navigator.pop(context);
            _showSettingsPanel();
          },
          )
          ]
        ),

        body: Center(
          
          child: MaterialButton(
            
            color: Colors.deepPurpleAccent,
            child: Text('Envoyer mail', style: TextStyle(color: Colors.white),),
            onPressed: (){
              sendmail();

          })
        ,)
    );
      
  }

  showToast(String msg, {required int duration, required int garvity}){
      showToast(msg, duration: duration, garvity: garvity);
  }
}
