
//import 'package:login/screens/Authenticate/Login/LoginPage.dart';


import 'package:appf/Provider/google_sign_in.dart';
import 'package:appf/Screens/Authenticate/Login/LoginPage.dart';
import 'package:appf/Screens/Home/ProfileScreen.dart';
import 'package:appf/Screens/Home/homeScreen.dart';
import 'package:appf/step.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/change_notifier_provider.dart';

 Future <void> main( )async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());} 

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
      
      home: LoginPage(), //HomeScreen(),
    );
  }
}






