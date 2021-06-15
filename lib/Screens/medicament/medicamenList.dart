import 'package:appf/Screens/Home/navigation_drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class medicamen extends StatefulWidget {
  const medicamen({ Key? key }) : super(key: key);

  @override
  _medicamenState createState() => _medicamenState();
}

class _medicamenState extends State<medicamen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          drawer: NavigationDrawerWidget(),

        appBar: AppBar(centerTitle: true,
         title: Text("Mes Médicaments", textAlign:TextAlign.center,style: TextStyle(fontSize: 17),),
         actions: <Widget>[
            IconButton(
            icon: const Icon(Icons.cancel_outlined),
            tooltip: 'annuler',
            onPressed: () {
            Navigator.pop(context);
          },
          
          )          
          
          ]
          ),
          
          );
      
      
  }
}