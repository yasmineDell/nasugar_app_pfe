import 'package:appf/Screens/Home/homeScreen.dart';
import 'package:appf/Screens/Home/navigation_drawer_widget.dart';
import 'package:appf/modules/Glycemie.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinbox/material.dart'; // or flutter_spinbox.dart for both
import 'package:flutter/cupertino.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../database.dart';
import '../main.dart';
import 'package:flutter/foundation.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}
 
class _NewPageState extends State<NewPage> {
  late double _height;
  late double _width;
  late bool vf = false;
  final key = GlobalKey<FormState>();

 late String _setTime, _setDate;

 late String _hour, _minute, _time;

 late String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  final formKey =GlobalKey<FormState>();
  TextEditingController img = TextEditingController();
  
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  late File imageFile;
  late String imgUrl;
  late File image;

  
    // sendData(String etat, String heure, String note, double taux) async{

    //   if(formKey.currentState!.validate()){
    //      var storageImage = FirebaseStorage.instance.ref().child(image.path);
    //     var task = storageImage.putFile(image);
    //     imgUrl = await (await task).ref.getDownloadURL();
    //      DatabaseService().updateGly(etat, heure, note, taux,imgUrl);

    //   }
    // }
  

  final picker = ImagePicker();
  chooseImage(ImageSource source ) async{
      final pickedFile = await picker.getImage(source: source);

      setState(() {
        imageFile = File(pickedFile!.path);
      });

  }
  bool one= false;
  bool two= false;
  bool three = false;
  bool four = false;
  bool five = false;
  late String vnote;
   late final  now ;
   late double gly;
   List _testList = [{'no': 1, 'keyword': 'à jeun'},{'no': 2, 'keyword': 'avant le déjeuner '},{'no': 3, 'keyword': 'aprés-midi'},{'no': 4, 'keyword':'avant dinner'},{'no': 5, 'keyword':'avant se coucher'},{'no': 6, 'keyword':'autres'},];
  late List<DropdownMenuItem> _dropdownTestItems;
  var _selectedTest;

    Widget glycemie() => TextField(
      keyboardType: TextInputType.number,
    textInputAction: TextInputAction.done,

  );
  
   Future<Null> _selectTime(BuildContext context) async {

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
     // print(s);
     // FirebaseFirestore.instance.collection('date').add({"data": "${selectedTime.format(context)}","test": "ds"});
                      //print('${selectedTime.format(context)}');
      //  TimeOfDay? selectedDT=picked;
        
      //  int timestamp = DateTime.now().millisecondsSinceEpoch;

     // final prefs = await SharedPreferences.getInstance();
     // prefs.setInt('myTimestampKey', timestamp);
    //  print("supposed to be int $prefs");
  }
 
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
          drawer: NavigationDrawerWidget(),

        appBar: AppBar(centerTitle: true,
         title: Text("Nouvelle donnée"),
         actions: <Widget>[
           
          IconButton(
            icon: const Icon(Icons.cancel_outlined),
            tooltip: 'annuler',
            onPressed: () {
            Navigator.pop(context);
          },)]
      ),
      body: Center(child: 
      ListView(

        padding: EdgeInsets.all(5),
        children: [
                  SizedBox(height: 30),

           Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
  //---------------------------------------------------------
   
   /// place li nhetou fiha taux de glycemie
   Padding(
        child: SpinBox(
              max: 10.0,
              value: 1.0,
              decimals: 1,
              step: 0.1,
              onChanged: (value){
               // print(value);
                 gly=value;
                print(gly);
                //FirebaseFirestore.instance.collection('Glycemie').add({"etat": "avant dinner","taux": "1"});
              },
               textStyle: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                 
                border: OutlineInputBorder(
                 borderRadius: new BorderRadius.circular(13.0),
                  borderSide:  BorderSide(color: Colors.pinkAccent ),
                ),
                    contentPadding: const EdgeInsets.all(18),
                    
                labelText: 'Taux de Glycémie  ',
                 labelStyle: TextStyle(
                      fontSize: 20, 
                      color: Colors.grey[800],
                      //fontWeight: FontWeight.bold
                  ),
                 suffixText: '(mmol/L)', suffixStyle: TextStyle(
                   fontSize:14,
                 ),

                  ),
                
               
            
            ),
      padding: const EdgeInsets.all(2),
    ),
     


  //  //---------------------------------------------------------
  // image boxes
  //  SizedBox(height: 15),
  // Row(
  //   children:[
  //       Text(
  //   '   '
  //   , style: TextStyle(
  //     color: Colors.grey[800],
  //    fontWeight: FontWeight.bold,
  //     fontSize: 16,
  //     fontFamily: 'Circular')
  // ),
  //   ]
  
  // ),
  
  SizedBox(height: 10),
  Divider(color: Colors.black12, thickness: 1),
    SizedBox(height: 10),

  Row(
    
    mainAxisAlignment: MainAxisAlignment.start,

  children: [

     // _dropdownTestItems = buildDropdownTestItems(_testList);
       Padding(       padding: const EdgeInsets.all(2),

         child: 
             DropdownBelow(
            itemWidth: 250,
      
             itemTextstyle: TextStyle(fontSize: 16, color: Colors.black),
           boxTextstyle: TextStyle(fontSize: 16, color:Colors.grey[800],fontWeight: FontWeight.w400, fontFamily: 'Circular'),
           boxPadding: EdgeInsets.fromLTRB(13, 12, 0, 12),
           boxHeight: 55,
           boxWidth: 250,
          // iconSize: 23,
             hint: Text('choisir l\'état', textAlign: TextAlign.center,),
            value: _selectedTest,
            items: _dropdownTestItems,
            onChanged: onChangeDropdownTests,
    ),

         
     
     /*  ElevatedButton(
            style: 
            ElevatedButton.styleFrom(
              primary: //Color(0xFF3ABD6F),
               Color.fromRGBO(182,215,225,0.9), // set the background color 
              padding: EdgeInsets.symmetric(horizontal: 33, vertical: 17),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
              child: Text(
              'Heure',
            style: TextStyle(fontSize: 18, color: Color.fromRGBO(37,136,166,1))),

            onPressed: () {

                  //print('object');
                  
            }
       ),*/
          ),
          InkWell(
                  onTap: () {
                   // String selectedDT;
                   _selectTime(context);
                  // print(_setTime);
                  //print('$selectedDT');
                  },
                  
                  child: Container(                                                                                                                    
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    width: _width / 4.2,
                    height: _height / 15.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200],
                    		borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      ),

                    child: Form(
              //r      key: _keyForm,
                       child: 
                     TextFormField(

                      style: TextStyle(fontSize: 15,color: Colors.grey[700]),
                      textAlign: TextAlign.center,
                      onSaved: (val) {
                        _setTime = val!;
                       // gly.currentState.save();
                       //   FormState form = _formKey.currentState;
                       // formKey.currentState.save()
                      },
                      validator: (val){
                        print("vheck check");
                         // FirebaseFirestore.instance.collection('date').add({'data': '${selectedTime.format(context)}'});

                      },
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _timeController,
                      decoration: InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                              
                          // labelText: 'Time',
                          contentPadding: EdgeInsets.all(8)),
                    ),
                  ),
                ),
          ),
    /*  GestureDetector(
        onTap: (){
          setState(() {
            one =!one;
          });
        },
              child: Time(
          icon: Icons.no_food_outlined,
        time: 'ajeune',
         isSelected: one,
        ),
      ),
       GestureDetector(
          onTap: (){
          setState(() {
            two =!two;
          });
        },
          child: Time(
          icon: Icons.breakfast_dining_outlined,
      time: 'aprés',
         isSelected: two,

      ),
       ),

       GestureDetector(
          onTap: (){
          setState(() {
            three =!three;
          });
        },
                child: Time(
          icon: Icons.dinner_dining_outlined,
      time: 'déjeuner',
         isSelected: three,

      ),
       ),

        GestureDetector(
           onTap: (){
          setState(() {
            four =!four;
          });
        },
                  child: Time(
          icon: Icons.dinner_dining_outlined,
      time: 'déjeuner',
       isSelected: four,

      ),
        ),


        GestureDetector(
           onTap: (){
          setState(() {
            five =!five;
          });
        },
       child: Time(
        
          icon: Icons.dinner_dining_outlined,
      time: 'déjeuner',
       isSelected: five,

      ),
        ),
        SizedBox(height: 15),
*/
    
        ]
        
         ,
         
         ),
  //SizedBox(height: 30),

// Row(
//     children:[
//         Text(
//     '   Notes'
//     , style: TextStyle(
//       color: Colors.grey[800],
//      // fontWeight: FontWeight.bold,
//       fontSize: 18,
//       fontFamily: 'Circular')
//   ),
//     ]
  
//   ),
  
// //---------------------------------------------------------
 SizedBox(height: 10),
  Divider(color: Colors.black12, thickness: 1,),
    SizedBox(height: 10),
 // SizedBox(height: 10),
  Padding(padding: const EdgeInsets.all(2),
      child:   Container(
              height: 90,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                               //     Color.fromRGBO(182,215,225,1),

                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: //Color(0xFFD3D3D3),
                   //  Color.fromRGBO(182,215,225,1),
                     Color.fromRGBO(11,44,135,0.3),

                    blurRadius: 5,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
     child: TextField(
                textInputAction: TextInputAction.go,
                onSubmitted: (value) {
                  print(value);
                   vnote =value;
                },
                style: TextStyle(
                  color:  Colors.black87,
                ),
                maxLines: 2,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Notes additionnels...',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
           
  
  ),
  SizedBox(height: 30),

           
  Row(children: [
     

    GestureDetector(
      onTap:(){ print('sd');
          //chooseImage(ImageSource.gallery);
          chooseImage(ImageSource.camera);
      },

      // ignore: unnecessary_null_comparison
      child: 
    
       Container(
        height: 30,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        
        decoration: BoxDecoration(
          color: //Color(0x6EFFD97A),
                 // Color.fromRGBO(182,215,225,1), 
          Color(0xfffcfcff),
          borderRadius: BorderRadius.circular(9),
        //   boxShadow: [
        //  //   BoxShadow(
        //     //  color:isSelected?Colors.black:Colors.black,
        //     //  blurRadius: 10,
        //     //  offset: Offset(2, 3),
        //  //   )
        //   ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
             Icons.camera_alt_outlined,
             color: //Color(0xFFB89C55),
             // Color.fromRGBO(37,136,166,1),
                     Color.fromRGBO(11,44,135,1),
              
             size: 30,
             ),
            SizedBox(height:5),
             Text(
             '  Ajouter ',
              style: TextStyle(color:  //Color(0xFFCAAC5E),
             // Color.fromRGBO(37,136,166,1),
              Color.fromRGBO(11,44,135,1),

              fontSize: 15
              
             ),
             ),
          ],

        ),
    ),
    ),
   


    //  Container(
    //   height: 70,
    //     width: 100,
    //     margin: EdgeInsets.symmetric(horizontal: 10),
    //     decoration: BoxDecoration(
    //       color: Colors.grey[300],
    //       borderRadius: BorderRadius.circular(9),
    //     //   boxShadow: [
    //     //  //   BoxShadow(
    //     //     //  color:isSelected?Colors.black:Colors.black,
    //     //     //  blurRadius: 10,
    //     //     //  offset: Offset(2, 3),
    //     //  //   )
    //     //   ],
    //     ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [

        //     Icon(
        //      Icons.add,
        //      color: Colors.black38 ,
        //      size: 30,
        //      ),
        //     SizedBox(height:5),
        //      Text(
        //      'plus ',
        //       style: TextStyle(color: Colors.black38, 
        //       fontSize: 14
              
        //      ),
        //      ),
        //   ],

        // ),
   // ),
    
  ],),
  
// CupertinoSpinBox(
  
//   min: 1,
//   max: 100,
//   value: 50,
//   onChanged: (value) => print(value),
// ),

//---------------------------------------------------------

         // glycemie(),   // appel a la fct li idk wesh dir 
          
          
          const SizedBox(height: 60),
          ElevatedButton(
            style: 
            ElevatedButton.styleFrom(
              primary: //Color(0xFF3ABD6F),
              // Color.fromRGBO(37,136,166,1),
              // // set the background color 
              Color.fromRGBO(245, 140,120,0.8),
                //Color.fromRGBO(223,178,164,1),

              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
              child: Text(
              'Valider',
            style: TextStyle(fontSize: 23)),

            onPressed: () {
         
                  AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.LEFTSLIDE,
            title: 'Valider données',
            desc: 'Veuillez choisir ce qui vous convient',
            btnCancelOnPress: () {

            },
            btnOkOnPress: () {
              if(!vf){
                 AwesomeDialog(
            context: context,
            dialogType: DialogType.WARNING,
            animType: AnimType.TOPSLIDE,
             showCloseIcon: true,
             closeIcon: Icon(Icons.close_fullscreen_outlined),
            title: 'Attention',
            desc: 'Veuillez choisir l\'état',
          onDissmissCallback: (type) {
                          debugPrint('Dialog Dissmiss from callback $type');
                        },
            btnOkOnPress: () { 
                  //  Navigator.of(context).push(MaterialPageRoute(
                  //      builder: (context) => MainPage(),
                  //       )
                  //       );
               
            },
            )..show();
              }else{ 
                   Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                         )
                        );
                       // FirebaseFirestore.instance.collection('Glycemie').add({"data": "hh","test": "ds"});
                           String t = selectedTime.format(context);
                 // TimeOfDay dt = TimeOfDay.now();
                 now = new DateTime.now();
                 Timestamp myTimeStamp = Timestamp.fromDate(now); //To TimeStamp
                  String id;
                  Glycemie glyy= Glycemie(etat:_selectedTest['keyword'] , heure: t, note: vnote, taux: gly);
                  DatabaseService().sauvGly(glyy, myTimeStamp);
              //  DatabaseService().updateGly(_selectedTest['keyword'], t,vnote , gly, myTimeStamp);
                
               
                
                             // sendData(_selectedTest['keyword'], t,vnote , gly,);

              }
                  
            },
            )..show();
            

             
                 
                
                        
        
                }

              
           
            
              

            /* async{

               await showDialog<void>(
                context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Merci!'),
                  content: Text(
                      'Données bien saisit.'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('OK'),

                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                       builder: (context) => MainPage(),
                        ));

                      },
                    ),
                  ],
                  );


              }

               );
            }*/
            
             
            ),
        ],
      ),
        ],
      ),
      
  


      ),


   
    );


  }
  
  @override
  void initState() {
    _dropdownTestItems = buildDropdownTestItems(_testList);
    _timeController.text = formatDate(
        DateTime(2021, 05, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  List<DropdownMenuItem> buildDropdownTestItems(List _testList) {
    List<DropdownMenuItem> items =[];
    for (var i in _testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }


    onChangeDropdownTests(selectedTest) {
    print(selectedTest['keyword']);
    setState(() {
      _selectedTest = selectedTest;
      vf=true;
    });
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
          icon: Icons.no_food_outlined,
        time: 'ajeune',
         isSelected: one,
        ),
      );


    }
    return Text('');
  }
  
 TimeOfDay? timeSelected(TimeOfDay? t){
   return t;
 }
 

}


class Time extends StatelessWidget {

  
  const Time({
    Key? key, required this.icon, required this.time, required this.isSelected,
  }) : super(key: key);
  
  final IconData icon;
  final String time;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: 70,
        margin: EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: isSelected?Color(0xFFEBC566):Colors.grey[350],
          borderRadius: BorderRadius.circular(9),
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

            Icon(
             icon,
             color: isSelected?Colors.white:Colors.black54 ,
             size: 30,
             ),
            SizedBox(height:5),
            Text(
             time,
              style: TextStyle(color: isSelected?Colors.white:Colors.black54, 
              fontSize: 14
              
              ),
            ),
          ],

        ),
    );
  }
}
  