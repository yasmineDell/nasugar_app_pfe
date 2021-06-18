import 'package:appf/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Statut extends StatefulWidget {
  @override
  _StatutState createState() => _StatutState();
}

class _StatutState extends State<Statut> {
  late User user ;
  AuthService auth = AuthService();
  Future <void> getUser () async
  {
    final userResult = await auth.user;

setState(() {
  user = userResult;
});

  }
  
  @override
  Widget build(BuildContext context) {
    return Container(

      
    );
  }
}