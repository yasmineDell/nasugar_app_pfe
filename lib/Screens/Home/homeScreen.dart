import 'dart:async';
import 'package:appf/Screens/Home/homeWidget.dart';
import 'package:appf/Screens/Home/navigation_drawer_widget.dart';
import 'package:appf/Screens/Home/tabbar_material_widget.dart';
import 'package:appf/Screens/ListeMedecins/lst.dart';
//import 'package:appf/Screens/Home/radial_progress.dart';
import 'package:appf/Screens/edite_profile.dart';
import 'package:appf/Screens/Home/Editer.dart';
import 'package:appf/main.dart';
import 'package:appf/page/newPage.dart';
import 'package:appf/step.dart';
import 'package:appf/widget/Card_section.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../const copy.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up : ${message.messageId}    onMessage:$message');

}
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {  

     FirebaseMessaging messaging = FirebaseMessaging.instance;
    Future<void> showMeMyToken()
    async {
      var myToken = await messaging.getToken();
      print("My Token is: " + myToken.toString());
    }
  Future notif() async{
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  }


        GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

      final user = FirebaseAuth.instance.currentUser;

   int index = 0;
       final pages = <Widget>[
         home(),
  ];


     @override
  void initState() {
    // TODO: implement initState
    super.initState();
           showMeMyToken();
    var androidd = AndroidInitializationSettings('mipmap/ic_launcher');
  var ios =  IOSInitializationSettings();
  var platform = InitializationSettings();
          flutterLocalNotificationsPlugin.initialize(platform);

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
    


      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

   messaging.subscribeToTopic('order-created');
   

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new notif on app event was published! onMessage:$message');

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if(notification != null && android !=null){
        showDialog(
          
          context: context,
           builder:(_) {
             return AlertDialog(
               title: Text(notification.title.toString()),
               content: SingleChildScrollView(child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 
                 children: [
                   Text(
                     notification.body.toString()
                   ),

               ],),),
             );
           }
           );
      }
     });

     
  }
  void sendNotification() {
  
    flutterLocalNotificationsPlugin.show(0,
     'Reminder ',
      'Did you check you sugar level today?',
       NotificationDetails(
         android:AndroidNotificationDetails(
           channel.id,
           channel.name,
           channel.description,
           importance: Importance.high,
           color: Colors.blue,
           playSound: true,
           icon: '@mipmap/ic_launcher'
         ) )
       
       );
     
  }

  @override
  Widget build(BuildContext context) {

      //      Timer.periodic(Duration(seconds:20), (timer) {
     
    //               sendNotification();

     
  //}
  // ); 
     final height = MediaQuery.of(context).size.height;
   
    return   Scaffold(
                key: _scaffoldKey,

        drawer: NavigationDrawerWidget(),

    
      backgroundColor:   Color.fromRGBO(11,44,135,1),
          
    
     extendBody: true,


     bottomNavigationBar: TabBarMaterialWidget( pages[index],

          index: index,
          onChangedTab: onChangedTab, key: null, 
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color.fromRGBO(245,140, 120,1),
          onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NewPage(),
        ));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  
body:  

Stack(

children : <Widget> [

Positioned(
top:0, 
height: height * 18,
left: 0,
right: 0,

child: ClipRRect(
 /* borderRadius: const BorderRadius.vertical(
  bottom : Radius.circular(60)


  ),*/

    child: 
    Container(
color : Color.fromRGBO(11,44,135,1),
 padding: const EdgeInsets.only(top: 50, left: 15, right: 16, bottom: 10), // hada li djay mel fo9

 
                child:   Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                 
                
                children: [
                  
                Row(
                  
                  
                 // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      
             IconButton(
               iconSize: 25,
                icon:
              Icon(Icons.dehaze_rounded),color:
               Colors.white.withOpacity(0.7), 
               onPressed: () { _scaffoldKey.currentState!.openDrawer(); },),
                   
                      SizedBox(
                        width:30,
                      ),
                       
                         
                         
                    
                    // Container(
                    //   width: 40,
                    //   height: 40,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(
                    //           width: 4,
                    //           color: Theme.of(context).scaffoldBackgroundColor),
                    //       boxShadow: [
                    //         BoxShadow(
                    //             spreadRadius: 2,
                    //             blurRadius: 10,
                    //             color: Colors.black.withOpacity(0.1),
                    //             offset: Offset(0, 10))
                    //       ],
                    //       shape: BoxShape.circle,
                    //       image: DecorationImage(
                    //           fit: BoxFit.cover,
                    //           image: AssetImage("assets/images/Moh.jpeg"))),
                    // ),
                 

 ],
 ),
              SizedBox(
                        width:50,
                        height: 10,
                      ),
                         
                Text( 
                         "Bonjour, Mohammed", // je dois réccupérer le prénom du malade de la data base
                        style: TextStyle(
                          
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),



                ],
                )


  ),
  ),

),


//****************** */ hada li djay felwast ************************
Positioned(   

top : height * 0.235,
left : 0,
right: 0,

 
 child: Container(
   decoration: BoxDecoration(color: Colors.white, 
   borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0))
   ),
   
   
         
height : height ,
padding: const EdgeInsets.only( left: 10,top :10),
    child: Column(
     
crossAxisAlignment: CrossAxisAlignment.start,

children: <Widget>[
  //buildbody(),
  // Text(
    
  //               "Medicaments d'aujourd'hui", 
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.w800,
  //                         fontSize: 15,
  //                         color: Colors.grey[800],
  //                       ),
  // ),
                 SizedBox(height: 17),

    
               Container(
                    height: 125,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        CardSection(
                          image: AssetImage("assets/images/pill.png"),
                          title: "Metforminv",
                          value: "2",
                          unit: "Comprimés",
                          time: "6-7 AM",
                          isDone: false,
                        ),
                        CardSection(
                          image: AssetImage("assets/images/pill.png"),
                          title: "Trulicity",
                          value: "1",
                          unit: "Comprimé",
                          time: "8-9 AM",
                          isDone: true,
                        )
                      ],
                    )),
SizedBox(height:40),
Center(
  child:Column(children: [
    RadialProgress(),

 

  ],) 
  ),
  Container(
margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),





        // hada row li fih les cases hadok sghar  te3 le poids w te3 glycémie
   child: Row( 
      children: <Widget> [
        Container(

          width : 140,
           //margin : EdgeInsets.only(right:20),
           height: 150,
           decoration: BoxDecoration(
            color: Colors.white,
             //borderRadius: BorderRadius.all(Radius.circular(40)),
            


           ),
           
           child: Column( 
           children: <Widget> [
              Container(
                width : 130,
           
           height: 73,
           decoration: BoxDecoration(color: Colors.grey[50],
            borderRadius: BorderRadius.vertical(top:Radius.circular(40))
           
           
           ),
           child: Padding(padding: const EdgeInsets.all(12.0),
          
           child: Column(
             
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[


              Center(child:   
              
              
              
              
                Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                         
                      
                          shape: BoxShape.circle,
                          
                         image: DecorationImage(
                             fit: BoxFit.cover,
                              image: AssetImage("assets/images/glycemie.png")
                             )
                             )
                             ,
                    ),),
             SizedBox(height: 1),
             
             
            Text( "Glycémie",
                
                style: TextStyle(fontSize: 13 , color :   Color.fromRGBO(11,44,135,1),
      ),

             ) ,
             ],
             
             ),
           ),
                
              ),
              Container(
                width : 130,
           
           height: 60,
           decoration: BoxDecoration(color :  Color.fromRGBO(11,44,135,1),
            borderRadius: BorderRadius.vertical(bottom:Radius.circular(40))
           
           
           ),
           child: Padding(padding: const EdgeInsets.all(12.0),
          
           child: Row(

             
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
        SizedBox( 
               width: 30,
             ),
            Text( "0.9 g/l",
                
                style: TextStyle(fontSize: 15 , color: Colors.white),

             ) ,
            
            
             
            //   Text( "14 avril \n 2021",
                
            //     style: TextStyle(fontSize: 15 , color: Colors.white),

            //  ) ,
            
             ],
             
             ),
           ),
                
              ),
              
           
             ] ,
             ),
           ),
             // espace li binathom 
           Container(

          width : 30,
           margin : EdgeInsets.only(right:20),
           height: 30,
          
           
           ),
        Container(

          width : 140,
           //margin : EdgeInsets.only(right:20),
           height: 150,
           decoration: BoxDecoration(
            color: Colors.white,
             borderRadius: BorderRadius.all(Radius.circular(40)),
            


           ),
           
           child: Column( 
           children: <Widget> [
              Container(
                width : 130,
           
           height: 73,
           decoration: BoxDecoration(color: Colors.grey[50],
            borderRadius: BorderRadius.vertical(top:Radius.circular(40)),
            border: Border.all(
      color: Color(0x5B3576AA).withOpacity(0.1),
      width: 1,
    ),
           
           ),
           child: Padding(padding: const EdgeInsets.all(12.0),
          
           child: Column(
             
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[

             Center(child:     Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                         
                           color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/pes.jpg"))),
                    ),),
             SizedBox(height: 1),
               Text( "Poids",
                
                style: TextStyle(fontSize: 13 , color :  Color.fromRGBO(11,44,135,1),),

             ) ,

                   
               
             
             ],
             
             ),
           ),
                
              ),
              Container(
                width : 130,
           
           height: 60,
           decoration: BoxDecoration(color : Color.fromRGBO(11,44,135,1),
            borderRadius: BorderRadius.vertical(bottom:Radius.circular(40))
           
           
           ),
           child: Padding(padding: const EdgeInsets.all(12.0),
          
           child: Row(

             
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
  SizedBox(
               width: 40,
             ),
            Text( "85 kg",
                
                style: TextStyle(fontSize: 15 , color: Colors.white),

             ) ,
           
            
             
            //   Text( "12 avril \n 2021",
                
            //     style: TextStyle(fontSize: 15 , color: Colors.white),

            //  ) ,
            
             ],
             
             ),
           ),
                
              ),
              

             ] ,
             ),
           ),
         

   

],


),



  ),

  // espace li entre les 2 box w la box li tahthom 






],

    ),

 ),





),

// ____________________________________ ykhlas hna _____________________________


],

),    





    );
 }
  void onChangedTab(int index) {
    setState(() {
      
      this.index = index;
    });
  }

  Widget buildbody(){
    return StreamBuilder(
         
          stream: FirebaseFirestore.instance.collection('Medicaments').where('email',isEqualTo: user!.email).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return 
                 CircularProgressIndicator();
              
            }

              
            return
             ListView(
              scrollDirection: Axis.horizontal,
             
             
             

               children: snapshot.data!.docs.map((document) {
                
              
             return Padding(
               
                  padding: const EdgeInsets.only( top:10, left: 20, bottom: 20), //nzid left w right
                   //padding: const EdgeInsets.all(10.0),
                  
                  child:   Container(
                     
                    
                      
                     
                    child:SizedBox(
                      height: 80,
                     //width: 200,
                    
                                      
                
                   child: Material(
                    color: Colors.white,
                    elevation: 4.0,
                    
                    borderRadius: BorderRadius.circular(15.0),
                    shadowColor: Color(0x802196F3),
                    child:
                       
                       Row(
                          // le container contenant les info du premier medecin
                     mainAxisAlignment: MainAxisAlignment.start,
                    
                            children:[ 
                            

                                       
                    Container(
                       width: 50,
                       height: 50,
                      decoration: BoxDecoration(
                        
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.white.withOpacity(0.1),
                                //offset: Offset(0, 10)
                                )
                          ],
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/pill.png"))),
                    ),

                SizedBox(width: 50,
                ),
                
                        Container(
                          
                          // margin: EdgeInsets.symmetric(horizontal :20.0),
                          
                            // le container contenant les info du premier medecin
                          child:  Column (
                            children: [
                               SizedBox(width: 30,
                height: 30,),
     
                          Container(
          
          
          
               child: Text(document['NomMedicament'],
            style: TextStyle(color: Color.fromRGBO(65, 106, 190, 1), fontSize: 20.0,),),),
        
    
       
        
          Container(
              
              child:Text("Dose : "+document['dose'],
                   style: TextStyle(color: Colors.black54, fontSize: 16.0,), ),
                
          ),
                   
                
           Container(
             
             
             child:
       Text("Heure : "+document['Time'] +"  heures"
       ,
          style: TextStyle(color: Colors.black54, fontSize: 15.0),),),       
               

           Container(


            child :Text("Periode : "+ document['Period'],
          style: TextStyle(color: Colors.black54, fontSize: 12.0,),)),

        ],)
        
        
        

      
                            
                            
                        
                         ),


                          SizedBox(width: 50,
              ),
                         ] ),
                        )),

           
              
                
              ),





                  
                
              );
              }).toList(),
            );
          });
  }

 
  void _navigateToItemDetail(Map<String, dynamic> message) async {
    Navigator.popUntil(context, (Route<dynamic> route) => route is PageRoute);
    await Navigator.of(context).push(PageRouteBuilder(
        opaque: false, pageBuilder: (context, _, __) => NewPage()));

  }


 Future onSelectNotification(String payload) async {
  this.build(context);
   Navigator.push(
     context,
     MaterialPageRoute(builder: (context) => NewPage()),
   );
   if (payload != null) {
    debugPrint('notification payload: ' + payload);
  }

}



   Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
     await Firebase.initializeApp();

      print("Handling a background message :-): ${message.data}");
      //Here you can do what you want with the message :-)
     }
}