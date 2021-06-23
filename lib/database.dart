import 'package:appf/modules/Analys.dart';
import 'package:appf/modules/Medicaments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'models/PatientModel.dart';
import 'modules/Glycemie.dart';

class DatabaseService{

 // late final String uid;
 // DatabaseService({required this.uid});
  final CollectionReference GlycemieCollection = FirebaseFirestore.instance.collection('Glycemie');
  final CollectionReference usercol =
      FirebaseFirestore.instance.collection("Patient");
  final CollectionReference analysecol = FirebaseFirestore.instance.collection('Analyse');
  /*Future getGly (String etat, String heure, String note, double taux, Timestamp date ) async {

    return await GlycemieCollection.doc(uid).set({
        'date' : date,
        'etat' : etat,
        'heure' : heure,
        'note': note,
        'taux' : taux,
    });
  }*/
  Future<Null> ajoutAnalyse(Timestamp t,Analyse analyse) async {
     var docRef = await analysecol.add({
      'urlAnlayse' : analyse.urlAnalyse,
      'name' : analyse.name,
      'email' : analyse.email,
    });
    var docId = docRef.id;
    analysecol.doc(docId).update({
      'urlAnlayse' : analyse.urlAnalyse,
      'name' : analyse.name,
      'email' : analyse.email,
      'id' : docId,
    });
  }

  Future<String> updateGly(Timestamp t, Glycemie gly ) async{
      var collection = FirebaseFirestore.instance.collection('collection');

    var docRef = await GlycemieCollection.add({
        //'date' : date,
        'etat' : gly.etat,
        'heure' : gly.heure,
        'note': gly.note,
        'taux' : gly.taux,
        'date' : t,
        'uid': gly.uid,
        'email' : gly.email,
        
    });
    var docId = docRef.id;
    print(docId);
    GlycemieCollection.doc(docId).update({
       'etat' : gly.etat,
        'heure' : gly.heure,
        'note': gly.note,
        'taux' : gly.taux,
        'date' : t,
        'uid': gly.uid,
        'id': docId,
        'email' : gly.email,
    });
    return docId;
  }
 Future<Null> updateGlycemie( Glycemie gly, var docId) async{
   
  GlycemieCollection.doc(docId).update({
       'etat' : gly.etat,
        'heure' : gly.heure,
        'note': gly.note,
        'taux' : gly.taux,
        'uid': gly.uid,
        'id': docId,
        'email' :gly.email,
    });
 }

  Future sauvGly(Glycemie g,Timestamp t) async{
    try{
      await GlycemieCollection.doc().set(g.toMap(t));
      return true;
    }catch(e){
      return false;
    }
  }

  // glycemie liste

  List<Glycemie> _glycemieListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Glycemie(
        etat: doc.get('name') ?? '',
        heure: doc.get('heure') ?? '',
        note: doc.get('note') ?? '',
        taux: doc.get('taux') ?? 0,
        uid: doc.get('uid') ?? '',
         id: doc.get('id') ?? '',
         email: doc.get('email') ?? '',
         );
    }).toList();
  }

  List<Analyse> _analyseListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Analyse(urlAnalyse: doc.get('urlAnalyse') ?? ''
      
      , name: doc.get('name') ?? '',
      
       email: doc.get('email') ?? '',
       id: doc.get('id') ?? '',
       
       ) ;
    }).toList();
  }
  Stream< List<Glycemie>> get gly{
        return GlycemieCollection.snapshots().map(_glycemieListFromSnapshot);
  }
   Stream< List<Medicines>> get medicine{
        return GlycemieCollection.snapshots().map(_medicinesListFromSnapshot);
  }
  Stream <List<Analyse>> get analyse{
    return analysecol.snapshots().map(_analyseListFromSnapshot);
  }


   List<Medicines> _medicinesListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Medicines(
        nomMedicament: doc.get('NomMedicament') ?? '',
        time: doc.get('Time') ?? '',
        dose: doc.get('dose') ?? '',
        periode: doc.get('Period') ?? '',
         email: doc.get('email') ?? '',
       
         );
    }).toList();
  }
Stream< List<Medicines>> get medicines{
        return GlycemieCollection.snapshots().map(_medicinesListFromSnapshot);
  }

Stream< List<Medicines>> get medicin{
        return GlycemieCollection.snapshots().map(_medicinesListFromSnapshot);
  }

  List <PatientModel> _patientListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((
      doc
    ){
      return PatientModel(dateNais: doc.get('dateNais') ?? '',
      
      email: doc.get('email') ?? '',
      name: doc.get('name') ?? '',
      numTel: doc.get('numTel') ?? '',
      photoUrl: doc.get('photoUrl') ?? 0,
      uid: doc.get('uid') ?? '',
       typeDiab: doc.get('typeDiab') ?? '',
        poids: doc.get('poids') ?? '',
      
      
      );
    }).toList();
  }

  Stream <List<PatientModel>> get pat{
    return usercol.snapshots().map(_patientListFromSnapshot);
  }

  
Future deleteGly(String id) async {
    try {
       await GlycemieCollection.doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
 Future deleteAnalyse(String id) async {
  try{
    await analysecol.doc(id).delete();
    return true;
   } catch(e){
     return false;
   }
 }

   Future<User?> get user async {
    final user = FirebaseAuth.instance.currentUser;
    return user;
  }



















  //  Future getUser(String id) async {
  //   try {
  //     final data = await usercol.doc(id).get();
  //     final user = PatientModel.fromJson(data.data());
  //     return user;
  //   } catch (e) {
  //     return false;
  //   }
  // }
 
  // Stream<PatientModel>? get getCurrentUser {
  //   final user = FirebaseAuth.instance.currentUser;
  //   return user != null
  //       ? usercol.doc(user.uid).snapshots().map((user) {
  //           PatientModel.currentUser = PatientModel.fromJson(user.data());
  //           return PatientModel.fromJson(user.data());
  //         })
  //       : null;
  // }


}