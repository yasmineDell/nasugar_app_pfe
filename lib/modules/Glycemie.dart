

import 'package:cloud_firestore/cloud_firestore.dart';

class Glycemie {

    String etat;
    String heure;
    String note;
    double taux;
    String uid;
    String id;
    String email;
    
    
 // Glycemie (){}
  Glycemie ( { required this.etat, required this.heure, required this.note, required this.taux, required this.uid, required this.id, required this.email});
  //final CollectionReference GlycemieCollection = FirebaseFirestore.instance.collection('Glycemie');


  factory Glycemie.fromJson(Map<String, dynamic> json, {required String id}){
    return Glycemie(
      
      etat: json['etat'], 
      heure: json['heure'], 
      id: id,
      note: json['note'],
      taux: json['taux'],
      uid: json['uid'], email: json['email'],
       
    );
  }

  Map<String,dynamic>toMap(Timestamp t){

    return {
      "etat": etat,
      "heure": heure,
      "note" : note,
      "taux" : taux,
      "date" : t,
      "uid": uid,
      "id":id,
      "email":email,

    };
  }



  String toString(){
    return this.heure + "  -" + this.taux.toString() + "  -"+ this.etat;
  }
  
  void showGly(String etat, String heure, String note, double taux, ){

  }

   
  


  
  
}