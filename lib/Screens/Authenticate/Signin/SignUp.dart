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
              
  // onPressed: () {
  //          // Navigator.pop(context);
  //   final PatientModel pat= new PatientModel(uid: "", name: "", dateNais: "", numTel: "", email:user!.email.toString() , typeDiab: "", poids: "");

  //            Navigator.of(context).push(MaterialPageRoute(
  //         builder: (context) => SignUp( pat: pat,)
  //       ));
  //         },


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
              title: Text("Cet email est déjà utilisé! "),
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

