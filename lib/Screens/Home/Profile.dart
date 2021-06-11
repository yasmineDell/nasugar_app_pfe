



import 'package:appf/Screens/Authenticate/Login/LoginPage.dart';
import 'package:appf/Screens/Home/ProfileScreen.dart';
import 'package:appf/Screens/ListeMedecins/list.dart';
import 'package:appf/models/PatientModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../../../../fireBase.dart';
import '../settings.dart';
import 'package:provider/provider.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Patient').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

                    SizedBox(height: 100);
               //*******************liste des medecin *************/
            return Text("hani bedelt hna ");
            
            
            /*
             ListView(
              scrollDirection: Axis.vertical,
             
             
             

               children: 
                {
                
              
             return  Padding(
               
                  padding: const EdgeInsets.all(16.0),
          );}
               )*///);
      }),
      
    );
    
    
     
    
  
}
}


_fetchEmail() async {

   
  }