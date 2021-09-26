
import 'package:appf/Screens/Home/homeScreen.dart';
import 'package:appf/Screens/Home/navigation_drawer_widget.dart';
import 'package:appf/Screens/ListeMedecins/list.dart';
import 'package:appf/database.dart';
import 'package:appf/modules/rdv.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'dart:math';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

///Local import
import '../../model/sample_view.dart';
import 'BlackoutDatePicker .dart';
class monMedecin extends StatefulWidget {
  const monMedecin({ Key? key, required this.numMed }) : super(key: key);
    final String numMed;
  @override
  _monMedecinState createState() => _monMedecinState();
}

class _monMedecinState extends State<monMedecin> {
    DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();
  bool one = false;
  bool two = false;
  bool three = false;
  bool four = false;
  bool five = false;
  bool six = false;
          var nn = List<Rdv>.empty();

              final user = FirebaseAuth.instance.currentUser;

  late DateTime date;
   String etat ="demande";
  late String e_med="";
  late String heure;
  late Rdv rdv;
  late String id="";
   Rdv rdv2=Rdv(date: "", etat: "", e_med: "", e_pat: "", heure: "",id: "");
  @override
  Widget build(BuildContext context) {    
     String e_pat= user!.email.toString();

       String med="";
       String numMed="";
       Map<String,String> map= {};

       FirebaseFirestore.instance
       .collection('rendez-vous')
        .get()
        .then((QuerySnapshot querySnapshot) {
         querySnapshot.docs.forEach((d) {
           if((d["e_pat"]==user!.email) && d["etat"]=="comfirmer"){
             DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(d["date"]);
             print(tempDate);
              String datee= "${tempDate.day}/${tempDate.month}/${tempDate.year}";
              print(datee);
              id=d["id"];
             rdv2=new Rdv(date: datee, etat: d["etat"], e_med: d["e_med"], e_pat: d["e_pat"], heure: d["heure"],id: d["id"]);
           }

        });
    });


      FirebaseFirestore.instance
       .collection('Diabtologue')
        .get()
        .then((QuerySnapshot querySnapshot) {
         querySnapshot.docs.forEach((d) {
            if(d["emailMed"]==e_med){
            numMed=d["NumTel"];
            print(map);
            }
         // print(numMed);
        });
    });
          FirebaseFirestore.instance
       .collection('Patient')
        .get()
        .then((QuerySnapshot querySnapshot) {
         querySnapshot.docs.forEach((doc) {
            if(doc["Email"]==user!.email){
          med =doc["e_med"];
          e_med=doc["e_med"];
          map["1"]=doc["e_med"];
          
          }
         // 
        });
        print(map);
        med=map["1"].toString();
        print(med);
    });

     

    @override
    void initState() { 
      super.initState();
      
    }
    
    return 
    
    
     DefaultTabController(
  length: 2,
  child: Scaffold(     
    //  floatingActionButton: FloatingActionButton(
    //    backgroundColor: Colors.grey,
    //     child: Icon(Icons.arrow_back),
    //     onPressed: () {
    //       _controller.animateToSelection();
    //     },
    //   ),        
      
       drawer: NavigationDrawerWidget(),

      appBar:   AppBar(centerTitle: true,
       bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.linear_scale), text: "Demander rendez-vous",),
                Tab(icon: Icon(Icons.date_range_outlined), text: "Mes rendez-vous",),

              ],
            ),
       // backgroundColor: Color.fromRGBO(65, 106, 190, 1),
        title: Text("Mon medecin"),
        actions: <Widget>[
            
            IconButton(
            icon: const Icon(Icons.call),
            tooltip: 'appler',
            onPressed: () {
              _callNumber(numMed);
              //print(e_med);
            //  print("\n"+numMed);
              // mail=getNumDoc(context,mail);
              // print("this is "+med);
            //Navigator.pop(context);
          },
          )
          ]
      ),
body:  TabBarView(
        children: [
          Center(
             child:  Column(
     crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
                 SizedBox(height:30),
              Row(children: [
                SizedBox(width:15),//
                               Text("Choisir la date :", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,     decoration: TextDecoration.underline,
 ) ,),



              ],),
                 SizedBox(height:20),  


           //   Padding(
              //   padding: EdgeInsets.all(10),
              // ),
            //  Text(_selectedValue.day.toString()+"/"+_selectedValue.month.toString()+"/"+_selectedValue.year.toString()),
              // Padding(
              //   padding: EdgeInsets.all(20),
              // ),
              Container(
                child: DatePicker(
                  DateTime.now(),
                  width: 60,
                  height: 80,         
                   locale:"fr_FR",

                  controller: _controller,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.grey,
                  selectedTextColor: Colors.white,
                  inactiveDates: [

                    //pour calculer la duree : 
                    // A= 28
                    // B=5 
                    // le calcule se fait haka :
                    // D=B+(monthCounting-A)
                    DateTime.now().add(Duration(days: 0)),

                    DateTime.now().add(Duration(days: 4)),
                   DateTime.now().add(Duration(days: 3)),
                    DateTime.now().add(Duration(days: 11)),
                    DateTime.now().add(Duration(days: 18)),
                    DateTime.now().add(Duration(days: 125)),
                    DateTime.now().add(Duration(days: 7)),

                  ],
                  onDateChange: (d) {
                    // New date selected
                    setState(() {
                      _selectedValue = d;
                        date=d;
                    });
                  },
                ),
              ),
               Padding(
                padding: EdgeInsets.all(13),
              ),
              
              Row(children: [   
                                  SizedBox(width:20),

                 Text("Date choisi :"),
                SizedBox(width:15),
                
               Text(_selectedValue.day.toString()+"/"+_selectedValue.month.toString()+"/"+_selectedValue.year.toString()),


              ],),
               SizedBox(height:13),

              Divider(color: Colors.black12, thickness: 1),
//  ElevatedButton(
//             style: 
//             ElevatedButton.styleFrom(
//               primary: //Color(0xFF3ABD6F),
//                Color.fromRGBO(182,215,225,0.9), // set the background color 
//               padding: EdgeInsets.symmetric(horizontal: 33, vertical: 17),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//             ),
//               child: Text(
//               'Heure',
//             style: TextStyle(fontSize: 18, color: Color.fromRGBO(37,136,166,1))),

//             onPressed: () {

//                   //print('object');
                  
//             }
//        ),

//hna la premiere page 
Column(
   crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
                                               SizedBox(height:20),

               Row(children: [
                 SizedBox(width:20),
                 Text("Choisir l'heure :", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,     decoration: TextDecoration.underline,
 ) ,),
               ],),
 

                                SizedBox(height:27),

   Row(children: [
  Padding(
                padding: EdgeInsets.all(13),
              ),
        GestureDetector(
        onTap: (){
          setState(() {
            one =!one;
          });
           heure="09:00";
        },
              child: Time(
          //icon: Icons.date_range_rounded,
        time: '09:00',
         isSelected: one,
        ),
      ),
        Padding(
                padding: EdgeInsets.all(13),
              ),
        GestureDetector(
        onTap: (){
          setState(() {
            two =!two;
          });
           heure="10:00";
        },
              child: Time(
        time: '10:00',
         isSelected: two,
        ),
      ),
        Padding(
                padding: EdgeInsets.all(13),
              ),
        GestureDetector(
        onTap: (){
          setState(() {
            three =!three;
          });
           heure="11:00";
        },
              child: Time(
        time: '11:00',
         isSelected: three,
        ),
      ),

    ],),
             
                 SizedBox(height:27),

   Row(children: [
          Padding(
                padding: EdgeInsets.all(13),
              ),
         GestureDetector(
        onTap: (){
          setState(() {
            four =!four;
          });
           heure="13:00";
        },
              child: Time(
        time: '13:00',
         isSelected: four,
        ),
      ),
        Padding(
                padding: EdgeInsets.all(13),
              ),
 GestureDetector(
        onTap: (){
          setState(() {
            five =!five;
          });
           heure="14:00";
        },
              child: Time(
        time: '14:00',
         isSelected: five,
        ),
      ),
  Padding(
                padding: EdgeInsets.all(13),
              ),
      GestureDetector(
        onTap: (){
          setState(() {
            six =!six;

          });
          heure="15:00";
          print("last is tapped");
        //  print(time);
        },
              child: Time(
        time: '15:00',
         isSelected: six,
        ),
      ),
   ],),

            SizedBox(height:25),

              Divider(color: Colors.black12, thickness: 1),

            SizedBox(height:25),
Row(children: [
              SizedBox(width:63),

    ElevatedButton(
            style: 
            ElevatedButton.styleFrom(
              primary: //Color(0xFF3ABD6F),
               Color.fromRGBO(11,44,135,1), // set the background color 
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
              child: Text(
              'Envoyer demande rendez-vous',
            style: TextStyle(fontSize: 15, color: Colors.white)),

            onPressed: () {
              rdv=new Rdv(date: date.toString(), etat: etat, e_med: e_med, e_pat: e_pat, heure: heure, id: id );

                  print('object');
                
                      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Valider'),
          content: const Text('Envoyer la demande du rendez-vous?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('retour'),
            ),
            TextButton(
              onPressed: () {
              //  Navigator.pop(context, 'OK');
                 ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Demande envoyer!')));

                 DatabaseService().ajoutRdv(rdv);
                  Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                         )
                        );
              } ,
              child: const Text('OK'),
            ),
          ],
        ));
                },
              
            
          
    ),            
       
],)
             

         ], 
         
         
          ),  
         
         
         ],


             
             ),
             ),


             //second page

             StreamProvider<List<Rdv>>.value(initialData: nn,
             value: DatabaseService().rdv,
             child:
             
          Center(  //DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(savedDateString);

             child: 
             
             StreamBuilder(        
               
         stream: FirebaseFirestore.instance.collection('rendez-vous').where('e_pat',isEqualTo: user!.email).where('etat',isEqualTo:"comfirmer").snapshots(),

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } 

          return ListView(
              children: snapshot.data!.docs.map((document){
                return Padding(padding: const EdgeInsets.only(top: 8.0),
                child:    Column(
     crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
                 SizedBox(height:30),

    Card(

                            elevation:5,
                      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),

      child:
      Column(children: [
       
          Text("Prochain rendez-vous: ", style: TextStyle(color: Color.fromRGBO(70, 113,198, 1),fontSize: 15, fontWeight: FontWeight.w500,     decoration: TextDecoration.underline,)
         ),
            SizedBox(height:25),
            Row(
              children:[ 
                SizedBox(width:15),
                Text("Date:  ",style: TextStyle(fontSize: 15)),
                 Text(rdv2.date,style: TextStyle(fontSize: 15)),
              ] ,
            ),
          
              Divider(color: Colors.black12, thickness: 1),
  Row(
              children:[ 
                SizedBox(width:15),
                Text("Heure:  ",style: TextStyle(fontSize: 15)),
                 Text(rdv2.heure,style: TextStyle(fontSize: 15)),
              ] ,
            ),
              Divider(color: Colors.black12, thickness: 1),

              Row(
              children:[ 
                SizedBox(width:15),
                Text("Etat:  ",style: TextStyle(fontSize: 15)),
                 Text(rdv2.etat,style: TextStyle(fontSize: 15)),
              ] ,
            ),
            SizedBox(height:25),
ButtonTheme(
            child: ButtonBar(
              children: <Widget>[
                // FlatButton(
                //   child: const Text('Edit', style: TextStyle(color: Colors.black)),
                //   onPressed: () {

                    
                //   },
                // ),
                FlatButton(
                  child: const Text('Annuler', style: TextStyle(color: Color.fromRGBO(70, 113,198, 1))),
                  onPressed: () {

                      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Annuler le rendez-vous'),
          content: const Text('Voulais vous vraiment annuler le rendez-vous?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('retour'),
            ),
            TextButton(
              onPressed: () {
              //  Navigator.pop(context, 'OK');
                 ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Rendez-vous Annuler avec succée!')));

                 DatabaseService().ajoutRdv(rdv);
                  
              } ,
              child: const Text('OK'),
            ),
          ],
        ));                  },
                ),
              ],
            ),
          ),
      ],)
      
              ),
             ],
             ),
                
                );
              }

          ).toList());

        }
             ),
             
             
           

          ),)
        ]
),
    ),
    );


    
      
  }
  _callNumber(String phoneNumber) async {
  String number = phoneNumber;
  await FlutterPhoneDirectCaller.callNumber(number);
}

String getNumDoc(BuildContext context,String mailMed){
          final user = FirebaseAuth.instance.currentUser;
        List<String> liste3 =[];

        FirebaseFirestore.instance
    .collection('Patient')
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((d) {
                      // print(doc["e-med"]);
                    //   print(doc["Email"]);

            if(d["Email"]==user!.email){
             // print(doc["Email"]);
            // mailMed=d["e-med"].toString();
            mailMed="dec";
          // print("\n\n"+mailMed);
          // liste3.add(mailMed);
           //return d["e-med"];
          // print(liste3);

          }
          });        

        });


    print(mailMed);

      
  return mailMed;
}



  Widget autres(String str){

    if(str=='autres'){
      GestureDetector(
        onTap: (){
          setState(() {
            one =!one;
          });
        },
              child: Time(
        time: 'ajeune',
         isSelected: one,
        ),
      );


    }
    return Text('');
  }

}


class Time extends StatelessWidget {

  
  const Time({
    Key? key,  required this.time, required this.isSelected,
  }) : super(key: key);
  
  final String time;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    //print(time);
    return Container(
        height: 55,
        width: 88,
        margin: EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: isSelected?Color.fromRGBO(11,44, 135, 0.6999999):Colors.grey[200],
          borderRadius: BorderRadius.circular(9),
              border: Border.all(color: Colors.grey.shade300)

        //   boxShadow: [
        //  //   BoxShadow(
        //     //  color:isSelected?Colors.black:Colors.black,
        //     //  blurRadius: 10,
        //     //  offset: Offset(2, 3),
        //  //   )
        //   ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

           
            SizedBox(height:5),
            Text(
             time,
              style: TextStyle(color: isSelected?Colors.white:Colors.black54, 
              fontSize: 17
              
              ),
            ),
          ],

        ),
    );
  }
}
  