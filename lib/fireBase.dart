import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'models/PatientModel.dart';
// la Creation de la table patient et ses attributs

Future<void> userSetup(String name, String dateNais, String numTel  ,String email, String poids, String type ) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Patient');
  FirebaseAuth auth = FirebaseAuth.instance;  // c'est pour réuccupérer le user ID de la collection Patient 
  String uid = auth.currentUser!.uid.toString();
  users.doc(uid).update( // try tae add peut etre c ca???
    {
  'Name': name, 
  'UID': uid, 
  'DateNais' : dateNais , 
  'NumTel' : numTel,
  'Email': email,
  'poids' :poids,
  'type' : type,
  }
   );
  //return;
}

  



 /*_fetchEmail() async {

   String email;
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final firebaseUser =_firebaseAuth.currentUser;
    String uid = _firebaseAuth.currentUser.uid.toString();
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('Patient')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        email = ds.data['Email'];
        print(email);
      }).catchError((e) {
        print(e);
      });
  }*/