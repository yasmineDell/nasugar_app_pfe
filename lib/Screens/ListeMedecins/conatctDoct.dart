import 'package:appf/Screens/Home/homeScreen.dart';
import 'package:appf/models/Diabeto.dart';
import 'package:appf/modules/rdv.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:intl/intl.dart';

import '../../database.dart';
import 'list.dart';

class Contact extends StatefulWidget {
   const Contact({Key? key, required this.diabeto}) : super(key: key);

  final Diabeto diabeto;
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {

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

   


    
    return Scaffold(
           appBar:   AppBar(centerTitle: true,
           title: Text("Demande Rendez-vous"),
             actions: <Widget>[
            
            IconButton(
            icon: const Icon(Icons.call),
            tooltip: 'appler',
            onPressed: () {
              _callNumber(widget.diabeto.phoneNumber);
        
          },
          )
          ]
           
           ),

           body:  Center(
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
              rdv=new Rdv(date: date.toString(), etat: etat, e_med: widget.diabeto.emailadrs, e_pat: e_pat, heure: heure, id: id );

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
                        builder: (context) => DoctorsList(),
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

           
    );
  }
}

  _callNumber(String phoneNumber) async {
  String number = phoneNumber;
  await FlutterPhoneDirectCaller.callNumber(number);
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
  