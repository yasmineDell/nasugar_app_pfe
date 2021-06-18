
import 'package:appf/Screens/Home/ListMedicaments.dart';
import 'package:appf/Screens/Home/navigation_drawer_widget.dart';
import 'package:appf/modules/Glycemie.dart';
import 'package:appf/modules/Medicaments.dart';
import 'package:appf/page/newPage.dart';
import 'package:appf/urils/constant.dart';
import 'package:appf/urils/loading.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import '../../database.dart';


class TodaysMedic extends StatefulWidget {
  //const TodaysData({ Key? key }) : super(key: key);
  
  @override
  _TodaysMedicState createState() => _TodaysMedicState();
}

class _TodaysMedicState extends State<TodaysMedic> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void _showSettingsPanel(Medicines medicament) {

      showModalBottomSheet(context: context, builder: (context) {
        shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(10.0),
                                  );
        return Container(

          //margin: new EdgeInsets.symmetric(horizontal: 10.0),
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: MedicInformation(medicament),
        );
      });
    }
 void sendroute()  {
          Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NewPage(),
        ));

      }
       
  Widget MedicInformation(Medicines medicament){
        return Padding(padding: const EdgeInsets.all(2),
          child: Column(
            children: [
                                           SizedBox(height: 15),

     Text('NomMedicament:    '+ medicament.nomMedicament.toString()+' '+'                                                                        ',style: TextStyle( fontSize: 17.5)),
                             SizedBox(height: 15),
                Divider(color: Colors.black12, thickness: 1,),

              SizedBox(height: 30),
                Text('Time:    '+ medicament.time.toString()+' '+'                                                                        ',style: TextStyle( fontSize: 17.5)),
                             SizedBox(height: 15),

                Text('dose:     '+ medicament.dose.toString()+'                                                                        ',style: TextStyle( fontSize: 17.5)),
              SizedBox(height: 15),

                Text('Period:  '+ medicament.periode.toString()+'                                                                        ',style: TextStyle( fontSize: 17.5)),
              SizedBox(height: 15),
                Divider(color: Colors.black12, thickness: 1,),

    
                           Divider(color: Colors.black12, thickness: 1,),

              SizedBox(height: 30),
           
             
             
            ],
          ),
        
        );
  }
  
    Medicines med = new Medicines(nomMedicament: '', time: ' ', dose: '', periode: '',email: '');
   
      var listMedic = List<Medicines>.empty();
  int nb =1;
  late Medicines medicines ;
            final user = FirebaseAuth.instance.currentUser;
            


      DateTime now = new DateTime.now();
   
  FixedExtentScrollController fixedExtentScrollController =
    new FixedExtentScrollController();
  //final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time,Icons.ac_unit, Icons.access_alarm, Icons.access_time,Icons.ac_unit, Icons.access_alarm, Icons.access_time];
  @override
  Widget build(BuildContext context) {
    return
    
    
    StreamProvider<List<Medicines>>.value(
  catchError: (_, __) => listMedic,
      
      value: DatabaseService().medicines, 
     // initialData: null,
      
       initialData: listMedic,
       child:  
    
      
    
     Scaffold(
          drawer: NavigationDrawerWidget(),

       
      body: 
   StreamBuilder(    
     

        stream: FirebaseFirestore.instance.collection('Medicaments').where('email',isEqualTo: "test@gmail.com"/*user!.email*/).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
         // citiesRef.where('country', 'in', ['USA', 'Japan']);

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
  
         return  ListView(
           children: snapshot.data!.docs.map((document)
           {return Padding(
             padding: const EdgeInsets.only(top: 8.0),
             child: GestureDetector(

            onTap: () { 
         //     print(user['uid']);
              if (user != null) {
  String? name = user!.displayName;
  String? email = user!.email;
  print(name);
  print(''+email!);
 // System.Uri photo_url = user.PhotoUrl;
  // The user's Id, unique to the Firebase project.
  // Do NOT use this value to authenticate with your backend server, if you
  // have one; use User.TokenAsync() instead.
 // String? uid = user!.UserId;
}
              /*_showSettingsPanel(

                getD(
                  document['NomMedicament'],
                document['Time'],
                 document['dose']
                 , document['Periode']),
                  

                  );*/

      
            } ,
                
              
                
               child: Card(
                     margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
                     borderOnForeground: false,
                 // width: MediaQuery.of(context).size.width/1.2,
                 // height: MediaQuery.of(context).size.height/6,
                  child:// 

                //  )
              Row( children:[ CircleAvatar(
                          radius: 10.0,
                          
                        
                          
                        
                          ),
                         
                          
                         Text( (document['NomMedicament'] )
                         ,
                         style:TextStyle(fontSize: 14.5) ,
                         ),
                            
                         Text( (document['Time'] )
                         ,
                         style:TextStyle(fontSize: 14.5) ,
                         ),
                            
                         Text( (document['dose'] )
                         ,
                         style:TextStyle(fontSize: 14.5) ,
                         ),
                            
                         Text( (document['Period'] )
                         ,
                         style:TextStyle(fontSize: 14.5) ,
                         ),
                         

              ]
                          ),
                    
                  
                  )

                  
                  
              ),
             );
          
          
        
           }
         ).toList(),
           
           
           
        /*     
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

        itemCount: titles.length,
        itemBuilder: (context, index) {
          return 
          GestureDetector(

            onTap: () {
        //       Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => infoGly(),
        // ));

         AwesomeDialog(
            context: context,
            dialogType: DialogType.NO_HEADER,
           // animType: AnimType.TOPSLIDE,
             showCloseIcon: true,
             closeIcon: Icon(Icons.cancel_outlined),
            title: 'Informations',
            desc: 'Veuillez choisir',
          onDissmissCallback: (type) {
                          debugPrint('Dialog Dissmiss from callback $type');
                        },
            btnOkOnPress: () { 
                  //  Navigator.of(context).push(MaterialPageRoute(
                  //      builder: (context) => MainPage(),
                  //       )
                  //       );

                   Navigator.of(context).push(MaterialPageRoute(
             builder: (context) => NewPage(),
        ));
            },
            btnOkText: 'Modifier',
            btnCancelOnPress: (){
                
            },
            btnCancelText: 'Supprimer',
            )..show();
            } ,
            child: new Card(
              child: ListTile(
                  title: Text(titles[index]),
                //  subtitle: Text(subtitles[index]),
                  leading: //CircleAvatar(
                    Icon(Icons.circle,),
                     // backgroundImage: NetworkImage( "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                  //trailing: Icon(icons[index] )
                )
                  
                  ) ,
          );
          
          
        }*/
     );
        }
      ),

     ),
    );

  }

  

  
  Glycemie getD( String etat, String heure, String note,double taux,Timestamp t,String id,String idd, String email){
      DateTime date = t.toDate(); // TimeStamp to DateTime
      DateTime now = new DateTime.now();
      Glycemie gly,                       

      gg= new Glycemie(etat: "", heure: "", note: "", taux: 0,uid: '',id: '',email: '');     
           final user = FirebaseAuth.instance.currentUser;

      if(date.day == now.day ){
         //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
                       //String id = _firebaseAuth.currentUser!.uid.toString();  

            //return (heure+'    -    '+taux.toString() +"m/g"+ "   -    "+ etat
            gly= new Glycemie(etat: etat, heure: heure, note: note, taux: taux,uid:user.toString(),id: id,email:email);
            return gly;
            

      }
    return gg;
    
  }
}