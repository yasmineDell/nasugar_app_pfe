
import 'package:appf/Screens/Home/navigation_drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class graphics extends StatefulWidget {
  const graphics({ Key? key }) : super(key: key);

  @override
  _graphicsState createState() => _graphicsState();
}

class _graphicsState extends State<graphics> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          drawer: NavigationDrawerWidget(),

        appBar: AppBar(centerTitle: true,
         title: Text("Graphique", textAlign:TextAlign.center,style: TextStyle(fontSize: 17),),
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