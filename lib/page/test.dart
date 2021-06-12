import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';


String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}


class SecondRoute extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouvelle donnée"),
        centerTitle: true,
      actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save_outlined),
            tooltip: 'Show Snackbar',
            onPressed: () {
            Navigator.pop(context);
          },)]
      ),
     
    );
  }
}

class Test extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar: AppBar(
        //   title: Text('Graphiques'),
        //   centerTitle: true,
        //   backgroundColor:Color.fromRGBO( 17,190,121,1),
        // ),
        appBar: AppBar(centerTitle: true,
         title: Text("Nouvelle donnée"),
      actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save_outlined),
            tooltip: 'Show Snackbar',
            onPressed: () {
            Navigator.pop(context);
          },)]
      ),



     body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('data').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
  
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Container(
                child: Center(child: Text(document['text'])),
              );
            }).toList(),
          );
        },
      ),
    );


      
}



