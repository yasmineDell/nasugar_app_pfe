
import 'package:appf/main.dart';
import 'package:appf/modules/Glycemie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Graphes extends StatefulWidget {
  const Graphes({ Key? key }) : super(key: key);

  @override
  _GraphesState createState() => _GraphesState();
}

class _GraphesState extends State<Graphes> {

// late Glycemie glycemie =new Glycemie(etat: "", heure: "", note: "", taux: 0, uid: "", id: "", email: "");
  //late List<charts.Series<Glycemie,String>> _seriesBarData;
   late List<Glycemie> myData;
  // _generateData(myData){
  //   _seriesBarData.add(
  //     charts.Series(
  //       domainFn:(Glycemie glycemie,_) => glycemie.heure,
  //       measureFn: (Glycemie glycemie,_)=> glycemie.taux,
  //       id:'Taux de Glycemie',
  //       data: myData,
        
  //        )
  //   );
  // }

  @override
  Widget build(BuildContext context) {
 late Glycemie glycemie =new Glycemie(etat: "", heure: "", note: "", taux: 0, uid: "", id: "", email: "");
  //late List<charts.Series<Glycemie,String>> _seriesBarData;  
     //myData.add(glycemie);

    return Scaffold(

      appBar: AppBar(title: Text('Graphe'),),
      body:_buildbody(context, glycemie),
          );
        }
      
     Widget _buildbody( context, Glycemie glycemie) {
        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Glycemie").snapshots(),
          builder: (context,snapshot){

            if(!snapshot.hasData){
              return  LinearProgressIndicator();
            }
              return ListView(
                  
                  children:
                      snapshot.data!.docs.map((document){
                          return Padding(padding: const EdgeInsets.only(top: 0.0),
                  child:GestureDetector(
                    onTap: (){
                    print("dcs");

                            Glycemie  gly = new Glycemie(etat: document['etat'], heure:  document['heure'], note:  document['note'], taux:  document['taux'], uid:  document['uid'], id:  document['id'], email:  document['email']);
                           // myData.add(gly);
                           // if(gly!= null)
                            print(gly);
                    },
                  )
                          );
}
    ).toList(),               
                 

             );
              
              
              
              
            
          }
          
          );


     }
}