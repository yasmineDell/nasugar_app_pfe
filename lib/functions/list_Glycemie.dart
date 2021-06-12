import 'package:appf/modules/Glycemie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Glycemie_Tile.dart';
class listGlycemie extends StatefulWidget {
  const listGlycemie({ Key? key }) : super(key: key);

  @override
  _listGlycemieState createState() => _listGlycemieState();
}

class _listGlycemieState extends State<listGlycemie> {
  @override
  Widget build(BuildContext context) {
    final gly = Provider.of<List<Glycemie>>(context);
    
     gly.forEach((element) { 

       print(element.etat);
       print(element.heure);
      print(element.taux);
     });
    // for(var doc in gly.docs){
    //       print(doc.data);
    // }
    return ListView.builder(
      itemCount: gly.length,
      itemBuilder: (context, index){
            return GlycemieTile(
              glycemie: gly[index]);
      },);  }
}