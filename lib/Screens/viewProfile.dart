import 'package:appf/Screens/Home/homeScreen.dart';
import 'package:appf/Screens/settings.dart';
import 'package:appf/models/PatientModel.dart';
import 'package:appf/modules/Glycemie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../database.dart';
import '../fireBase.dart';
import 'Home/ProfileScreen.dart';


class viewProfil extends StatefulWidget {
  
  const viewProfil({ Key? key }) : super(key: key);

  @override
  _viewProfilState createState() => _viewProfilState();
}

class _viewProfilState extends State<viewProfil> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  PatientModel p =PatientModel(uid: '', name: '', dateNais: '', numTel: '', email: '', photoUrl: 0,typeDiab: '',poids: '');
  late PatientModel pat;
  final user = FirebaseAuth.instance.currentUser;
      var nn = List<PatientModel>.empty();
FixedExtentScrollController fixedExtentScrollController =
    new FixedExtentScrollController();
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  StreamProvider<List<PatientModel>>.value(
  catchError: (_, __) => nn,
      
      value: DatabaseService().pat, 
     // initialData: null,
       initialData:  nn,
       child:  
    
      
    
     Scaffold(
           appBar: AppBar(centerTitle: true,
         title: Text("Profile", textAlign:TextAlign.center,style: TextStyle(fontSize: 15),),
         actions: <Widget>[
            IconButton(
            icon: const Icon(Icons.cancel_outlined),
            tooltip: 'annuler',
            onPressed: () {
            Navigator.pop(context);
          },)]
      ),
        body: 
        StreamBuilder(    
     

        stream: FirebaseFirestore.instance.collection('Patient').where('Email',isEqualTo: user!.email).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
  
         return ListView(
           children: 
            snapshot.data!.docs.map((document)
           {  
             
             return Padding(
             padding: const EdgeInsets.only(top: 8.0),
             child: GestureDetector(

            onTap: () { 
              if (user != null) {
              //  String? name = user!.displayName;
              //  String? email = user!.email;
              //  print(name);
              //  print(''+email!);

                   }
                  },
  child: (document['Email'] == user!.email.toString())
                ?
                
                Container(
                     margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
                    
                 // width: MediaQuery.of(context).size.width/1.2,
                 // height: MediaQuery.of(context).size.height/6,
                  child: Column(children : <Widget> [
                    Container(height:150,
                    
                   
                    child: Center(   child:  CircleAvatar(radius: 50,  child: Icon(Icons.person, color: Colors.white, size:50),
                    backgroundColor:// Color.fromRGBO(37,136,166,1),
                     Color.fromRGBO(11,44,135,1),
                     
                     


),),
                    
                    ),
                    Container(
                      height: 50,
                      width: 350,

                    //  decoration: BoxDecoration( color: Colors.grey.withOpacity(0.1),  borderRadius: BorderRadius.circular(24.0)),
                        
                      
                          child: Padding(padding: EdgeInsets.all(10.0),
                          child: 
                          
                           Row(
                            children :<Widget>[
                         // Icon(Icons.person),
                          
                           Text( " Nom  et prénom :   "
                         ,
                         style:TextStyle(fontSize: 14.5,color: Colors.grey.withOpacity(0.8)) ,
                         ), 
                         Text( document['Name']
                         ,
                         style:TextStyle(fontSize: 14.5) ,
                         ), 
                          
                          
                             ]) )
                       

                          
                          ),

                        SizedBox(height : 5),
                            const Divider(
                               height: 5,
                               thickness: 1,
                                 indent: 20,
                                  endIndent: 20,
                              ),
                              SizedBox(height : 10),

                            Container(
                                height: 50,
                                width: 350,
                  // decoration: BoxDecoration( color: Colors.grey.withOpacity(0.1),  borderRadius: BorderRadius.circular(24.0)),
                               child: Padding(padding: EdgeInsets.all(10.0),
                         
                            
                          child: 
                           Row(
                            children :<Widget>[
                         Text("Date de naissance:     "
                         ,
                         style:TextStyle(fontSize: 14.5, color: Colors.grey.withOpacity(0.8) ),
                         ),
                         Text(document['DateNais']
                         ,
                         style:TextStyle(fontSize: 14.5) ,
                         ),

                          
                             ]) ),),

  SizedBox(height : 5),
                            const Divider(
                               height: 5,
                               thickness: 1,
                                 indent: 20,
                                  endIndent: 20,
                              ),
                              SizedBox(height : 10),

                            Container(
                              
                      height: 50,
                      width: 350,
     //   decoration: BoxDecoration( color: Colors.grey.withOpacity(0.1),  borderRadius: BorderRadius.circular(24.0)),
                       child: Padding(padding: EdgeInsets.all(10.0),
                          
                          child:  Row(
                            children :<Widget>[
                          
                         Text("Numero de Tel  :     "
                         ,
                         style:TextStyle(fontSize: 14.5, color: Colors.grey.withOpacity(0.8) ) ,
                         ),
                          Text(document['NumTel']
                         ,
                         style:TextStyle(fontSize: 14.5 ) ,
                         ),
                            ])
                          
                          ),),


  SizedBox(height : 5),
                            const Divider(
                               height: 5,
                               thickness: 1,
                                 indent: 20,
                                  endIndent: 20,
                              ),
                              SizedBox(height : 10),

                            Container(
                              height: 50,
                      width: 350,
                   // decoration: BoxDecoration( color: Colors.grey.withOpacity(0.1),  borderRadius: BorderRadius.circular(24.0)),
                       child: Padding(padding: EdgeInsets.all(10.0),
                          child: 
                          Row(
                            children :<Widget>[
                          
                         Text("Email :    "
                         ,
                         style:TextStyle(fontSize: 14.5, color: Colors.grey.withOpacity(0.8) ) ,
                         ),
  
                         Text(document['Email']
                         ,
                         style:TextStyle(fontSize: 14.5) ,
                         ),

                            ])
                          
                          ),),

                         SizedBox(height : 5),
                            const Divider(
                               height: 5,
                               thickness: 1,
                                 indent: 20,
                                  endIndent: 20,
                              ),
                              SizedBox(height : 10),

                            Container(
                              height: 50,
                      width: 350,
                  //  decoration: BoxDecoration( color: Colors.grey.withOpacity(0.1),  borderRadius: BorderRadius.circular(24.0)),
                       child: Padding(padding: EdgeInsets.all(10.0),
                          child: 
                          Row(
                            children :<Widget>[
                            Text("Type de diabète :  "
                         ,
                         style:TextStyle(fontSize: 14.5 , color: Colors.grey.withOpacity(0.8) ) ,
                         ),
                           
                    SizedBox(width:17),

                          Text( "Type-1"
                         ,
                         style:TextStyle(fontSize: 14.5) ,
                         ),

                        


                            ]
                          )
                         
                          
                         

                          
                          ),),

                    SizedBox(height : 5),
                            const Divider(
                               height: 5,
                               thickness: 1,
                                 indent: 20,
                                  endIndent: 20,
                              ),
                              SizedBox(height : 10),

                            Container(
                              height: 50,
                      width: 350,
                    //decoration: BoxDecoration( color: Colors.grey.withOpacity(0.1),  borderRadius: BorderRadius.circular(24.0)),
                       child: Padding(padding: EdgeInsets.all(10.0),
                          child: 
                          Row(
                            children :<Widget>[
                          
                         Text("Poids:    "
                         ,
                         style:TextStyle(fontSize: 14.5, color: Colors.grey.withOpacity(0.8) ) ,
                         ),

                             Text(" 85 Kg"
                         ,
                         style:TextStyle(fontSize: 14.5) ,
                         ),
                          
                            ])),),

                      SizedBox(height : 5),
                            const Divider(
                               height: 5,
                               thickness: 1,
                                 indent: 20,
                                  endIndent: 20,
                              ),
                              SizedBox(height : 10),

                         



                  ]) 

                //  )
                
                    
                  
                  )

                  : SizedBox(height:0.1),
                  
             
             ),

      
    
    

             );}).toList(),);
        }
  
            )

            
            )  


            
            
             );
}


}
  
  



