import 'package:appf/modules/Analys.dart';
import 'package:appf/modules/Medicaments.dart';
import 'package:appf/modules/act_phy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'models/PatientModel.dart';
import 'modules/Glycemie.dart';
import 'modules/rdv.dart';

class DatabaseService{

 // late final String uid;
 // DatabaseService({required this.uid});
  final CollectionReference GlycemieCollection = FirebaseFirestore.instance.collection('Glycemie');
  final CollectionReference usercol =
      FirebaseFirestore.instance.collection("Patient");
      final CollectionReference rdvcol =
      FirebaseFirestore.instance.collection("rendez-vous");
  final CollectionReference analysecol = FirebaseFirestore.instance.collection('Analyse');
  
    final CollectionReference actphy = FirebaseFirestore.instance.collection('act_phy');

  /*Future getGly (String etat, String heure, String note, double taux, Timestamp date ) async {

    return await GlycemieCollection.doc(uid).set({
        'date' : date,
        'etat' : etat,
        'heure' : heure,
        'note': note,
        'taux' : taux,
    });
  }*/

  Future<Null> ajoutAct(Actphy act) async {
      await actphy.add({
      'date' :act.date,
      'e_pat' : act.e_pat,
      'nb_pas' : act.nb_pas,
    });
   
  }
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
  Future<Null> ajoutRdv(Rdv rdv) async{
   var docRef = await rdvcol.add(
      {
        'date' :rdv.date,
        'etat' : rdv.etat,
        'e_med' : rdv.e_med,
        'e_pat' : rdv.e_pat,
        'heure' : rdv.heure,

      }
    );
     var docId = docRef.id;
     rdvcol.doc(docId).update({
        'date' :rdv.date,
        'etat' : rdv.etat,
        'e_med' : rdv.e_med,
        'e_pat' : rdv.e_pat,
        'heure' : rdv.heure,
        'id': docId,
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

  Future<Null> updatePatient( PatientModel pat, String docId) async{
   
  usercol.doc(docId).update({
       'DateNais': pat.dateNais,
       'Email': pat.email,
       'Name' : pat.name,
       'NumTel' : pat.numTel,
        'e_med' : "katiya@gmail.com",
        'poids' : pat.poids,
        'type' : pat.typeDiab,
        'UID': pat.uid,
    
       
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
        etat: doc.get('name') ,
        heure: doc.get('heure') ,
        note: doc.get('note') ,
        taux: doc.get('taux') ,
        uid: doc.get('uid') ,
         id: doc.get('id') ,
         email: doc.get('email'),
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

    List<Actphy> _actphyListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Actphy(
        
        
        date: doc.get('date')
      
      , e_pat: doc.get('e_pat'),
      
       nb_pas: doc.get('nb_pas'),
       
       ) ;
    }).toList();
  }
  List <PatientModel> _patientListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((
      doc
    ){
      return PatientModel(dateNais: doc.get('DateNais') ?? '',
      
      email: doc.get('Email') ?? '',
      name: doc.get('Name') ?? '',
      numTel: doc.get('NumTel') ?? '',
      uid: doc.get('UID') ?? '',
       typeDiab: doc.get('type') ?? '',
        poids: doc.get('poids') ?? '',
      
      
      );
    }).toList();
  }
   Future<Null> ajoutPat(PatientModel pat) async{
         final user = FirebaseAuth.instance.currentUser;

   await usercol.add(
      {
       'DateNais': pat.dateNais,
       'Email': pat.email,
       'Name' : pat.name,
       'NumTel' : pat.numTel,
        'e_med' : "",
        'poids' : pat.poids,
        'type' : pat.typeDiab,
        'UID': user!.uid,
      }
    );
    
  }


  Stream< List<Actphy>> get act{
        return GlycemieCollection.snapshots().map(_actphyListFromSnapshot);
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
  Stream <List<Rdv>> get rdv{
    return rdvcol.snapshots().map(_rdvListFromSnapshot);
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

   List<Rdv> _rdvListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Rdv(date: doc.get('date') ,
       e_med: doc.get('e_med') ,
        e_pat: doc.get('e_pat') , 
        etat: doc.get('etat') ,
         heure:doc.get('heure') ,
         id: doc.get('id')
      
       ) ;
    }).toList();
  }
Stream< List<Medicines>> get medicines{
        return GlycemieCollection.snapshots().map(_medicinesListFromSnapshot);
  }

Stream< List<Medicines>> get medicin{
        return GlycemieCollection.snapshots().map(_medicinesListFromSnapshot);
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
  Future deleteRdv(String id) async {
    try {
       await rdvcol.doc(id).delete();
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