import 'package:appf/Screens/Authenticate/Login/LoginPage.dart';
import 'package:appf/Screens/Home/Editer.dart';
import 'package:appf/Screens/Home/ListMedicaments.dart';
import 'package:appf/Screens/Home/lstMedicament.dart';
import 'package:appf/Screens/ListeMedecins/list.dart';
import 'package:appf/Screens/ListeMedecins/lst.dart';
import 'package:appf/Screens/graphics/Graph.dart';
import 'package:appf/Screens/graphics/graphics.dart';
import 'package:appf/Screens/medicament/medicamenList.dart';
import 'package:appf/Screens/monMedecin/monMedecin.dart';
import 'package:appf/page/TodaysData.dart';
import 'package:appf/page/analyse.dart';
import 'package:appf/page/newPage.dart';
import 'package:appf/page/rapport.dart';
import 'package:appf/urils/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sortedmap/sortedmap.dart';
import 'package:dropdown_below/dropdown_below.dart';

import '../settings.dart';
import '../viewProfile.dart';
import 'ProfileScreen.dart';


class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  FirebaseAuth auth =FirebaseAuth.instance;
    Map<DateTime,double> map=new SortedMap(Ordering.byKey());

  @override
  Widget build(BuildContext context) {       
                     User? updateUser = FirebaseAuth.instance.currentUser;

    final name = 'Mohamed Hafed';
    final email = updateUser!.email.toString();
    

    return ClipRRect(
     borderRadius: BorderRadius.only(
      // topRight: Radius.circular(50),
      // bottomRight: Radius.circular(25)
     ),
    child: Drawer(
      child: Material( 
          
       //color: Color.fromRGBO(	65,106,190,1),
        //color: Color.fromRGBO(	126,181,61,1),
        color: Color(0xFFFFFFFF),

        //color: Colors.green,
        child: ListView(
          children: <Widget>[
                     GestureDetector(
                       onTap:(){ Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => viewProfil(),/*Test()*/
        )); },
                  child:

                  DrawerHeader(
                    
                     child:
          //chooseImage(ImageSource.gallery);
     
                      buildHeader(
                       
            //  urlImage: ulImage,
              name: name,
              email: email,
              
               ),
                
                    decoration: 
                    BoxDecoration(
                      borderRadius: BorderRadius.only(
                     // topRight: Radius.circular(65),
                    // bottomLeft: Radius.circular(23),
                   //  bottomRight: Radius.circular(23)

                      ),
                      gradient: LinearGradient(colors: <Color>[
                   // Color(0xFF3EC6FF),   
                     //   Color.fromRGBO(54,68, 244	,1),
                      // Color.fromRGBO(110, 154, 247	,1),
                 //     Color.fromRGBO(129, 137, 248	,1),
                     //   Color.fromRGBO(135,170,247,1),
                  ///Color.fromRGBO(37,136,166,1),Color.fromRGBO(182,215,225	,1), green one
                           Color.fromRGBO(11,44,135,1),
                            Color.fromRGBO(70,113,198,1),

                   // Color.fromRGBO(110, 120, 247	,1),  
                    //  Color(0xFF3B72FF),
                     // Color(0xFF3B72FF),
                      ]),
                    ),
                    
                  ),
                   //const SizedBox(height: 10),
                   //const SizedBox(height:5),
                  //Divider(color: Colors.black26),
                   // Divider(color: Colors.black12
                   // ),
                 // const SizedBox(height: 24),
 //SizedBox(height: 20),
                     ),
                  ListTile(
                    
                  //   trailing: Icon(Icons.assessment_outlined) ,

                  // title:Padding(
                  //   padding: EdgeInsets.fromLTRB(10,0,0, 0),
                  //  child: Text('Graphiques',
                  //  style: TextStyle(fontSize: 14))),

                    title: Row(
                      
                     mainAxisAlignment: MainAxisAlignment.start,
                      
                       children: [
                       Icon(Icons.assessment_outlined) ,
                        Padding( 
                      padding: EdgeInsets.fromLTRB(10,0,0, 0),
                      child: Text('  Graphiques',
                       style: TextStyle(fontSize: 14))),

                     ],),
                     onTap: () {
                      // Update the state of the app.
                        selectedItem(context, 0);

                        },
                    
                  ),
                 //  Divider(color: Colors.black12),

                  //const SizedBox(height: 5),
                   ListTile(     
                  //    trailing: Icon(Icons.favorite_border) ,

                  // title:Padding(
                  //   padding: EdgeInsets.fromLTRB(10,0,0, 0),
                  //  child: Text('',
                  //  style: TextStyle(fontSize: 14))),
                    title: Row(
                      
                     mainAxisAlignment: MainAxisAlignment.start,
                      
                       children: [
                       Icon(Icons.circle_outlined),
                        Padding( 
                      padding: EdgeInsets.fromLTRB(10,0,0, 0),
                      child: Text('  Médicaments',
                       style: TextStyle(fontSize: 14))),

                     ],),
                     onTap: () {
                      // Update the state of the app.
                        selectedItem(context, 1);

                        },
                  ),
                //  Divider(color: Colors.black12),

                 // const SizedBox(height: 16),
                   ListTile(
                  //  trailing: Icon(Icons.assessment_outlined) ,
                  // title:Padding(
                  //   padding: EdgeInsets.fromLTRB(10,0,0, 0),
                  //  child: Text('Rapport & Analyses',
                  //  style: TextStyle(fontSize: 14))),
                     title: Row(
                      
                     mainAxisAlignment: MainAxisAlignment.start,
                      
                       children: [
                       Icon(Icons.show_chart_rounded) ,
                        Padding( 
                      padding: EdgeInsets.fromLTRB(10,0,0, 0),
                      child: Text('  Rapport & Analyses',
                       style: TextStyle(fontSize: 14))),

                     ],),
                     onTap: () {
                      // Update the state of the app.
                        selectedItem(context, 2);
                        },
                      //  Row(
                      //    children: [
                      //      Align(
                      //        mainAxisAlignment: MainAxisAlignment.start,
                      //        alignment: Alignment.centerLeft,
                      //        child: Icon(Icons.assessment_outlined),
                      //      ),
                      //    ],
                      //  ),
                  ),
        
             //    const SizedBox(height: 10),
                //  Divider(color: Colors.black12),

                  ListTile(
                  //     title:Padding(
                  //   padding: EdgeInsets.fromLTRB(10,0,0, 0),
                  //  child: Text('Notifications',
                  //  style: TextStyle(fontSize: 14))),
                  //                        trailing: Icon(Icons.notifications_outlined) ,

                     onTap: () {
                      // Update the state of the app.
                        selectedItem(context, 3);
                        },
                   title: Row(
                      
                     mainAxisAlignment: MainAxisAlignment.start,
                      
                       children: [
                       Icon(Icons.medical_services_outlined) ,
                        Padding( 
                      padding: EdgeInsets.fromLTRB(10,4,0, 0),
                      child: Text('  Mon médecin',
                       style: TextStyle(fontSize: 14))),

                     ],)
                    ,), 
                  
                  //),
                  
                  const SizedBox(height: 19),
                  Divider(color: Colors.black12, 
                          height: 20,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                       ),
                  const SizedBox(height: 19),

                    ListTile(

                  //   trailing: Icon(Icons.notifications_outlined) ,

                  //   title:Padding(
                  //   padding: EdgeInsets.fromLTRB(10,0,0, 0),
                  //  child: Text('Notifications',
                  //  style: TextStyle(fontSize: 14))),
                  //   // Text('Notifications'),
                     onTap: () {
                      // Update the state of the app.
                        selectedItem(context, 4);

                        },


                        title: Row(
                      
                     mainAxisAlignment: MainAxisAlignment.start,
                      
                       children: [
                       Icon(Icons.list_alt_outlined) ,
                        Padding( 
                      padding: EdgeInsets.fromLTRB(10,3,0, 0),
                      child: Text('  Liste des médecins',
                       style: TextStyle(fontSize: 14))),

                     ],)
                  ),
                  
              //    Divider(color: Colors.black12),

                 // const SizedBox(height: 16),
                    ListTile(    

                  //     trailing: Icon(Icons.room_preferences_outlined ) ,

                  //      title:Padding(
                  //   padding: EdgeInsets.fromLTRB(10,0,0, 0),
                  //  child: Text('Paramètres Application',
                  //  style: TextStyle(fontSize: 14))),
                     onTap: () {
                      // Update the state of the app.
                        selectedItem(context, 5);
                        },

                          title: Row(
                      
                     mainAxisAlignment: MainAxisAlignment.start,
                      
                       children: [
                       Icon(Icons.room_preferences_outlined) ,
                        Padding( 
                      padding: EdgeInsets.fromLTRB(10,3,0, 0),
                      child: Text('  Paramètres Application',
                       style: TextStyle(fontSize: 14,fontFamily: 'Circular'))),
                     ],)
                  ),

                    ListTile(    

                  //     trailing: Icon(Icons.room_preferences_outlined ) ,

                  //      title:Padding(
                  //   padding: EdgeInsets.fromLTRB(10,0,0, 0),
                  //  child: Text('Paramètres Application',
                  //  style: TextStyle(fontSize: 14))),
                     onTap: () {
                      // Update the state of the app.

                        selectedItem(context, 6);

                        },

                          title: Row(
                      
                     mainAxisAlignment: MainAxisAlignment.start,
                      
                       children: [
                       Icon(Icons.exit_to_app) ,
                        Padding( 
                      padding: EdgeInsets.fromLTRB(10,3,0, 0),
                      child: Text('  Déconnexion' ,
                       style: TextStyle(fontSize: 14,fontFamily: 'Circular'))),
                     ],)
                  ),
                  
                ],
              ),
            
          
        ),
      
     )
     
      );
  }

 Widget buildHeader({
   // required String urlImage,
    required String name,
    required String email,
  }) =>
      InkWell(
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
            
            // backgroundImage: NetworkImage(urlImage)
              SizedBox(width: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Circular'),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    email,
                    style: TextStyle(fontSize: 11, color: Colors.white, fontFamily: 'Circular'),
                  ),
                ],
              ),
              Spacer(),
                CircleAvatar(radius: 30,  child: Icon(Icons.person, color: Colors.white),
            backgroundColor:// Color.fromRGBO(37,136,166,1),
                     Color.fromRGBO(11,44,135,1),
                     


),
              // CircleAvatar(
              //   radius: 24,
              //   backgroundColor: Color.fromRGBO(30, 60, 168, 1),
              //   child: Icon(Icons.person, color: Colors.white),
              // )
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Future<void> selectedItem(BuildContext context, int index) async {
    Navigator.of(context).pop();

    switch (index) {
      case 0:

       
       
      map= test(context, map);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>SplineTypes(map: map,),//SplineDefault(),////DateTimeDefault(map : map),// //Graphes(tl: map,),/*Test()*/
        ));
        
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ListeMedicament(),
        ));
        break;
        case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Rapport_Analyse(),
        ));
        break;
        case 3:
          Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ListeMedicamentH()//monMedecin(), // Analyses(),
         ));
        break;
        case 4:
         Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>DoctorsList(), // Analyses(),
        ));

        break;
        case 5:
          Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>SettingsPage(), 
        ));
        break;
          case 6:
                   

           Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>LoginPage(), 
        ));
         // loading(context);

          break;
          // await auth.signOut();   
          // setState((){


            
          // })





         /* Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>LoginPage(), // Analyses(),
        ));*/
       
       
    }
  }

      Map<DateTime,double> test(context, Map<DateTime,double> tL){
                    final user = FirebaseAuth.instance.currentUser;
                    int i=1;
                    double s=0;
                    DateTime dd;
     // if(tL.isEmpty){
         FirebaseFirestore.instance
    .collection('Glycemie')
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          
            if(doc["email"]== user!.email){
              print(doc["taux"]);
              
             DateTime d= doc["date"].toDate();
           // tL.add(doc["taux"]);
           tL[d] = doc["taux"];
            //print(user.email);
          }
          });
          
    
           // print(tL.length);
            
          //  myData.add(doc["taux"]);
          
        });

        Map<DateTime,double> newMap={};
        List<DateTime> liste =[];
        List<DateTime> liste2 =[];
        List<double> liste3 =[];

             tL.forEach((k,v) {
               liste.add(k);}); 
            // 
              //  for(int j=1;j<=liste.length;j++){
              //    if(liste2[j-1].day!=liste[j].day){
              //       liste2[j]=liste[j];
              //    }
              //  }

        if(liste.isNotEmpty){
          print("liste "+liste[0].toString());
          liste2.add(liste[0]);
          int x=0;
          if(liste2.isNotEmpty){
             for(int j=0;j<liste.length;j++){
                 if(liste2[x].day!=liste[j].day){
                   liste2.add(liste[j]);
                   x++;
               }
             // print(liste[j]);
                }

                for(int j=0;j<liste2.length;j++){
                  tL.forEach((key, value) {

                    if(liste2[j].day==key.day){
                        s=s+value;
                        i++;
                    }
                   });
                   s=s/i;  
                   i=0;
                   liste3.add(s);                
                      s=0;

                }

                for(int j=0;j<liste3.length;j++){
                  newMap[liste2[j]]=liste3[j];
                }                 
                return newMap;

               // print(liste3);
          }
          
            
        }
   
  
    return tL;
        }
}



/*import 'package:appf/Screens/ListeMedecins/list.dart';
import 'package:flutter/material.dart';
//import 'package:navigation_drawer_example/page/DateTimePicker.dart';
//import 'package:navigation_drawer_example/page/newPage.dart';
//import 'package:navigation_drawer_example/page/test.dart';
//import 'package:navigation_drawer_example/page/user_page.dart';


class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final name = 'Rayane Hafed';
    final email = 'rayanewiza2@gmail.com';
   
    return Drawer(
      child: Material(
          
    
        //color: Colors.green,
        child: ListView(

          children: <Widget>[
                  DrawerHeader(
                     child: buildHeader(
            //  urlImage: ulImage,
              name: name,
              email: email, ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                     Color.fromRGBO(11,44,135,1),
                     Color.fromRGBO(11,44,135,1),
                      ]),
                    ),
                    
                  ),
                   //const SizedBox(height: 10),
                   //const SizedBox(height:5),
                  //Divider(color: Colors.black26),
                    Divider(color: Colors.black12
                    ),
                 // const SizedBox(height: 24),

                  ListTile(
                    
                  //   trailing: Icon(Icons.assessment_outlined) ,

                  // title:Padding(
                  //   padding: EdgeInsets.fromLTRB(10,0,0, 0),
                  //  child: Text('Graphiques',
                  //  style: TextStyle(fontSize: 14))),

                    title: Row(
                      
                     mainAxisAlignment: MainAxisAlignment.start,
                      
                       children: [
                       Icon(Icons.assessment_outlined) ,
                        Padding( 
                      padding: EdgeInsets.fromLTRB(10,0,0, 0),
                      child: Text('  Graphiques',
                       style: TextStyle(fontSize: 14))),

                     ],),
                     onTap: () {
                      // Update the state of the app.
                        //selectedItem(context, 0);

                        },
                    
                  ),
                 //  Divider(color: Colors.black12),

                  //const SizedBox(height: 5),
                   ListTile(     
                  //    trailing: Icon(Icons.favorite_border) ,

                  // title:Padding(
                  //   padding: EdgeInsets.fromLTRB(10,0,0, 0),
                  //  child: Text('',
                  //  style: TextStyle(fontSize: 14))),
                    title: Row(
                      
                     mainAxisAlignment: MainAxisAlignment.start,
                      
                       children: [
                       Icon(Icons.favorite_border) ,
                        Padding( 
                      padding: EdgeInsets.fromLTRB(10,0,0, 0),
                      child: Text('  Médicaments',
                       style: TextStyle(fontSize: 14))),

                     ],),
                     onTap: () {
                      // Update the state of the app.
                        //selectedItem(context, 1);

                        },
                  ),
                //  Divider(color: Colors.black12),

                 // const SizedBox(height: 16),
                   ListTile(
                  //  trailing: Icon(Icons.assessment_outlined) ,
                  // title:Padding(
                  //   padding: EdgeInsets.fromLTRB(10,0,0, 0),
                  //  child: Text('Rapport & Analyses',
                  //  style: TextStyle(fontSize: 14))),
                     title: Row(
                      
                     mainAxisAlignment: MainAxisAlignment.start,
                      
                       children: [
                       Icon(Icons.assessment_outlined) ,
                        Padding( 
                      padding: EdgeInsets.fromLTRB(10,0,0, 0),
                      child: Text('  Rapport & Analyses',
                       style: TextStyle(fontSize: 14))),

                     ],),
                     onTap: () {
                      // Update the state of the app.
                        //selectedItem(context, 2);
                        },
                      //  Row(
                      //    children: [
                      //      Align(
                      //        mainAxisAlignment: MainAxisAlignment.start,
                      //        alignment: Alignment.centerLeft,
                      //        child: Icon(Icons.assessment_outlined),
                      //      ),
                      //    ],
                      //  ),
                  ),
                  ListTile(
                    
                  //   trailing: Icon(Icons.assessment_outlined) ,

                  // title:Padding(
                  //   padding: EdgeInsets.fromLTRB(10,0,0, 0),
                  //  child: Text('Graphiques',
                  //  style: TextStyle(fontSize: 14))),

                    title: Row(
                      
                     mainAxisAlignment: MainAxisAlignment.start,
                      
                       children: [
                       Icon(Icons.list) ,
                        Padding( 
                      padding: EdgeInsets.fromLTRB(10,0,0, 0),
                      child: Text('  Liste des Diabetologues',
                       style: TextStyle(fontSize: 14))),

                     ],),
                     onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorsList()));
                      // Update the state of the app.
                        //selectedItem(context, 0);

                        },
                    
                  ),
        
             //    const SizedBox(height: 10),
                //  Divider(color: Colors.black12),

                  ListTile(
                  //     title:Padding(
                  //   padding: EdgeInsets.fromLTRB(10,0,0, 0),
                  //  child: Text('Notifications',
                  //  style: TextStyle(fontSize: 14))),
                  //                        trailing: Icon(Icons.notifications_outlined) ,

                     onTap: () {
                      // Update the state of the app.
                       // selectedItem(context, 3);
                        },
                   title: Row(
                      
                     mainAxisAlignment: MainAxisAlignment.start,
                      
                       children: [
                       Icon(Icons.medical_services_outlined) ,
                        Padding( 
                      padding: EdgeInsets.fromLTRB(10,4,0, 0),
                      child: Text('  Mon médecin',
                       style: TextStyle(fontSize: 14))),

                     ],)
                    ,), 
                  
                  //),
                  
                  const SizedBox(height: 19),
                  Divider(color: Colors.black12, 
                          height: 20,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                       ),
                  const SizedBox(height: 19),

                    ListTile(

                  //   trailing: Icon(Icons.notifications_outlined) ,

                  //   title:Padding(
                  //   padding: EdgeInsets.fromLTRB(10,0,0, 0),
                  //  child: Text('Notifications',
                  //  style: TextStyle(fontSize: 14))),
                  //   // Text('Notifications'),
                     onTap: () {
                      // Update the state of the app.
                      //  selectedItem(context, 4);

                        },


                        title: Row(
                      
                     mainAxisAlignment: MainAxisAlignment.start,
                      
                       children: [
                       Icon(Icons.notifications_outlined) ,
                        Padding( 
                      padding: EdgeInsets.fromLTRB(10,3,0, 0),
                      child: Text('  Notifications',
                       style: TextStyle(fontSize: 14))),

                     ],)
                  ),
                  
              //    Divider(color: Colors.black12),

                 // const SizedBox(height: 16),
                    ListTile(    

                  //     trailing: Icon(Icons.room_preferences_outlined ) ,

                  //      title:Padding(
                  //   padding: EdgeInsets.fromLTRB(10,0,0, 0),
                  //  child: Text('Paramètres Application',
                  //  style: TextStyle(fontSize: 14))),
                     onTap: () {
                      // Update the state of the app.
                       // selectedItem(context, 4);
                        },

                          title: Row(
                      
                     mainAxisAlignment: MainAxisAlignment.start,
                      
                       children: [
                       Icon(Icons.room_preferences_outlined) ,
                        Padding( 
                      padding: EdgeInsets.fromLTRB(10,3,0, 0),
                      child: Text('  Paramètres Application',
                       style: TextStyle(fontSize: 14))),

                     ],)
                  ),
                  
                ],
              ),
            
          
        ),
      
    );
  }

 Widget buildHeader({
   // required String urlImage,
   required String name,
  required String email,
  }) =>
      InkWell(
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
            
            // backgroundImage: NetworkImage(urlImage)
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 21, color: Colors.white),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    email,
                    style: TextStyle(fontSize: 11, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
                CircleAvatar(radius: 30,  child: Icon(Icons.person, color: Colors.white),
),
              // CircleAvatar(
              //   radius: 24,
              //   backgroundColor: Color.fromRGBO(30, 60, 168, 1),
              //   child: Icon(Icons.person, color: Colors.white),
              // )
            ],
          ),
        ),
      );

  Widget buildMenuItem({
     required String text,
     required IconData icon,
     required VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  /*void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Test(),
        ));
        
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Test(),
        ));
        break;
        case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NewPage(),
        ));
        break;
    }
  }*/
}
*/



