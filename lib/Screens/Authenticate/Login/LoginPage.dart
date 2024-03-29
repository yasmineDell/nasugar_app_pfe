
import 'package:appf/Provider/google_sign_in.dart';
import 'package:appf/Screens/Authenticate/Signin/SignUp.dart';
import 'package:appf/Screens/Home/ProfileScreen.dart';
import 'package:appf/Screens/Home/homeScreen.dart';
import 'package:appf/urils/MyCustomWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   final _formKey= GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;



 bool _isLoggedIn = false;
  late GoogleSignInAccount _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();


 String error ='';
 String email ='';
 String password ='';
  @override
  Widget build(BuildContext context) {
   // LoginService loginService = LoginService();
    return SafeArea( child :Scaffold(
      body: Container (
        width: double.infinity,
        decoration: BoxDecoration(
        //color: Color.fromRGBO(27,104,152,1 ) //fromRGBO(31,119,174,1)   //(39,149,217,1), //fromRGBO(110, 120, 247, 1),
 gradient: LinearGradient(colors: <Color>[/*Color.fromRGBO(27,104,152,1 ),Color.fromRGBO(31,119,174,1) ,Color.fromRGBO(39,149,217,1),*/

          Color.fromRGBO(11,44,135,1),
          Color.fromRGBO(11,44,135,1),
         // Color.fromRGBO(19, 36, 64, 1),
     //      Color.fromRGBO(19, 36, 64, 1),

                      ])
        ),

        child: Column(
          children: <Widget>[

          Padding(
            padding: EdgeInsets.all(20),

            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,

            children:<Widget>[
              SizedBox(
                height:60,
              ),

              // Center(
              //   child: Text("Connexion",style:TextStyle(color:Colors.white.withOpacity(0.5)/* Colors.white.withOpacity(0.5)*/,fontSize: 24,fontWeight: FontWeight.bold))
              // ),







            ]
            ),




          ),

            // SizedBox(height: 30,),
          Center(
            child:
          
            
            Row(
              children:[

                SizedBox(width:130),
  Container(
              child: Text("Connexion",style:TextStyle(color:Colors.white.withOpacity(0.5)/* Colors.white.withOpacity(0.5)*/,fontSize: 27,fontWeight: FontWeight.bold)),
              height: 100,
              width: 200,

              // decoration : BoxDecoration(
              //   // image: DecorationImage(

              //   //   image: AssetImage("assets/images/loGo.jpeg"),
              //   //   fit : BoxFit.cover,
              //   // )

              // )
            ),

              ]
            )
            
           
          ),

            SizedBox(
                height:30,
              ),
            Center(
            child: Text("Bienvenue sur NaSugr", style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 20),),
            ),
              SizedBox(
                height:20,
              ),

        Expanded(

              child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),

              ),

              // text Field
            child: Padding(
              padding: EdgeInsets.symmetric(vertical:20.0, horizontal:50.0),
            child: Form(


              child: SingleChildScrollView(child :Column(


                children:<Widget>[
                 SizedBox(height: 40,),

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
            SizedBox(height:25,),


               TextFormField(
                    validator: (val) => val!.length<8 ? 'Reentrez votre mot de passe ' : null,
                     controller: _passwordController,
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
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
               GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'forgotPass'),
                child: Container(
        //           child: TextButton(
        //  onPressed: () {
        //              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginPage(),));
        //             },
        //            child : const Text("Mot de passe oublié?",style: TextStyle(fontSize: 12),) ,

        //           ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: Colors.white))),
                ),
              ),
              // Créer un nouveau compte
               GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'SignUp'),
                child: Container(
                  child: TextButton(
         onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUp(),));
                    },
                   child : Text("Créer un nouveau compte",style: TextStyle(fontSize: 12),) ,

                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: Colors.white))),
                ),
              ),

              ]
              ),
              SizedBox(height:20,),
             /* RaisedButton(
                color: Color.fromRGBO(110, 120, 247, 1),
                child: Text(
                  "Se connecter ",
                  style: TextStyle(color: Colors.white),

                ),
                onPressed: ()async{


                   if (_formKey.currentState.validate()) {
                    await _firebaseAuth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text) .then((value) => print('Login Successful'));

                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen (),));
                 }


                },


              ),*/
               RaisedButton(
                 padding: EdgeInsets.symmetric(vertical:10,horizontal :80),

                color: Color.fromRGBO(223,178,164,1), //Color.fromRGBO(31,119,174,1),
                child: Text(
                  "Se connecter ",
                  style: TextStyle(color: Colors.white),

                ),
                onPressed: ()async{

               try {
  UserCredential userCredential=  await _firebaseAuth
                                .signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text) ;
                                    print(userCredential); // celui là affiche le uid
                                    print("signed in ");
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen(),/*ProfileScreen ()*/));
                              //   SecondClass();
              
                           
                                                               }
                                     on FirebaseAuthException catch (e) {
                             if (e.code == 'user-not-found') {
                               print('No user found for that email.');
                           
                              showDialog(
                                     context: context,
                                     builder: (BuildContext context) {
                                       return AlertDialog(
                                         title: Text("Cet utilisateur n'existe pas"),
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
                           
                             } else if (e.code == 'wrong-password') {
                               print('Wrong password provided for that user.');
                           
                              showDialog(
                                     context: context,
                                     builder: (BuildContext context) {
                                       return AlertDialog(
                                         title: Text("Mot de passe incorrecte"),
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
                           }
                           
                           
                           
                           
                           
                           
                           
                           
                                           },
                           
                           
                                         ),
                                     //     IconButton(
                                     //   icon:FaIcon(FontAwesomeIcons.google,color: Color.fromRGBO(223,178,164,1),),
                                     //   onPressed: () async {
                                     //     /*bool success = await loginService.signInWithGoogle();
                           
                                     //             if (success) {
                                     //               Navigator.push(context, MaterialPageRoute(builder:(context)=> ProfileScreen( )));
                                     //           }
                                     //     /* _googleSignIn.signIn().then((userData) {
                                     //             setState(() {
                                     //               _isLoggedIn = true;
                                     //               _userObj = userData;
                                     //             });
                                     //           }).catchError((e) {
                                     //             print(e);
                                     //           });*/*/
                                     //   },
                                     // ),
                           
                           
                           
                           
                                        /* Expanded(
                           
                                                 child: ElevatedButton(
                           
                                           child: Text(
                                             "Se connecter ",
                                             style: TextStyle(color: Colors.white),
                           
                                           ),
                                                     onPressed: () async {
                                                           await _firebaseAuth
                                                           .signInWithEmailAndPassword(
                                                               email: _emailController.text,
                                                               password: _passwordController.text)
                                                           .then((value) => print('Login Successful'));
                                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen (),));
                           
                                                     },
                                                    )),*/
                           
                           
                           
                                           ],
                                         ),)
                                       ),),
                           
                           
                           
                           
                                         ),
                                         ),
                                   ],),
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                                   ),
                           
                           
                              ),
                               );
                             }
                           }
                           
                           class SecondClass {
}

/*import 'package:flutter/material.dart';

import 'Header.dart';
import 'InputWrapper.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color.fromRGBO(65, 106, 190, 1),
             Color.fromRGBO(65, 106, 190, 1),
             Color.fromRGBO(65, 106, 190, 1),


          ]),
        ),
        child: Column(
          children: <Widget>[
            Header(),

            SizedBox(height: 50,),

            Expanded(

              child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )
              ),
              child: InputWrapper(),
            )
            )
          ],
        ),
      ),
    );
  }
}*/
