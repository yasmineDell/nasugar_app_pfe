
import 'package:appf/Screens/ListeMedecins/list.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:listmed/list.dart';
// import 'package:firebase_storage/firebase_storage.dart';


class VideoScreen extends StatefulWidget {
  VideoScreen();

  @override
  VideoScreenState createState() => VideoScreenState();
}

class VideoScreenState extends State<VideoScreen> {
  VideoScreenState();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        backgroundColor: Color.fromRGBO(65, 106, 190, 1),
      
         
         

            
            
            
         
       leading :IconButton(
          icon: Icon(Icons.arrow_back,
          color: Colors.white.withOpacity(0.5),),
           onPressed: () { Navigator.push(context,
            MaterialPageRoute(builder: (context) => DoctorsList())); },
          


        
        
      ),

    ),




      floatingActionButton: null,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Diabtologue').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((document) {
                

              
               

                return ListView(
            children: [
             
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/Dr1.jpg"))),
                    ),
                  
                  ],
                ),
              ),
              SizedBox(
                
                height: 70,
              ),
               
          

               Container(
            
                height: 70,
                width: 250,
                 decoration: BoxDecoration(

                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),

                          ),  

                       child:   Padding(padding:const EdgeInsets.all(15.0),
                child: Column(

                    
                  children:[
                  
                     

                    Text(
                      
                      
                      " Nom et prénom",
                      style:TextStyle(color: Colors.grey,fontSize:13),
                     textAlign: TextAlign.start,

                    ),

                    Text(
                      "Dr. "+document['Nom'],
                      style:TextStyle(color: Colors.black,fontSize:13),
                      textAlign: TextAlign.start,

                    ),

                      
                  ]
                ),)

              ),
              SizedBox(
                height: 30,
              ),

             
               Container(
            
                height: 70,
                width: 250,
                 decoration: BoxDecoration(

                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),

                          ),  

                       child:   Padding(padding:const EdgeInsets.all(15.0),
                child: Column(

                    
                  children:[
                  
                     

                    Text(
                      
                      
                      "Adresse ",
                      style:TextStyle(color: Colors.grey,fontSize:13),
                     textAlign: TextAlign.start,

                    ),

                    Text(
                      document['Adresse'],
                      style:TextStyle(color: Colors.black,fontSize:13),
                      textAlign: TextAlign.start,

                    ),

                      
                  ]
                ),)

              ),

           SizedBox(
                height: 30,
              ),
              Container(
            
                height: 70,
                width: 250,
                 decoration: BoxDecoration(

                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),

                          ),  

                       child:   Padding(padding:const EdgeInsets.all(15.0),
                child: Column(

                    
                  children:[
                  
                     

                    Text(
                      
                      
                      "Numero de Tel ",
                      style:TextStyle(color: Colors.grey,fontSize:13),
                     textAlign: TextAlign.start,

                    ),

                    Text(
                      document['NumTel'],
                      style:TextStyle(color: Colors.black,fontSize:13),
                      textAlign: TextAlign.start,

                    ),

                      
                  ]
                ),)

              ),
                Container(
            
                height: 70,
                width: 250,
                 decoration: BoxDecoration(

                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),

                          ),  

                       child:   Padding(padding:const EdgeInsets.all(15.0),
                child: Column(

                    
                  children:[
                  
                     

                    Text(
                      
                      
                      "E-mail",
                      style:TextStyle(color: Colors.grey,fontSize:13),
                     textAlign: TextAlign.start,

                    ),

                    Text(
                      document['emailMed'],
                      style:TextStyle(color: Colors.black,fontSize:13),
                      textAlign: TextAlign.start,

                    ),

                      
                  ]
                ),)

              ),

              

              
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
                  RaisedButton(
                    onPressed: () {},
                    color:Color.fromRGBO(65, 106, 190, 1),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    
                    shape: RoundedRectangleBorder(
                      
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Demander un rendez-vous",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          );
              }).toList(),
            );
          }),
    );
  }
}
