
import 'package:appf/Screens/Home/ListMedicaments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Medicines {

    String nomMedicament;
    String time;
    String periode;
    String dose;
    String email;
   
    
    
 // Glycemie (){}
  Medicines ( { required this.nomMedicament, required this.time, required this.periode, required this.dose,required this.email,  });
  //final CollectionReference GlycemieCollection = FirebaseFirestore.instance.collection('Glycemie');



  factory Medicines.fromJson(Map<String, dynamic> json, {required String id}){
    return Medicines(
      
      nomMedicament: json['NomMedicament'], 
      time: json['Time'], 
      
      dose: json['dose'],
      periode: json['Period'],
      email: json['email'],
       
    );
  }

  Map<String,dynamic>toMap(Timestamp t){

    return {
      "NomMedicament": nomMedicament,
      "Time": time,
      "Period" : periode,
      "dose" : dose,
      "email" : email,
    

    };
  }



  String toString(){
    return this.time + "  -" + this.nomMedicament.toString() + "  -"+ this.periode + "  -"+ this.dose;
  }
  
  

   
  


  
  
}