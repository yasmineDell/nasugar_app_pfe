import 'package:appf/Screens/ListeMedecins/list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class ProfileMed extends StatelessWidget {


  final TextEditingController _message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(



         appBar: AppBar(
        backgroundColor: Color.fromRGBO(19, 36, 64, 1), //Color.fromRGBO(11,44,135,1),
        centerTitle: true,
        title:SizedBox(
         // height: kToolbarHeight,
          child: //Center(

            Text("Contacter Medecin", textAlign:TextAlign.center,style: TextStyle(fontSize: 19),),

        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white.withOpacity(0.7),),
          
           onPressed: () {
  Navigator.of(context).push(MaterialPageRoute(  
                  builder: (context)=> DoctorsList(),)); 


             },
          


        ),
        
      ),

      body :
           
           Container(
           child :  SingleChildScrollView(
             child: Column(children : <Widget> [



                Container(height: 580,
                
                color : Colors.grey.withOpacity(0.2),
                
                
                ),
        

                  TextFormField(
                 validator: (val) => val!.isEmpty ? 'Entrez un message' : null,
                 controller: _message,
                 
                 decoration: InputDecoration(
                hintText: "Message",
                hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
                icon: const Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: const Icon(Icons.message,color:Color.fromRGBO(223,178,164,1),)),
                      
                      suffixIcon:  IconButton(icon:  Icon(Icons.send),color: Color.fromRGBO(223,178,164,1), onPressed: () {  },)
                      
                      
                      
                      ),
             
                
               
            
          
               
              ),









             ]),
           )







    ));
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