




// import 'package:appf/Screens/Home/navigation_drawer_widget.dart';
// //import 'package:appf/Screens/Home/radial_progress.dart';
// import 'package:appf/Screens/edite_profile.dart';
// import 'package:appf/Screens/Home/Editer.dart';
// import 'package:appf/step.dart';
// import 'package:flutter/material.dart';



// class ProfileScreen extends StatelessWidget {
//   Widget build (BuildContext context){

    
//  final height = MediaQuery.of(context).size.height;

//       GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();




//   return SafeArea(
//  child :  Scaffold(
//              key: _scaffoldKey,

//       backgroundColor:   Color.fromRGBO(11,44,135,1),
          
//       bottomNavigationBar: ClipRRect(
        
//         //borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        
//         child: BottomNavigationBar(
//           iconSize: 30,
        
//           backgroundColor:  Color.fromRGBO(65, 106, 190, 1),
//           selectedIconTheme: IconThemeData(
//             color: const  Color.fromRGBO(11,44,135,1),
          
//           ),
//           unselectedIconTheme: IconThemeData(
//             color: Colors.black12,  // les boutton no selectioné en gris
//           ),
//           items: [


                
//             BottomNavigationBarItem(
//               /*icon: Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Icon(Icons.home),
//               ),*/
//               icon: IconButton(icon: Icon(Icons.home), onPressed: () {  },),
//               title: Text(
//                 "Home",
//                 style: const TextStyle(color: Colors.white),
//               ),
              
//             ),
            
          
            
//             BottomNavigationBarItem(
//               /*icon: Padding(
//                 child: Icon(Icons.person),
//                 padding: const EdgeInsets.only(top: 8.0),
//               ),*/
//               icon: IconButton(icon: Icon(Icons.person), onPressed: () {  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Editer(),)); },),
//               title: Text(
//                 "Profile",
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//               BottomNavigationBarItem(
//               icon: Padding(
//                 child: Icon(Icons.search),
//                 padding: const EdgeInsets.only(top: 8.0),
//               ),
//               title: Text(
//                 "Mesure",
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//               BottomNavigationBarItem(
//               icon: Padding(
//                 child: Icon(Icons.note_add),
//                 padding: const EdgeInsets.only(top: 8.0),
//               ),
//               title: Text(
//                 "Note",
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//             BottomNavigationBarItem(
//               icon: Padding(
//                 child: Icon(Icons.notifications),
//                 padding: const EdgeInsets.only(top: 8.0),
//               ),
//               title: Text(
//                 "Notifications",
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
            
            
//           ],
//         ),
//       ),
// body: Stack(

// children : <Widget> [

// Positioned(
// top:0, 
// height: height * 19,
// left: 0,
// right: 0,

// child: ClipRRect(
//  /* borderRadius: const BorderRadius.vertical(
//   bottom : Radius.circular(60)


//   ),*/

//     child: Container(
// color : Color.fromRGBO(11,44,135,1),
//  padding: const EdgeInsets.only(top: 20, left: 32, right: 16, bottom: 10), // hada li djay mel fo9

 
//                 child:   Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
                 
                
//                 children: [
                  
//                 Row(
                  
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
                      
//             IconButton( icon:
//                Icon(Icons.dehaze_rounded),color:
//                 Colors.white.withOpacity(0.5), 
//                 onPressed: () { 
                  
//                   Navigator.of(context).push(MaterialPageRoute(  
//                   builder: (context)=> NavigationDrawerWidget(),)); 
                  
                  
//                   },),
                   
//                       /*SizedBox(
//                         height:7,
//                       ),*/
                       
                         
                         
                    
//                     Container(
//                       width: 40,
//                       height: 40,
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
//                   ],


//                 ),
//                 Text( 
//                          "Bonjour, Mohammed", // je dois réccupérer le prénom du malade de la data base
//                         style: TextStyle(
                          
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                       ),




//                 ],
//                 )


//   ),
//   ),

// ),


// //****************** */ hada li djay felwast ************************
// Positioned(   

// top : height * 0.21,
// left : 0,
// right: 0,

 
//  child: Container(
//    decoration: BoxDecoration(color: Colors.white, 
//    borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0))
//    ),
   
   
         
// height : height ,
// padding: const EdgeInsets.only( left: 10,top :10),
//     child: Column(
     
// crossAxisAlignment: CrossAxisAlignment.start,

// children: <Widget>[
  
//   /*Text(
    
//                 "Informations", 
//                         style: TextStyle(
//                           fontWeight: FontWeight.w800,
//                           fontSize: 15,
//                           color: Colors.grey[800],
//                         ),
//   ),*/

    
//   Container(
// margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//         // hada row li fih les cases hadok sghar  te3 le poids w te3 glycémie
//    child: Row( 
//       children: <Widget> [
//         Container(

//           width : 150,
//            //margin : EdgeInsets.only(right:20),
//            height: 150,
//            decoration: BoxDecoration(
//             color: Colors.white,
//              //borderRadius: BorderRadius.all(Radius.circular(40)),
            


//            ),
           
//            child: Column( 
//            children: <Widget> [
//               Container(
//                 width : 150,
           
//            height: 75,
//            decoration: BoxDecoration(color: Colors.grey[100],
//             borderRadius: BorderRadius.vertical(top:Radius.circular(40))
           
           
//            ),
//            child: Padding(padding: const EdgeInsets.all(12.0),
          
//            child: Column(
             
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[

//             Text( "Glycémie",
                
//                 style: TextStyle(fontSize: 15 , color :   Color.fromRGBO(11,44,135,1),
//       ),

//              ) ,
             
//              ],
             
//              ),
//            ),
                
//               ),
//               Container(
//                 width : 150,
           
//            height: 75,
//            decoration: BoxDecoration(color :  Color.fromRGBO(11,44,135,1),
//             borderRadius: BorderRadius.vertical(bottom:Radius.circular(40))
           
           
//            ),
//            child: Padding(padding: const EdgeInsets.all(12.0),
          
//            child: Row(

             
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[

//             Text( "90 \n mg/mol",
                
//                 style: TextStyle(fontSize: 15 , color: Colors.white),

//              ) ,
//              SizedBox(
//                width: 5,
//              ),
            
             
//               Text( "14 avril \n 2021",
                
//                 style: TextStyle(fontSize: 15 , color: Colors.white),

//              ) ,
            
//              ],
             
//              ),
//            ),
                
//               ),
              

//              ] ,
//              ),
//            ),
//              // espace li binathom 
//            Container(

//           width : 30,
//            margin : EdgeInsets.only(right:20),
//            height: 30,
          
           
//            ),
//         Container(

//           width : 150,
//            //margin : EdgeInsets.only(right:20),
//            height: 150,
//            decoration: BoxDecoration(
//             color: Colors.white,
//              borderRadius: BorderRadius.all(Radius.circular(40)),
            


//            ),
           
//            child: Column( 
//            children: <Widget> [
//               Container(
//                 width : 150,
           
//            height: 75,
//            decoration: BoxDecoration(color: Colors.grey[100],
//             borderRadius: BorderRadius.vertical(top:Radius.circular(40))
           
           
//            ),
//            child: Padding(padding: const EdgeInsets.all(12.0),
          
//            child: Column(
             
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[

//             Text( "Poids",
                
//                 style: TextStyle(fontSize: 15 , color :  Color.fromRGBO(11,44,135,1),),

//              ) ,
             
//              ],
             
//              ),
//            ),
                
//               ),
//               Container(
//                 width : 150,
           
//            height: 75,
//            decoration: BoxDecoration(color : Color.fromRGBO(11,44,135,1),
//             borderRadius: BorderRadius.vertical(bottom:Radius.circular(40))
           
           
//            ),
//            child: Padding(padding: const EdgeInsets.all(12.0),
          
//            child: Row(

             
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[

//             Text( "85 \n kg",
                
//                 style: TextStyle(fontSize: 15 , color: Colors.white),

//              ) ,
//              SizedBox(
//                width: 30,
//              ),
            
             
//               Text( "12 avril \n 2021",
                
//                 style: TextStyle(fontSize: 15 , color: Colors.white),

//              ) ,
            
//              ],
             
//              ),
//            ),
                
//               ),
              

//              ] ,
//              ),
//            ),
         

   

// ],


// ),

//   ),

//   // espace li entre les 2 box w la box li tahthom 


// Center(
//   child: RadialProgress(),
//   )



// ],

//     ),

//  ),





// ),

// // ____________________________________ ykhlas hna _____________________________


// ],

// ),    




// )
// );


//   }
  
// }


// /*class _GlyInfoCard extends StatelessWidget
// {

// final Glucoseinfo gly;

//   const _GlyInfoCard({Key key, @required this.gly}) : super(key: key);

// Widget build ( BuildContext context )
// {

// return Container(

//   margin: const EdgeInsets.only(

//     right : 20 , 

//     bottom : 10 ,
    
//     ),
// child : Material ( 

// borderRadius: BorderRadius.all(  Radius.circular(20)),

// elevation: 4,
//  child: Column(

 
//     children: <Widget>[

//      Flexible(
//        fit: FlexFit.loose,
       
//        child:  Image. asset(gly.iconPath),
//      ),
//        Flexible(
//          fit: FlexFit.loose, 
         
//          child: Column(
            
//            children: <Widget>[


             

  

           




//            ],



//        ),
//      ),
//     ],

//  ),

// ),

// );


// }




// }*/



