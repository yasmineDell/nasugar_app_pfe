

import 'package:appf/Screens/Home/homeScreen.dart';
import 'package:appf/Screens/Home/homeWidget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'ProfileMed.dart';


class DoctorsList extends StatefulWidget {
  
  @override
  _DoctorsListState createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  late final String emaildoc;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color.fromRGBO(19, 36, 64, 1), //Color.fromRGBO(11,44,135,1),
        centerTitle: true,
        title:SizedBox(
         // height: kToolbarHeight,
          child: //Center(

            Text("Listes des Médecins", textAlign:TextAlign.center,style: TextStyle(fontSize: 19),),

        //     child:Padding(

        //     padding: const EdgeInsets.all(16.0),
        //  child: Column(children: [Container(
        //                   width : 200,
        //                   height: 22,
        //                   decoration: BoxDecoration(

        //                     color: Colors.white,
        //                     borderRadius: BorderRadius.circular(15),

        //                   ),
        //                   child: TextField(
        //                     decoration: InputDecoration(
        //                       enabledBorder: InputBorder.none,
        //                       focusedBorder: InputBorder.none,
        //                       //hintText: "Recherche",
        //                       prefixIcon: Icon(Icons.search, size: 15,),



        //                     ),


        //                   ),

        //                 ),
        //   ),  ],
             //           ),
                    //    ),
      //    ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white.withOpacity(0.7),),
          
           onPressed: () {
  Navigator.of(context).push(MaterialPageRoute(  
                  builder: (context)=> HomeScreen(),)); 


             },
          


        ),
        
      ),
    
      
       body:   StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Diabtologue').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

                    SizedBox(height: 100);
               //*******************liste des medecin *************/
            return ListView(
              scrollDirection: Axis.vertical,
             
             
             

               children: snapshot.data!.docs.map((document) {
                 
                
              
             return  Padding(
               
                  padding: const EdgeInsets.only(top: 5.0),
                  
                  child: Container(
                     child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(

                      
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //SizedBox(height: 100),
                       
                        Container(  // le container contenant les info du premier medecin
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child:     Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Dr. "+document['Nom'],
            style: TextStyle(color: Color.fromRGBO(223,178,164,1), fontSize: 22.0,fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(child: Text("Adresse "+document['Adresse'], 
                   style: TextStyle(color: Colors.black54, fontSize: 14.0,),
                             ),
                    ),
                  
                    
                 
                ],)),
        ),
        Container(child: Text("Numéro de Tel : "+document['NumTel'],
          style: TextStyle(color: Colors.black54, fontSize: 16.0),)),


           Container(child: Text("E-mail: "+ document['emailMed'],
          style: TextStyle(color: Colors.black54, fontSize: 16.0,),)),
      ],
      
    )
                            
                            
                            //myDetailsContainer1(),
                          ),
                        ),

                        Container(
                          width: 150,
                          height: 150,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(20.0),
                             child:Row(children: [

                               
                               //Image(
                          //   fit: BoxFit.contain,
                          //    alignment: Alignment.topRight,
                          //  image: AssetImage("assets/Dr1.jpg"),
                          // ),
                                                   SizedBox(width:60),
                          GestureDetector( 
                            onTap:(){
                             // emaildoc=document['emailMed'];
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileMed()));
                             },
                      child:
                     
                          Container ( padding: const EdgeInsets.only(left: 10.0),
                          child:
                                Icon(Icons.arrow_forward_ios_outlined, color: Colors.black54,),

                          ),

          //                   child: IconButton(
          // icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black.withOpacity(0.5),size: 2,), onPressed: () { 
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileMed())); },
          // ) 
                          ),
                    
                             
                          
                                       
            
                             ],

        ),
                        ),               
                        )],
                      )
                
                ,)
              ),





                   /* width: MediaQuery.of(context).size.width / 1.2,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 5,),
                          child: Text(document['Nom'],
                             ),
                        ),
                      
                      ],
                    ),*/
                  
                )
                ,);
              }).toList(),
            );
          }),
      
    );
  }
}
 