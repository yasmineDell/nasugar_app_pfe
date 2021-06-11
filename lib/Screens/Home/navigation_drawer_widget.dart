import 'package:appf/Screens/ListeMedecins/list.dart';
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
   String name,
  String email,
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
   String text,
     IconData icon,
    VoidCallback onClicked,
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
