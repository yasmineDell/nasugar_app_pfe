import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'modules/Glycemie.dart';

class DatabaseService{

 // late final String uid;
 // DatabaseService({required this.uid});
  final CollectionReference GlycemieCollection = FirebaseFirestore.instance.collection('Glycemie');
  /*Future getGly (String etat, String heure, String note, double taux, Timestamp date ) async {

    return await GlycemieCollection.doc(uid).set({
        'date' : date,
        'etat' : etat,
        'heure' : heure,
        'note': note,
        'taux' : taux,
    });
  }*/

  Future<Null> updateGly(String etat, String heure, String note, double taux,Timestamp t  ) async{

    await GlycemieCollection.add({
        //'date' : date,
        'etat' : etat,
        'heure' : heure,
        'note': note,
        'taux' : taux,
        'date' : t

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
         
         );
    }).toList();
  }
  Stream< List<Glycemie>> get gly{
        return GlycemieCollection.snapshots().map(_glycemieListFromSnapshot);
  }

Future deleteGly() async {
    try {
      await GlycemieCollection.doc('gqZKzRPwPdks08mkFuYa').delete();
      return true;
    } catch (e) {
      return false;
    }
  }

}