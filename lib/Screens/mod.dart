


// import 'package:appf/Screens/Authenticate/Login/LoginPage.dart';
// import 'package:appf/Screens/Home/ProfileScreen.dart';
// import 'package:appf/Screens/Home/homeScreen.dart';
// import 'package:appf/Screens/ListeMedecins/list.dart';
// import 'package:appf/models/PatientModel.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';


// import '../../../../../fireBase.dart';
// import '../settings.dart';
// import 'package:provider/provider.dart';



// class Editer extends StatefulWidget {
  
//   @override
//   _EditerState createState() => _EditerState();
// }
//   /* _fetchEmail() async {

//    String email;
//     final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//     final firebaseUser =_firebaseAuth.currentUser;
//     String uid = _firebaseAuth.currentUser.uid.toString();
//     if (firebaseUser != null)
//       await FirebaseFirestore.instance
//           .collection('Patient')
//           .doc(firebaseUser.uid)
//           .get()
//           .then((ds) {
//         email = ds.data['Email'];
//         print(email);
//       }).catchError((e) {
//         print(e);
//       });
//   }*/
// class _EditerState extends State<Editer> {
//    final Authenticate = _auth
//    final _formKey= GlobalKey<FormState>();
//    final TextEditingController _nameController = TextEditingController();
//    final TextEditingController _dateNaisController = TextEditingController();
//    final TextEditingController _numTelController = TextEditingController();
//    final TextEditingController _emailController = TextEditingController();
//    final TextEditingController _passwordController = TextEditingController();
//    final TextEditingController _repasswordController = TextEditingController();


//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    
  
  
//    final ImagePicker _picker = ImagePicker();
  
//   bool showPassword = false;
//   late PickedFile _imageFile;
  

//  String error ='';
//   String name ='';
//  String email ='';
//  String password ='';

 

//   @override
//   Widget build(BuildContext context) {
//      return SafeArea( 
//        child :Scaffold(
//              appBar: AppBar(
//         backgroundColor: Color.fromRGBO(11,44,135,1),
//         elevation: 1,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color:Colors.white.withOpacity(0.5),
//           ),
//           onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen(),));},
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.settings,
//               color:Colors.white.withOpacity(0.5),
//             ),
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                   builder: (BuildContext context) => SettingsPage()));
//             },
//           ),
//         ],
//       ),
//       body: Container (
//         width: double.infinity,
       
//         decoration: BoxDecoration(
//           color: Colors.white ,
      
                    
                     
//         ),
    
//         child: Column(
//           children: <Widget>[
      
//           SizedBox(height : 25),
//              imageProfile(), 
               
//             Expanded(
              
//               child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.white,
                  
                

//               ),

//               text Field
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical:20.0, horizontal:50.0),
//             child: Form(
//               key: _formKey,


//               child:SingleChildScrollView(child : Column(

                 
//                 children:<Widget>[
//                   /*FutureBuilder(
                    
//                     future: Provider.of(context).auth.getCurrentUID(),
                    
//                     builder: (context,snapshot){
//                       if(snapshot.connectionState==ConnectionState.done)
//                       {return Text("Done");}
//                       else
//                       return CircularProgressIndicator();
//                     }),*/

//                   SizedBox(height:28,),
              

//                TextFormField(
//                  validator: (val) => val!.isEmpty ? 'Entrez votre Nom et prénom ' : null,
//                  controller: _nameController,
                 
//                  decoration: InputDecoration(
//                 hintText: "Nom et prénom",
//                 hintStyle: TextStyle(color: Colors.grey),
                
//                border: InputBorder.none,
//                 icon: const Padding(
//                       padding: const EdgeInsets.only(top: 5.0),
//                       child: const Icon(Icons.person)),),
             
                
               
            
//                pour masquer le mot de passe 
//                 onChanged :(val){
                  
//                     setState(() {name = val; });

//                 }
//               ),
//                    SizedBox(height:15,),
             

//                TextFormField(
//                  validator: (val) => val!.isEmpty ? 'Entrez votre date de naissance ' : null,
//                  controller: _dateNaisController,
//                  decoration: InputDecoration(
//                 hintText: "Date de naissance",
//                 hintStyle: TextStyle(color: Colors.grey),
//                border: InputBorder.none,
//                 icon: const Padding(
//                       padding: const EdgeInsets.only(top: 5.0),
//                       child: const Icon(Icons.calendar_today),),),
             
                
               
            
//                pour masquer la date de naissance 
//                 onChanged :(val){
                  
//                     setState(() {name = val; });

//                 }
//               ),
//                  SizedBox(height: 15,),



//                   TextFormField(
//                  validator: (val) => val!.isEmpty ? 'Entrer votre Numero de Telephone ' : null,
//                  controller: _numTelController,
//                  decoration: InputDecoration(
//                 hintText: "Numero de Tel",
//                 hintStyle: TextStyle(color: Colors.grey),
//                border: InputBorder.none,
//                 icon: const Padding(
//                       padding: const EdgeInsets.only(top: 5.0),
//                       child: const Icon(Icons.lock))),
             
                
               
            
//                 obscureText: true, // pour masquer le mot de passe 
//                 onChanged :(val){
                  
//                     setState(() {password = val; });

//                 }
//               ),
//               SizedBox(height: 15,),
//                  TextFormField(
//                    validator: (val) => val!.isEmpty ? 'Entrez votre e-mail ' : null,
//                      controller: _emailController,
//                  decoration: InputDecoration(
//               hintText: "Enterez votre e-mail",
//               hintStyle: TextStyle(color: Colors.grey),
//               border: InputBorder.none,
//                icon: const Padding(
//                       padding: const EdgeInsets.only(top: 5.0),
//                       child: const Icon(Icons.email)),
             

              

              
//             ),

//                 onChanged :(val){
//                   setState(()=> email = val );


//                 }
            
//             ),
            
//             SizedBox(height:15,),
             

//                TextFormField(
//                    controller: _passwordController,
//                  validator: (val) => val!.length<8 ? 'Entrez un autre mot de passe plus long' : null,
//                  decoration: InputDecoration(
//                 hintText: "Enterez votre mot de passe",
//                 hintStyle: TextStyle(color: Colors.grey),
//                border: InputBorder.none,
//                 icon: const Padding(
//                       padding: const EdgeInsets.only(top: 5.0),
//                       child: const Icon(Icons.lock))),
             
                
               
            
//                 obscureText: true, // pour masquer le mot de passe 
//                 onChanged :(val){
                  
//                     setState(() {password = val; });

//                 }
//               ),
//               SizedBox(height:15,),
             

            
//               SizedBox(height:10,),

         



//               SizedBox(height:20,),
//                 RaisedButton(
//                     onPressed: (
                       
//                     ) {

//                       userSetup(_nameController.text, _dateNaisController.text, _numTelController.text,_emailController.text);
//                     },
//                      color: Color.fromRGBO(223,178,164,1),
//                     padding: EdgeInsets.symmetric(vertical:5,horizontal: 40),
//                     elevation: 2,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Text(
//                       "Sauvegarder",
//                       style: TextStyle(
//                           fontSize: 14,
//                           letterSpacing: 2.2,
//                           color: Colors.white),
//                     ),
//                   ),
//               RaisedButton(
//                  padding: EdgeInsets.symmetric(vertical:10,horizontal :80),
           
//                 color: Color.fromRGBO(223,178,164,1), //Color.fromRGBO(31,119,174,1),
//                 child: Text(
//                   "S'inscrire ",
//                   style: TextStyle(color: Colors.white),

//                 ),
//                 onPressed: ()async{
                 
//                  if (_formKey.currentState!.validate()) {
//                     await _firebaseAuth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                   
//                      User? updateUser = FirebaseAuth.instance.currentUser;
//                     userSetup(_nameController.text,);
//                      updateUser.updateProfile(dateNais: _nameController.text);
//                     updateUser.updateProfile(displayName: _nameController.text);
//                     userSetup(_nameController.text, _dateNaisController.text, _numTelController.text,_emailController.text);


//                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen (),)); 
//                  }
                  


//                 },


//               ),


//                 ],
//               ),
//             ),),



              
//               ),
//               ),
  
             
            




//              ) ],



//         ))
//       )
      
//    );



//   }
//   Widget imageProfile() {
  
   
   
        
//                 return Center (
//                   child :Stack(
//                   children :<Widget> [
//                     CircleAvatar(
//                       radius :60.0,
//                       backgroundImage: _imageFile == null
//               ? AssetImage("assets/images/profile.jpeg")
//               : FileImage(File(_imageFile.path)),
//         ),
//          Positioned(
//           bottom: 10.0,
//           right: 10.0,
//           child: InkWell(
//           onTap: (){
//             showModalBottomSheet(
//                 context: context,
//                 builder: ((builder) => bottomSheet()),
//               );

//           } ,

//           child: Icon( Icons.camera_alt_rounded
//           , color: Colors.indigo.shade900,size: 28.0,),  
//           )
          

//           ) ]




//     ));
//   }
//     Widget bottomSheet() {

//  return Container(
//       height: 100.0,
//       width: MediaQuery.of(context).size.width,
//       margin: EdgeInsets.symmetric(
//         horizontal: 20,
//         vertical: 20,
      
//       ), 
//       child: Column(
//         children: <Widget>[
//           Text(
//             "Choisissez une photo de profile ",
//             style: TextStyle(
//               fontSize: 20.0,
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),

//                Row(
                 
                 
//                  mainAxisAlignment: MainAxisAlignment.center, 
//       children: <Widget>[
//             FlatButton.icon(
//               icon: Icon(Icons.camera),
//               onPressed: () {
//                 takePhoto(ImageSource.camera);
//               },
//               label: Text("Camera"),
//             ),

//               SizedBox( width : 30,),
//             FlatButton.icon(
//               icon: Icon(Icons.image),
//               onPressed: () {
//                 takePhoto(ImageSource.gallery);
//               },
//               label: Text("Gallerie"),
//             ),
//           ])
      
//         ])
      
//       );
//     }

//       void takePhoto(ImageSource source) async {
        
//     final pickedFile = await _picker.getImage(
//       source: source,
//     );
//     setState(() {
//       _imageFile = pickedFile!;
//     });
//   }
// }





// /*import 'dart:io';

// import 'package:appf/Screens/Home/ProfileScreen.dart';
// import 'package:appf/Screens/settings.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class SettingsUI extends StatelessWidget {
//    @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Setting UI",
//       home: EditProfilePage(),
//     );
//   }
// }

// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   final ImagePicker _picker = ImagePicker();
//   final _formKey= GlobalKey<FormState>();
//    final TextEditingController _nameController = TextEditingController();
//    final TextEditingController _dateNaisController = TextEditingController();
//    final TextEditingController _numTelController = TextEditingController();
//    final TextEditingController _emailController = TextEditingController();
//    final TextEditingController _passwordController = TextEditingController();
//    final TextEditingController _repasswordController = TextEditingController();
  
//   bool showPassword = false;
//   PickedFile _imageFile;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(11,44,135,1),
//         elevation: 1,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color:Colors.white.withOpacity(0.5),
//           ),
//           onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProfileScreen(),));},
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.settings,
//               color:Colors.white.withOpacity(0.5),
//             ),
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                   builder: (BuildContext context) => SettingsPage()));
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 16, top: 20, right: 16),
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: ListView(
//             children: [
//               Text(
//                 "Editer Profile",
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color:Colors.black),
//               ),
//               SizedBox(
//                 height: 10,
//               ),

//               imageProfile(),
//               Center(
//                 child: Stack(
//                   children: [
//                     Container(
//                       width: 130,
//                       height: 130,
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               width: 4,
//                               color: Theme.of(context).scaffoldBackgroundColor),
//                           boxShadow: [
//                             BoxShadow(
//                                 spreadRadius: 2,
//                                 blurRadius: 10,
//                                 color: Colors.black.withOpacity(0.1),
//                                 offset: Offset(0, 10))
//                           ],
//                           shape: BoxShape.circle,
//                           image: DecorationImage(
//                               fit: BoxFit.cover,
//                               image: AssetImage("assets/images/Moh.jpeg"))),
//                     ),
//                     Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                               width: 4,
//                               color: Theme.of(context).scaffoldBackgroundColor,
//                             ),
//                             color:Color.fromRGBO(11,44,135,1),
//                           ),
//                           child: Icon(
//                             Icons.camera_alt_outlined,
//                             color: Colors.white,
//                           ),
//                         )),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//              buildTextField("Nom et Prénom", "Mehdaoui Mohammed", false),
//              buildTextField("Date de naissance", "25/08/1967", false),
//               buildTextField("E-mail", "MehMoh25@gmail.com", false),
//               buildTextField("Mot de passe", "********", true),


//               Column(children: [

//               Container(
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             border: Border(
//               bottom: BorderSide(color: Colors.grey[200])
//             )
//           ),
//           child: TextField(
            
//             decoration: InputDecoration(
//               labelText: "Nom et prénom ",
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               hintText: "Mehdaoui Mohammed",
//               hintStyle: TextStyle(color: Colors.black),
              
//               border: InputBorder.none,
//                icon: const Padding(
//                       padding: const EdgeInsets.only(top: 5.0),
//                       child: const Icon(Icons.person)),
             

              

              
//             ),
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//               border: Border(
//                   bottom: BorderSide(color: Colors.grey[200])
//               )
//           ),
//           child: TextFormField(
//             decoration: InputDecoration(
//               labelText: "Date de naissance",
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//                 hintText: "25/08/1967",
//                 hintStyle: TextStyle(color: Colors.black),
//                 border: InputBorder.none,
//                 icon: const Padding(
//                       padding: const EdgeInsets.only(top: 5.0),
//                       child: const Icon(Icons.calendar_today_rounded))),
             
                
               
//             ),
//           ),

//  Container(
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//               border: Border(
//                   bottom: BorderSide(color: Colors.grey[200])
//               )
//           ),
//           child: TextFormField(
//             decoration: InputDecoration(
//               labelText: "E-mail",
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//                 hintText: "MehMoh25@gmail.com",
//                 hintStyle: TextStyle(color: Colors.black),
//                 border: InputBorder.none,
//                 icon: const Padding(
//                       padding: const EdgeInsets.only(top: 5.0),
//                       child: const Icon(Icons.email_outlined))),
             
                
               
//             ),
//           ),
//  Container(
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//               border: Border(
//                   bottom: BorderSide(color: Colors.grey[200])
//               )
//           ),
//           child: TextFormField(
//             decoration: InputDecoration(
//               labelText: "Mot de passe",
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//                 hintText: "**********",
//                 hintStyle: TextStyle(color: Colors.black),
//                 border: InputBorder.none,
//                 icon: const Padding(
//                       padding: const EdgeInsets.only(top: 5.0),
//                       child: const Icon(Icons.lock))),
             
                
               
//             ),
//           ),






//               ],),


              
              
//               SizedBox(
//                 height: 25,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   OutlineButton(
//                     padding: EdgeInsets.symmetric(vertical :5,horizontal: 40),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     onPressed: () {},
//                     child: Text("Annuler",
//                         style: TextStyle(
//                             fontSize: 14,
//                             letterSpacing: 2.2,
//                             color: Colors.black)),
//                   ),
//                   RaisedButton(
//                     onPressed: () {},
//                      color: Color.fromRGBO(223,178,164,1),
//                     padding: EdgeInsets.symmetric(vertical:5,horizontal: 40),
//                     elevation: 2,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Text(
//                       "Sauvegarder",
//                       style: TextStyle(
//                           fontSize: 14,
//                           letterSpacing: 2.2,
//                           color: Colors.white),
//                     ),
//                   )
//                 ],
//               )

//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /*Widget buildTextField(
//       String labelText, String placeholder, bool isPasswordTextField) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 25.0),
//       child: TextField(
        
//         obscureText: isPasswordTextField ? showPassword : false,
//         decoration: InputDecoration(
         
         
//             suffixIcon: isPasswordTextField
//                 ? IconButton(
//                     onPressed: () {
//                       setState(() {
//                         showPassword = !showPassword;
//                       });
//                     },
//                     icon: Icon(
//                       Icons.remove_red_eye,
//                       color: Colors.grey,
//                     ),
//                   )
//                 : null,
//             contentPadding: EdgeInsets.only(bottom: 3),
//             labelText: labelText,
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             hintText: placeholder,
//             hintStyle: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             )),
//       ),
//     );
//   }*/
//    Widget imageProfile() {
  
   
   
        
//                 return Center (
//                   child :Stack(
//                   children :<Widget> [
//                     CircleAvatar(
//                       radius :80.0,
//                       backgroundImage: _imageFile == null
//               ? AssetImage("assets/profile.jpeg")
//               : FileImage(File(_imageFile.path)),
//         ),
//          Positioned(
//           bottom: 20.0,
//           right: 20.0,
//           child: InkWell(
//           onTap: (){
//             showModalBottomSheet(
//                 context: context,
//                 builder: ((builder) => bottomSheet()),
//               );

//           } ,

//           child: Icon( Icons.camera_alt_rounded
//           , color: Colors.indigo.shade900,size: 28.0,),  
//           )
          

//           ) ]




//     ));
//   }
//     Widget bottomSheet() {

//  return Container(
//       height: 100.0,
//       width: MediaQuery.of(context).size.width,
//       margin: EdgeInsets.symmetric(
//         horizontal: 20,
//         vertical: 20,
      
//       ), 
//       child: Column(
//         children: <Widget>[
//           Text(
//             "Choose Profile photo",
//             style: TextStyle(
//               fontSize: 20.0,
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),

//                Row(
                 
                 
//                  mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
//             FlatButton.icon(
//               icon: Icon(Icons.camera),
//               onPressed: () {
//                 takePhoto(ImageSource.camera);
//               },
//               label: Text("Camera"),
//             ),
//             FlatButton.icon(
//               icon: Icon(Icons.image),
//               onPressed: () {
//                 takePhoto(ImageSource.gallery);
//               },
//               label: Text("Gallery"),
//             ),
//           ])
      
//         ])
      
//       );
//     }

//       void takePhoto(ImageSource source) async {
        
//     final pickedFile = await _picker.getImage(
//       source: source,
//     );
//     setState(() {
//       _imageFile = pickedFile;
//     });
//   }
// }


import 'package:appf/Screens/Authenticate/Login/LoginPage.dart';
import 'package:appf/Screens/Home/homeScreen.dart';
import 'package:appf/database.dart';
import 'package:appf/models/PatientModel.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../fireBase.dart';



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   //final Authenticate = _auth
   final _formKey= GlobalKey<FormState>();
   final TextEditingController _nameController = TextEditingController();
   final TextEditingController _dateNaisController = TextEditingController();
      final TextEditingController _poids = TextEditingController();
   final TextEditingController _type= TextEditingController();

   final TextEditingController _numTelController = TextEditingController();
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
   final ImagePicker _picker = ImagePicker();
     List _testList = [{'no': 1, 'keyword': 'Type-1'},{'no': 2, 'keyword': 'Type-2 '},];
 late List<DropdownMenuItem> _dropdownTestItems;
  var _selectedTest;
  bool showPassword = false;
  late PickedFile _imageFile;
    late bool vf = false;

String poids ="";
 String error ='';
  String name ='';
 String email ='';
 String password ='';
 String type ="";
  @override
  Widget build(BuildContext context) {
     return SafeArea( child :Scaffold(
      body: Container (
        width: double.infinity,
       
        decoration: BoxDecoration(
          color: Colors.white ,
       /* gradient: LinearGradient(colors: <Color>[
          Color.fromRGBO(11,44,135,1),
          Color.fromRGBO(11,44,135,1),
          
         // Color.fromARGB(13,52,159,1),

            //Color.fromRGBO(242,240,250,1),

          /*Color.fromRGBO(72,113,218,1),
          Color.fromRGBO(93,129,223,1),

          Color.fromRGBO(115,146,227,1),*/
           /*******************************************/
                //Color.fromRGBO(110,225,221,1),
               // Color.fromRGBO(68,216,211,1),

           /*************************************** */




    //********************************************** */

         // Color.fromRGBO(41,66,216,1),	
//Color.fromRGBO(41,65,210,1),Color.fromRGBO(67,124,194,1),
/************************************************************* */
                    
                      ])*/
        
        ),
     //Color.fromRGBO(27,104,152,1 ),Color.fromRGBO(31,119,174,1) ,Color.fromRGBO(39,149,217,1),
        child: Column(
          children: <Widget>[
      
          SizedBox(height : 25),
           //  imageProfile(), 
               Center(   child:  CircleAvatar(radius: 50,  child: Icon(Icons.person, color: Colors.white, size:50),
                    backgroundColor:// Color.fromRGBO(37,136,166,1),
                     Color.fromRGBO(11,44,135,1),
),),
            Expanded(
              
              child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  
                  /*borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),*/

              ),

              // text Field
            child: Padding(
              padding: EdgeInsets.symmetric(vertical:20.0, horizontal:50.0),
            child: Form(
              key: _formKey,


              child:SingleChildScrollView(child : Column(


                children:<Widget>[
                  SizedBox(height:28,),
             

               TextFormField(
                 validator: (val) => val!.isEmpty ? 'Entrez votre Nom et prénom ' : null,
                 controller: _nameController,
                 
                 decoration: InputDecoration(
                hintText: "Nom et prénom",
                hintStyle: TextStyle(color: Colors.grey),
               // border: InputBorder.none,
                icon: const Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: const Icon(Icons.person)),),
             
                
               
            
               // pour masquer le mot de passe 
                onChanged :(val){
                  
                    setState(() {name = val; });

                }
              ),
                   SizedBox(height:15,),
             

               TextFormField(
                 validator: (val) => val!.isEmpty ? 'Entrez votre date de naissance ' : null,
                 controller: _dateNaisController,
                 decoration: InputDecoration(
                hintText: "Naissance [JJ/MM/AAAA]",
                hintStyle: TextStyle(color: Colors.grey),
               // border: InputBorder.none,
                icon: const Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: const Icon(Icons.calendar_today),),),
             
                
               
            
               // pour masquer la date de naissance 
                onChanged :(val){
                  
                    setState(() {name = val; });

                }
              ),
                 SizedBox(height: 15,),
  //  TextFormField(
  //                validator: (val) => val!.isEmpty ? 'Entrez votre date de naissance ' : null,
  //                controller: _dateNaisController,
  //                decoration: InputDecoration(
  //               hintText: "Naissance [JJ/MM/AAAA]",
  //               hintStyle: TextStyle(color: Colors.grey),
  //              // border: InputBorder.none,
  //               icon: const Padding(
  //                     padding: const EdgeInsets.only(top: 5.0),
  //                     child: const Icon(Icons.calendar_today),),),
             
                
               
            
  //              // pour masquer la date de naissance 
  //               onChanged :(val){
                  
  //                   setState(() {name = val; });

  //               }
  //             ),

    

                            //   SizedBox(height: 15,),

               TextFormField(
                 validator: (val) => val!.isEmpty ? 'Entrez votre Poids ' : null,
                 controller: _poids,
                 keyboardType: TextInputType.number,

                 decoration: InputDecoration(
                hintText: "Poids (kg) ",
                hintStyle: TextStyle(color: Colors.grey),
               // border: InputBorder.none,
                icon: const Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: const Icon(Icons.monitor_weight_outlined),),),
             
                
               
            
               // pour masquer la date de naissance 
                onChanged :(val){
                  
                    setState(() {poids = val; });

                }
              ),
                 SizedBox(height: 15,),



                  TextFormField(
                 validator: (val) => val!.length !=10 ? 'Entrer votre Numero de Telephone ' : null,
                 controller: _numTelController,
                 keyboardType: TextInputType.number,

                 decoration: InputDecoration(
                hintText: "Numero de Tel",
                hintStyle: TextStyle(color: Colors.grey),
               // border: InputBorder.none,
                icon: const Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: const Icon(Icons.phone))),
             
                
               
            // pour masquer le mot de passe 
                onChanged :(val){
                  
                    setState(() {password = val; });

                }
              ),
              SizedBox(height: 15,),
                 TextFormField(
                   validator: (val) => (val!.isEmpty || !val.contains('@')) ? 'Entrez votre e-mail ' : null,
                     
                     
                     controller: _emailController,
                 decoration: InputDecoration(
              hintText: "Enterez votre e-mail",
              hintStyle: TextStyle(color: Colors.grey),
              //border: InputBorder.none,
               icon: const Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: const Icon(Icons.email)),
             

              

              
            ),

                onChanged :(val){
                  setState(()=> email = val );


                }
            
            ),
            
            SizedBox(height:15,),
             

               TextFormField(
                   controller: _passwordController,
                 validator: (val) => val!.length<8 ? 'Entrez un autre mot de passe plus long' : null,
                 decoration: InputDecoration(
                hintText: "Enterez votre mot de passe",
                hintStyle: TextStyle(color: Colors.grey),
               // border: InputBorder.none,
                icon: const Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: const Icon(Icons.lock))),
             
                
               
            
                obscureText: true, // pour masquer le mot de passe 
                onChanged :(val){
                  
                    setState(() {password = val; });

                }
              ),
              SizedBox(height:17,),
             Row(
  children: [

    Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.grey),
                     SizedBox(width: 12.6,),

 DropdownBelow(
            itemWidth: 250,
      
             itemTextstyle: TextStyle(fontSize: 16, color: Colors.black),
           boxTextstyle: TextStyle(fontSize: 16, color:Colors.grey[800],fontWeight: FontWeight.w400, fontFamily: 'Circular'),
           boxDecoration: new BoxDecoration(
           //  color: Colors.grey[200],
           
             borderRadius: BorderRadius.circular(10) ,
             border: Border.all(color: Colors.black12),
           ),
           boxPadding: EdgeInsets.fromLTRB(17, 12, 0, 12),
           boxHeight: 48,
           boxWidth: 256.1,
          // iconSize: 23,
             hint: Text('Type Diabète', textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),
             icon: Icon(Icons.arrow_drop_down),
            value: _selectedTest,
            items: _dropdownTestItems,
            onChanged: onChangeDropdownTests,
    ),
  ],

),
              SizedBox(height:15,),

               /*TextFormField(
                 validator: (val) => (val!.length<8 ||( _passwordController.toString().compareTo(_repasswordController.toString())) ==0)? 'Reconfirmez le mot de passe ' : null,
                 controller: _repasswordController,
                 decoration: InputDecoration(
                hintText: "Comfirmez votre mot de passe",
                hintStyle: TextStyle(color: Colors.grey),
               // border: InputBorder.none,
                icon: const Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: const Icon(Icons.lock))),
             
                
               
            
                obscureText: true, // pour masquer le mot de passe 
                onChanged :(val){
                  
                    setState(() {password = val; });

                }
              ),*/
              
              SizedBox(height:10,),

           GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'forgotPass'),
                child: Container(
                  child: TextButton(
         onPressed: () { 
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginPage(),));
                    },
                   child : const Text("j'ai déjà un compte ") ,
                    
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: Colors.white))),
                ),
              ),





              SizedBox(height:20,),
              RaisedButton(
                 padding: EdgeInsets.symmetric(vertical:10,horizontal :80),
           
                color: Color.fromRGBO(223,178,164,1), //Color.fromRGBO(31,119,174,1),
                child: Text(
                  "S'inscrire ",
                  style: TextStyle(color: Colors.white),

                ),
                onPressed: ()async{

           if (_formKey.currentState!.validate()) {
                   try {
                  UserCredential userCredential=   await _firebaseAuth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                   
                     User? updateUser = FirebaseAuth.instance.currentUser;
                   
                    userSetup(_nameController.text, _dateNaisController.text, _numTelController.text,_emailController.text, _poids.text, type);
                   PatientModel pat = new PatientModel(uid: updateUser!.uid, name: _nameController.text, dateNais: _dateNaisController.text, numTel: _numTelController.text, email: _emailController.text, typeDiab: type, poids: poids);
                   
                    DatabaseService().ajoutPat(pat);
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen (),));  } on FirebaseAuthException catch (e) {
             if (e.code == 'weak-password') {
              print('The password provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
               print('The account already exists for that email.');
               showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Ce compte existe déjà"),
              content: Text("Erreur"),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });

            }
           } catch (e) {
                print(e);
                 }


                 
                 }
                  


                },


              ),


                ],
              ),
            ),),



              
              ),
              ),
  
             
            




             ) ],



        ))
      )
      
   );



  }
  Widget imageProfile() {
    
                return Center (
                  child :Stack(
                  children :<Widget> [
                    CircleAvatar(
                      radius :50.0,
                      child: Icon(Icons.person, color: Colors.white, size:50),
              //         backgroundImage: _imageFile == null
              // ? AssetImage("assets/images/profile.jpeg")
              // : FileImage(File(_imageFile.path)),
        ),
         Positioned(
          bottom: 10.0,
          right: 10.0,
          child: InkWell(
          onTap: (){
            showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );

          } ,

          // child: Icon( Icons.camera_alt_rounded
          // , color: Colors.indigo.shade900,size: 28.0,),  
          )
          

          ) ]




    ));
  }
    Widget bottomSheet() {

 return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      
      ), 
      child: Column(
        children: <Widget>[
          Text(
            "Choisissez une photo de profile ",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),

               Row(
                 
                 
                 mainAxisAlignment: MainAxisAlignment.center, 
      children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),

              SizedBox( width : 30,),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallerie"),
            ),
          ])
      
        ])
      
      );
    }

      void takePhoto(ImageSource source) async {
        
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile!;
    });
  }
 @override
  void initState() {
    _dropdownTestItems = buildDropdownTestItems(_testList);
   
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
      type = selectedTest['keyword'];
      vf=true;
    });
  }
}

