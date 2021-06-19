import 'package:cloud_firestore/cloud_firestore.dart';

class Analyse{

  String urlAnalyse;
  String name;
  String email;


Analyse({
  required this.urlAnalyse,required this.name, required this.email
});

factory Analyse.fromJson(Map<String, dynamic> json,{ required String email}){
    return Analyse(
      
      urlAnalyse: json['urlAnalyse'], 
      name: json['name'], 
      email: json['email'],
       
    );
  }

Map<String,dynamic>toMap(){

    return {
     "urlAnalyse" : urlAnalyse,
     "name" : name,
      "email":email,

    };
  }










}