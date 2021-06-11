
/*import 'package:appf/Screens/Home/ProfileScreen.dart';
import 'package:appf/Screens/settings.dart';
import 'package:flutter/material.dart';


class SettingsUI extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(11,44,135,1),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color:Colors.white.withOpacity(0.5),
          ),
          onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProfileScreen(),));},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color:Colors.white.withOpacity(0.5),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 20, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Editer Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color:Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/Moh.jpeg"))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color:Color.fromRGBO(11,44,135,1),
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
             // buildTextField("Nom et Prénom", "Mehdaoui Mohammed", false),
             // buildTextField("Date de naissance", "25/08/1967", false),
              //buildTextField("E-mail", "MehMoh25@gmail.com", false),
              //buildTextField("Mot de passe", "********", true),


              Column(children: [

              Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[200])
            )
          ),
          child: TextField(
            decoration: InputDecoration(
              labelText: "Nom et prénom ",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "Mehdaoui Mohammed",
              hintStyle: TextStyle(color: Colors.black),
              
              border: InputBorder.none,
               icon: const Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: const Icon(Icons.person)),
             

              

              
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey[200])
              )
          ),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Date de naissance",
              floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "25/08/1967",
                hintStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                icon: const Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: const Icon(Icons.calendar_today_rounded))),
             
                
               
            ),
          ),

 Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey[200])
              )
          ),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "E-mail",
              floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "MehMoh25@gmail.com",
                hintStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                icon: const Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: const Icon(Icons.email_outlined))),
             
                
               
            ),
          ),
 Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey[200])
              )
          ),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Mot de passe",
              floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "**********",
                hintStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                icon: const Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: const Icon(Icons.lock))),
             
                
               
            ),
          ),






              ],),


              
              
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(vertical :5,horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text("Annuler",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {},
                     color: Color.fromRGBO(223,178,164,1),
                    padding: EdgeInsets.symmetric(vertical:5,horizontal: 40),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Sauvegarder",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  /*Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: TextField(
        
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
         //
         
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }*/
}*/