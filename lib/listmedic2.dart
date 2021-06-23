
import 'package:appf/Screens/Home/homeScreen.dart';
import 'package:appf/Screens/Home/homeWidget.dart';
import 'package:appf/Screens/ListeMedecins/ProfileMed.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



import 'package:appf/Screens/Home/navigation_drawer_widget.dart';
import 'package:appf/modules/Glycemie.dart';
import 'package:appf/urils/constant.dart';
import 'package:appf/urils/loading.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';



class ListeMedicamentH extends StatefulWidget {
  @override
  _ListeMedicmentHState createState() => _ListeMedicmentHState();
}

class _ListeMedicmentHState extends State<ListeMedicamentH> {
    final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,
         title: Text(" Médicaments ", textAlign:TextAlign.center,style: TextStyle(fontSize: 15),),
         actions: <Widget>[
            IconButton(
            icon: const Icon(Icons.cancel_outlined),
            tooltip: 'annuler',
            onPressed: () {
            Navigator.pop(context);
          },)]
      ),
    
      
       body:   StreamBuilder(
         
          stream: FirebaseFirestore.instance.collection('Medicaments').where('email',isEqualTo: user!.email).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

              
               //*******************liste des medecin *************/
            return
             ListView(
              scrollDirection: Axis.horizontal,
             
             
             

               children: snapshot.data!.docs.map((document) {
                
              
             return Padding(
               
                  padding: const EdgeInsets.only( top:250, left: 20, bottom: 250), //nzid left w right
                   //padding: const EdgeInsets.all(10.0),
                  
                  child:   Container(
                     
                    
                      
                     
                    child:SizedBox(
                      height: 100,
                     //width: 200,
                    
                                      
                
                   child: Material(
                    color: Colors.white,
                    elevation: 4.0,
                    
                    borderRadius: BorderRadius.circular(15.0),
                    shadowColor: Color(0x802196F3),
                    child:
                       
                       Row(
                          // le container contenant les info du premier medecin
                     mainAxisAlignment: MainAxisAlignment.start,
                    
                            children:[ 
                            

                                       
                    Container(
                       width: 50,
                       height: 50,
                      decoration: BoxDecoration(
                        
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.white.withOpacity(0.1),
                                //offset: Offset(0, 10)
                                )
                          ],
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/pill.png"))),
                    ),

                SizedBox(width: 50,
                ),
                
                        Container(
                          
                          // margin: EdgeInsets.symmetric(horizontal :20.0),
                          
                            // le container contenant les info du premier medecin
                          child:  Column (
                            children: [
                               SizedBox(width: 30,
                height: 30,),
     
                          Container(
          
          
          
               child: Text(document['NomMedicament'],
            style: TextStyle(color: Color.fromRGBO(65, 106, 190, 1), fontSize: 20.0,),),),
        
    
       
        
          Container(
              
              child:Text("Dose : "+document['dose'],
                   style: TextStyle(color: Colors.black54, fontSize: 16.0,), ),
                
          ),
                   
                
           Container(
             
             
             child:
       Text("Heure : "+document['Time'] +"  heures"
       ,
          style: TextStyle(color: Colors.black54, fontSize: 15.0),),),       
               

           Container(


            child :Text("Periode : "+ document['Period'],
          style: TextStyle(color: Colors.black54, fontSize: 12.0,),)),

        ],)
        
        
        

      
                            
                            
                        
                         ),


                          SizedBox(width: 50,
                height: 50,),
                         ] ),
                        )),

           
              
                
              ),





                  
                
              );
              }).toList(),
            );
          }),
      
    );
  }
}
 