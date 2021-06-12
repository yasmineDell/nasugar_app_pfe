import 'package:appf/modules/Glycemie.dart';
import 'package:flutter/material.dart';

class GlycemieTile extends StatelessWidget {
  //const GlycemieTile({ Key? key, this.glycemie }) : super(key: key);


  late final Glycemie glycemie;
  GlycemieTile({required this.glycemie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0,6.0, 20.0, 0.0),
        child: ListTile(
          //leading: CircleAvatar(backgroundColor: Colors.amber,)
          title: Text(glycemie.toString()),
        
        
        ),
      ),
      
      );
  }
}