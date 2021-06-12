
import 'package:appf/Screens/Authenticate/Login/LoginPage.dart';
import 'package:appf/Screens/Home/ProfileScreen.dart';
import 'package:appf/models/PatientModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
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
   final TextEditingController _numTelController = TextEditingController();
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
   final TextEditingController _repasswordController = TextEditingController();
  

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

   final ImagePicker _picker = ImagePicker();
  
  bool showPassword = false;
  late PickedFile _imageFile;
  

 String error ='';
  String name ='';
 String email ='';
 String password ='';
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
             imageProfile(), 
               
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
                hintText: "Date de naissance",
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



                  TextFormField(
                 validator: (val) => val!.isEmpty ? 'Entrer votre Numero de Telephone ' : null,
                 controller: _numTelController,
                 decoration: InputDecoration(
                hintText: "Numero de Tel",
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
              SizedBox(height: 15,),
                 TextFormField(
                   validator: (val) => val!.isEmpty ? 'Entrez votre e-mail ' : null,
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
              SizedBox(height:15,),
             

               TextFormField(
                 validator: (val) => val!.length<8 ? 'Reconfirmez le mot de passe ' : null,
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
              ),
              
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
                    await _firebaseAuth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                   
                     User? updateUser = FirebaseAuth.instance.currentUser;
                    //userSetup(_nameController.text,);
                     //updateUser.updateProfile(dateNais: _nameController.text);
                    // updateUser.updateProfile(displayName: _nameController.text);
                    userSetup(_nameController.text, _dateNaisController.text, _numTelController.text,_emailController.text);


                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen (),)); 
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
                      radius :60.0,
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

          child: Icon( Icons.camera_alt_rounded
          , color: Colors.indigo.shade900,size: 28.0,),  
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
}



