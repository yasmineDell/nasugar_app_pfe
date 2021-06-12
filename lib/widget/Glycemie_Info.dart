import 'package:appf/modules/Glycemie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GlyInfo extends StatefulWidget {
  const GlyInfo({ Key? key }) : super(key: key);

  @override
  _GlyInfoState createState() => _GlyInfoState();
}

class _GlyInfoState extends State<GlyInfo> {


  late Glycemie gly ;
  Glycemie getGlycemie(String etat, String heure, String note,double taux,Timestamp t){
    Glycemie g = new Glycemie(etat: etat, heure: heure, note: note, taux: taux);
    return g;
  }  

 // gly=getGlycemie(etat, heure, note, taux, t);
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}