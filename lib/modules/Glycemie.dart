

import 'package:cloud_firestore/cloud_firestore.dart';

class Glycemie {

    String etat;
    String heure;
    String note;
    double taux;
    
    
 // Glycemie (){}
  Glycemie ( { required this.etat, required this.heure, required this.note, required this.taux});
  //final CollectionReference GlycemieCollection = FirebaseFirestore.instance.collection('Glycemie');

  Map<String,dynamic>toMap(Timestamp t){

    return {
      "etat": etat,
      "heure": heure,
      "note" : note,
      "taux" : taux,
      "date" : t,

    };
  }


  String toString(){
    return this.heure + "  -" + this.taux.toString() + "  -"+ this.etat;
  }
  
  void showGly(String etat, String heure, String note, double taux, ){

  }

   
  


  
  
}