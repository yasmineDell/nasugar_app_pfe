import 'package:cloud_firestore/cloud_firestore.dart';

class Rdv{

  String date;
  String etat;
  String e_med;
  String e_pat;
  String heure;
  String id;
  Rdv({
    required this.date,required this.etat,required this.e_med,required this.e_pat,required this.heure,required this.id,
  });


  factory Rdv.fromJson(Map<String, dynamic> json,{ required String email}){
    return Rdv(
      
      date: json['date'],
      etat: json['etat'],
      e_med: json['e_med'],
      e_pat: json['e_pat'],
      heure: json['heure'],
      id:json['id'],
      
     
       
    );
  }

Map<String,dynamic>toMap(){

    return {
     "date" :date,
     "etat" :etat,
     "e_med": e_med,
     "e_pat":e_pat,
     "heure": heure,
     "id":id,

    };
  }
}