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
  PatientModel p =PatientModel(uid: '', name: '', dateNais: '', numTel: '', email: '', photoUrl: 0);
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
  child: (document['Email'] == 'test@gmail.com')
                ?
                
                Card(
                     margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
                     borderOnForeground: false,
                 // width: MediaQuery.of(context).size.width/1.2,
                 // height: MediaQuery.of(context).size.height/6,
                  child:// 

                //  )
                  ListTile( leading: CircleAvatar(
                          radius: 10.0,

                         // (document['taux'] > 1 ) ? Colors.redAccent : Colors.green,
                          ),
                          title: //Text(document['taux'].toString() +'    -    '+document['heure'] + "   -    "+ document['etat']),
                          
                         Text(document['Email']+document['Name']
                         ,
                         style:TextStyle(fontSize: 14.5) ,
                         ),

                          
                          ),
                    
                  
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
  
  



