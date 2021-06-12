import 'package:appf/Screens/Home/navigation_drawer_widget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class infoGly extends StatefulWidget {
  const infoGly({ Key? key }) : super(key: key);

  @override
  _infoGlyState createState() => _infoGlyState();
}

class _infoGlyState extends State<infoGly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          drawer: NavigationDrawerWidget(),

        appBar: AppBar(centerTitle: true,
         title: Text("Informations", textAlign:TextAlign.center,style: TextStyle(fontSize: 19),),
         actions: <Widget>[
            IconButton(
            icon: const Icon(Icons.cancel_outlined),
            tooltip: 'annuler',
            onPressed: () {
            Navigator.pop(context);
          },)]
      ),
   
   body: ElevatedButton(
            style: 
            ElevatedButton.styleFrom(
              primary: //Color(0xFF3ABD6F),
              // Color.fromRGBO(37,136,166,1),
              // // set the background color 
              Color.fromRGBO(245, 140,120,0.8),
                //Color.fromRGBO(223,178,164,1),

              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
              child: Text(
              'Valider',
            style: TextStyle(fontSize: 23)),

            onPressed: () {
         
              
            

             
                 
                
                        
        
                }

              
           
            
              

            /* async{

               await showDialog<void>(
                context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Merci!'),
                  content: Text(
                      'Données bien saisit.'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('OK'),

                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                       builder: (context) => MainPage(),
                        ));

                      },
                    ),
                  ],
                  );


              }

               );
            }*/
            
             
            ),
   
    );
    
    }
}