import 'package:appf/Screens/Home/homeWidget.dart';
import 'package:appf/Screens/Home/navigation_drawer_widget.dart';
import 'package:appf/Screens/Home/tabbar_material_widget.dart';
//import 'package:appf/Screens/Home/radial_progress.dart';
import 'package:appf/Screens/edite_profile.dart';
import 'package:appf/Screens/Home/Editer.dart';
import 'package:appf/page/newPage.dart';
import 'package:appf/step.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {  
        GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  
   int index = 0;
       final pages = <Widget>[
         home(),
  ];
      
  @override
  Widget build(BuildContext context) {
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
  
  /*Text(
    
                "Informations", 
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Colors.grey[800],
                        ),
  ),*/

    
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
                width : 140,
           
           height: 75,
           decoration: BoxDecoration(color: Colors.grey[100],
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
                              image: AssetImage("assets/images/glycemie.png"))),
                    ),),
             SizedBox(height: 3),
             
             
            Text( "Glycémie",
                
                style: TextStyle(fontSize: 15 , color :   Color.fromRGBO(11,44,135,1),
      ),

             ) ,
             ],
             
             ),
           ),
                
              ),
              Container(
                width : 140,
           
           height: 75,
           decoration: BoxDecoration(color :  Color.fromRGBO(11,44,135,1),
            borderRadius: BorderRadius.vertical(bottom:Radius.circular(40))
           
           
           ),
           child: Padding(padding: const EdgeInsets.all(12.0),
          
           child: Row(

             
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[

            Text( "90 \n mg/mol",
                
                style: TextStyle(fontSize: 15 , color: Colors.white),

             ) ,
             SizedBox( 
               width: 5,
             ),
            
             
              Text( "14 avril \n 2021",
                
                style: TextStyle(fontSize: 15 , color: Colors.white),

             ) ,
            
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
                width : 150,
           
           height: 75,
           decoration: BoxDecoration(color: Colors.grey[100],
            borderRadius: BorderRadius.vertical(top:Radius.circular(40))
           
           
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
             SizedBox(height: 3),
               Text( "Poids",
                
                style: TextStyle(fontSize: 15 , color :  Color.fromRGBO(11,44,135,1),),

             ) ,

                   
               
             
             ],
             
             ),
           ),
                
              ),
              Container(
                width : 150,
           
           height: 75,
           decoration: BoxDecoration(color : Color.fromRGBO(11,44,135,1),
            borderRadius: BorderRadius.vertical(bottom:Radius.circular(40))
           
           
           ),
           child: Padding(padding: const EdgeInsets.all(12.0),
          
           child: Row(

             
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[

            Text( "85 \n kg",
                
                style: TextStyle(fontSize: 15 , color: Colors.white),

             ) ,
             SizedBox(
               width: 30,
             ),
            
             
              Text( "12 avril \n 2021",
                
                style: TextStyle(fontSize: 15 , color: Colors.white),

             ) ,
            
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


Center(
  child: RadialProgress(),
  )



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



 
  
}


