import 'package:appf/Screens/ListeMedecins/list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class ProfileMed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(



     appBar: AppBar(
        backgroundColor: Color.fromRGBO(65, 106, 190, 1),
      
         
         

            
            
            
         
       leading :IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white.withOpacity(0.5),), onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorsList())); },
          


        
        
      ),

    ),
    body: Container(
        padding: EdgeInsets.only(left: 16, top: 20, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
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
               /*Container(
               height: 70,
                width: 270,
                 decoration: BoxDecoration(

                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),

                          ), 
                child: Column(

                
                  children:[

                    Text(
                      "Nom et prénom",
                      style:TextStyle(color: Colors.grey,fontSize:13),
                         textAlign: TextAlign.start,

                    ),

                    Text(
                      " Dr. Belkacem Mohammed",
                      style:TextStyle(color: Colors.black,fontSize:13),
                      textAlign: TextAlign.start,

                    ),


                  ]
                ),

              ),*/
          

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
                      "Dr. Belkacem Mohammed",
                      style:TextStyle(color: Colors.black,fontSize:13),
                      textAlign: TextAlign.start,

                    ),

                      
                  ]
                ),)

              ),
              SizedBox(
                height: 30,
              ),

              /*Container(
               height: 70,
                width: 270,
                
                 decoration: BoxDecoration(

                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),

                          ), 
                          
                child: 
                Row(
                  
                  
                  children :[
               Column(
                  mainAxisAlignment: MainAxisAlignment.start,

                  
                  children:[

                    Text(

                      "Adresse",
                      style:TextStyle(color: Colors.grey,fontSize:13),
                       textAlign: TextAlign.start,
                       

                    ),

                    Text(
                      " Cité 1000 logements batiment A N°2 Hussin Dey Alger",
                      style:TextStyle(color: Colors.black,fontSize:13),
                      textAlign: TextAlign.start,

                    ),


                  ]
                )]),

              ),*/
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
                      "Cité 1000 logements batiment A N°2 Hussin Dey Alger",
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
                      "05 54 67 87 98",
                      style:TextStyle(color: Colors.black,fontSize:13),
                      textAlign: TextAlign.start,

                    ),

                      
                  ]
                ),)

              ),

              

              //buildTextField("Nom et Prénom", "Mehdaoui Mohammed", false),
             // buildTextField("Date de naissance", "25/08/1967", false),
             // buildTextField("E-mail", "MehMoh25@gmail.com", false),
             // buildTextField("Mot de passe", "********", true),
              
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text("Demander un rendez-vous",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),*/
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
          ),
        ),
      ),
    
    
    
    
    
    
    
    );
  }
  // _fetch() async {
  //   final firebaseUser = await FirebaseAuth.instance.currentUser();
  //   if (firebaseUser != null)
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(firebaseUser.uid)
  //         .get()
  //         .then((ds) {
  //       myEmail = ds.data['emailMed'];
  //       print(myEmail);
  //     }).catchError((e) {
  //       print(e);
  //     });
  // }
}