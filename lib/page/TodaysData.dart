
import 'package:appf/Screens/Home/homeScreen.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:appf/Screens/Home/navigation_drawer_widget.dart';
import 'package:appf/modules/Glycemie.dart';
import 'package:appf/page/dataFromAnyday.dart';
import 'package:appf/page/modifGly.dart';
import 'package:appf/urils/constant.dart';
import 'package:appf/urils/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../database.dart';
import 'newPage.dart';

class TodaysData extends StatefulWidget {
  //const TodaysData({ Key? key }) : super(key: key);
  
  @override
  _TodaysDataState createState() => _TodaysDataState();
}

class _TodaysDataState extends State<TodaysData> {
  late double _height;
 late double _width;

 late String _setTime, _setDate;

 late String _hour, _minute, _time;

 late String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  @override
  void initState() {
        _dateController.text = DateFormat.yMd().format(DateTime.now());

    // TODO: implement initState
    super.initState();
  }
  void _showSettingsPanel(Glycemie gly) {

      showModalBottomSheet(context: context, builder: (context) {
        shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(10.0),
                                  );
        return Container(

          //margin: new EdgeInsets.symmetric(horizontal: 10.0),
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: GlyInformation(gly),
        );
      });
    }

      void sendroute(Glycemie gly)  {
          Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => modifGly(glycemie: gly,),
        ));

      }
//-------------------------------------------------------------------------------------------------------------------
//DATE PICKER--------------------------------------------------------------------------------------------------------
  Future<Null> _selectDate(BuildContext context) async {
      initializeDateFormatting('fr_FR', null);

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMMMd('fr_FR').format(selectedDate);
       // print(_dateController.text);

         Navigator.of(context).push(MaterialPageRoute(
                     builder: (context) => Anyday( day: _dateController.text,fullDate: picked,),
                       )
                      );

      });
  }

  Widget DatePicker(){
     _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Container(

        child: Text('test'),


    );
  }

  //-------------------------------------------------------------------------------------------------------------------
  Widget GlyInformation(Glycemie gly){
        return Padding(padding: const EdgeInsets.all(2),
          child: Column(
            children: [
                                           SizedBox(height: 15),

              Text(
                'DÉTAILS', style: TextStyle( fontSize: 20, color:  Color.fromRGBO(70, 113, 198,1)),
                textAlign: TextAlign.start,          
              ),
                Divider(color: Colors.black12, thickness: 1,),

              SizedBox(height: 30),
                Text('Taux:    '+ gly.taux.toString()+' g/l'+'                                                                        ',style: TextStyle( fontSize: 17.5)),
                           
                             SizedBox(height: 15),

                Text('État:     '+ gly.etat+'                                                                        ',style: TextStyle( fontSize: 17.5)),
              SizedBox(height: 15),

                Text('Heure:  '+ gly.heure+'                                                                        ',style: TextStyle( fontSize: 17.5)),
              SizedBox(height: 15),
                Divider(color: Colors.black12, thickness: 1,),

                Text('Note: \n '+ gly.note+'                                                                        ',style: TextStyle( fontSize: 17.5)),
                           Divider(color: Colors.black12, thickness: 1,),

              SizedBox(height: 30),
              // ButtonWidget(
              //   text: 'Choisir fichier' ,
              //   icon: Icons.attach_file,
              //   onClicked:sendroute ,
                
              // ),
              Row(
                children: [
                  SizedBox(
                    width:129,
                    child:   ElevatedButton(
                
              style: ElevatedButton.styleFrom(
                primary:Colors.redAccent,
                
                // Color.fromRGBO(29, 194, 95, 1),
                  minimumSize: Size.fromHeight(40), 
                  
                  ),
                    onPressed: () {
                          final user = FirebaseAuth.instance.currentUser;

                        final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
                       String uid = _firebaseAuth.currentUser!.uid.toString();  
                            mydialog(context,
                                title: "Suppression",
                                content: "Voulez-vous supprimer ",
                                ok: () async {
                              Navigator.of(context).pop();
                              loading(context);
                              bool delete =
                                    
                                  await DatabaseService().deleteGly(gly.id);
                                  print(FirebaseAuth.instance.currentUser!.uid);
                                  print(gly.id);
                                 Navigator.of(context).pop();

                              if (delete != null) {
                                Navigator.of(context).pop();
                              }
                            });
                          },
                 child: Text("Supprimer", style:TextStyle(fontSize: 16) ,),
      ),
                  ),
                                SizedBox(width: 10),

           SizedBox(
                    width:129,
                    child:   ElevatedButton(
                
              style: ElevatedButton.styleFrom(
                primary:// Colors.red,
               // Color.fromRGBO(29, 194, 95, 1),
               Colors.grey[500],
                  minimumSize: Size.fromHeight(40), 
                  
                  ),
                  onPressed:(){
                    sendroute(gly);
                  } ,
                 child: Text("Modifier", style:TextStyle(fontSize: 16) ,),
      ),
                  ),
                 ] )
             
            ],
          ),
        
        );
  }
  
    Glycemie n = new Glycemie(etat: '', heure: ' ', note: '', taux: 1,uid: '',id: '',email:'');
     // var nn = new Glycemie(etat: '', heure: ' ', note: '', taux: 1,);
      var nn = List<Glycemie>.empty();
      int nb =1;
       late Glycemie gly ;
            final user = FirebaseAuth.instance.currentUser;
            

   final titles = ["8:15 -   1,2g/l   - à jeun", "12:15   - 1,2g/l   - avant le déjeuner", "4:30   - 1,2g/l   - aprés-midi"];
  final subtitles = [
    "Here is list 1 subtitle",
    "Here is list 2 subtitle",
    "Here is list 3 subtitle"

  ];

      DateTime now = new DateTime.now();
   
  FixedExtentScrollController fixedExtentScrollController =
    new FixedExtentScrollController();
  //final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time,Icons.ac_unit, Icons.access_alarm, Icons.access_time,Icons.ac_unit, Icons.access_alarm, Icons.access_time];
  @override
  Widget build(BuildContext context) {
    return
    
    
    StreamProvider<List<Glycemie>>.value(
 // catchError: (_, __) => nn,
      
      value: DatabaseService().gly, 
     // initialData: null,
       initialData:  nn,
       child:  
    
      
    
     Scaffold(
        //  drawer: NavigationDrawerWidget(),

        appBar: AppBar(centerTitle: true,
         title: Text("Niveau de glycémie d'aujourd'hui", textAlign:TextAlign.center,style: TextStyle(fontSize: 15),),

          leading :IconButton(
          icon: Icon(Icons.arrow_back,
          color: Colors.white.withOpacity(0.5),),
           onPressed: () { Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomeScreen()));}),
         actions: <Widget>[
             
            IconButton(
            icon: const Icon(Icons.calendar_today),
            tooltip: 'choisir date',
            onPressed: () {
              _selectDate(context);
           // Navigator.pop(context);
          },)]
      ),
      body: //listGlycemie(),
      
      
      
       /*ListWheelScrollView(
  controller: fixedExtentScrollController,
  physics: FixedExtentScrollPhysics(),
  children: monthsOfTheYear.map((month) {
    return Card(
        child: Row(
      children: <Widget>[
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            month,
            style: TextStyle(fontSize: 18.0),
          ),
        )),
      ],
    ));
  }).toList(),
  itemExtent: 60.0,
),*/
   StreamBuilder(    
     

        stream: FirebaseFirestore.instance.collection('Glycemie').where('email',isEqualTo: user!.email) .snapshots(),
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
             padding: const EdgeInsets.fromLTRB( 1.0,1.0,1.0,0.0),
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
              _showSettingsPanel(

                getD(document['etat'],
                document['heure'],
                 document['note']
                 , document['taux'],
                  document['date'],
                  document['id']
                  ,document['uid'],
                   document['email'])

                  );
  print(document['date'].toDate().day.toString());

       /*  AwesomeDialog(
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
            
         //   btnOkColor:              Color.fromRGBO(245, 140,120,0.8),
// Colors.yellow[200],
            btnCancelOnPress: (){
                
            },
            btnCancelText: 'Supprimer',
            )..show();*/
            } ,
                child: (document['date'].toDate().day == now.day)
                ?
                
                Card(
                                              elevation:3,

                     margin: EdgeInsets.fromLTRB(20, 2.0, 20.0, 3.0),
                     borderOnForeground: true,
                 // width: MediaQuery.of(context).size.width/1.2,
                 // height: MediaQuery.of(context).size.height/6,
                  child:// 

                //  )
                  ListTile( leading: CircleAvatar(
                          radius: 10.0,
                          
                          backgroundColor: getColor(document['taux'])
                          
                         // (document['taux'] > 1 ) ? Colors.redAccent : Colors.green,
                          ),
                          title: //Text(document['taux'].toString() +'    -    '+document['heure'] + "   -    "+ document['etat']),
                          
                         Text( getDate(document['etat'],document['heure'], document['note'], document['taux'], document['date'] )
                         ,
                         style:TextStyle(fontSize: 14.5) ,
                         ),

                          
                          ),
                    
                  
                  )

                  :SizedBox(width:0),
                  
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

  Color getColor(double taux){
     Color brcolor;

     if(taux<= 0.72) return Colors.redAccent;
     if(0.71<taux && taux<0.90)  return Colors.orangeAccent;
     if(0.90<= taux && taux <= 1.53)  return Colors.greenAccent;
     if(1.53< taux && taux <= 1.75)  return Colors.orangeAccent;
     if(taux > 1.75)  return Colors.redAccent;
      return Colors.greenAccent;
  }

  String getDate( String etat, String heure, String note,double taux,Timestamp t){
      DateTime date = t.toDate(); // TimeStamp to DateTime
      DateTime now = new DateTime.now();

      if(date.day == now.day){
            return (heure+'    -    '+taux.toString() +" g/L"+ "   -    "+ etat
            );

      }
      
    return "";
    
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