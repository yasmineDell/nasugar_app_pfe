
//import 'package:login/screens/Authenticate/Login/LoginPage.dart';


import 'package:appf/Provider/google_sign_in.dart';
import 'package:appf/Screens/Authenticate/Login/LoginPage.dart';
import 'package:appf/Screens/Home/ProfileScreen.dart';
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
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(

      debugShowCheckedModeBanner: false,
      
      home:ProfileScreen (),
    );
  }
}






