
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
    final PatientModel pat;

  const SignUp({Key? key, required this.pat}) : super(key: key);

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
   
   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
     List _testList = [{'no': 1, 'keyword': 'Type-1'},{'no': 2, 'keyword': 'Type-2 '},];
 late List<DropdownMenuItem> _dropdownTestItems;
  var _selectedTest ;
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
        appBar: AppBar(centerTitle: true,
         title: Text("modifier profile", textAlign:TextAlign.center,style: TextStyle(fontSize: 15),),),
      body: Container (
        width: double.infinity,
       
        decoration: BoxDecoration(
          color: Colors.white ,
      
        
        ),
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
                // controller: _nameController,
                  initialValue: widget.pat.name,
               
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
                  widget.pat.name = val;

                }
              ),
                   SizedBox(height:15,),
             

               TextFormField(
                // controller: _dateNaisController,
                                  initialValue: widget.pat.dateNais,

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
  

               TextFormField(
                // controller: _poids,
                  initialValue: widget.pat.poids,

                 keyboardType: TextInputType.number,

                 decoration: InputDecoration(
              //  hintText: "Poids (kg) ",
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
               //  controller: _numTelController,
                 initialValue: widget.pat.numTel,

                 keyboardType: TextInputType.number,

                 decoration: InputDecoration(
                hintText: "Numero de Tel",
                hintStyle: TextStyle(color: Colors.grey),
               // border: InputBorder.none,
                icon: const Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: const Icon(Icons.phone))),
             
                
               
            // pour masquer le mot de passe 
            
              ),
          
            
            SizedBox(height:15,),
             

              
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

         




              SizedBox(height:20,),
              RaisedButton(
                 padding: EdgeInsets.symmetric(vertical:10,horizontal :80),
           
                color: Color.fromRGBO(223,178,164,1), //Color.fromRGBO(31,119,174,1),
                child: Text(
                  "Enregistrer",
                  style: TextStyle(color: Colors.white),

                ),
                onPressed: (){
                  //PatientModel ppp= new PatientModel(uid: widget.pat.uid, name: widget.pat.name, dateNais: widget.pat.dateNais, numTel: widget.pat.numTel, email: widget.pat.email, typeDiab: widget.pat.typeDiab, poids: widget.pat.poids);
                    //DatabaseService.updatePatient(ppp,"444");

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

