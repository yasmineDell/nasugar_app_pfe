import 'package:cloud_firestore/cloud_firestore.dart';

class Analyse{

  String urlAnalyse;
  String name;
  String email;
  String id;

Analyse({
  required this.urlAnalyse,required this.name, required this.email, required this.id
});

factory Analyse.fromJson(Map<String, dynamic> json,{ required String email}){
    return Analyse(
      
      urlAnalyse: json['urlAnalyse'], 
      name: json['name'], 
      email: json['email'], id: json['id'],
       
    );
  }

Map<String,dynamic>toMap(){

    return {
     "urlAnalyse" : urlAnalyse,
     "name" : name,
      "email":email,
      "id" : id,

    };
  }










}