import 'package:appf/Screens/graphics/Graph.dart';
import 'package:appf/Screens/graphics/graphics.dart';
import 'package:appf/page/TodaysData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sortedmap/sortedmap.dart';

import '../viewProfile.dart';
import 'Editer.dart';

class TabBarMaterialWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;


  const TabBarMaterialWidget(Widget pag, {
     required this.index,
    required this.onChangedTab,

     Key? key,
  }) : super(key: key);

  @override
  _TabBarMaterialWidgetState createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {
      late Map<DateTime,double> map=new SortedMap(Ordering.byKey());

  @override
  Widget build(BuildContext context) {
    final placeholder = Opacity(
      opacity: 0,
      child: IconButton(icon: Icon(Icons.no_cell), onPressed: null),
    );

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         
          buildTabItem(
            index: 0,
            icon: Icon(Icons.home_outlined),
          ),
           IconButton(
            icon: Icon(Icons.bar_chart_outlined),
             onPressed: () {  
                     map= test(context, map);

                   Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SplineTypes(map: map,), /*Graphes()*/));
             },
          
          ),
          placeholder,
          IconButton(
            icon: Icon(Icons.today_outlined),
             onPressed: () {  
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TodaysData()));
             },
          
          ),
         IconButton(
            icon: Icon(Icons.person_outline_outlined),
             onPressed: () {  
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => viewProfil()));
             },
          
          ),
        ],
      ),
    );
  }
     Map<DateTime,double> test(context, Map<DateTime,double> tL){
                    final user = FirebaseAuth.instance.currentUser;
                    int i=1;
                    double s=0;
                    DateTime dd;
     // if(tL.isEmpty){
         FirebaseFirestore.instance
    .collection('Glycemie')
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          
            if(doc["email"]== user!.email){
              print(doc["taux"]);
              
             DateTime d= doc["date"].toDate();
           // tL.add(doc["taux"]);
           tL[d] = doc["taux"];
            //print(user.email);
          }
          });
          
    
           // print(tL.length);
            
          //  myData.add(doc["taux"]);
          
        });

        Map<DateTime,double> newMap={};
        List<DateTime> liste =[];
        List<DateTime> liste2 =[];
        List<double> liste3 =[];

             tL.forEach((k,v) {
               liste.add(k);}); 
            // 
              //  for(int j=1;j<=liste.length;j++){
              //    if(liste2[j-1].day!=liste[j].day){
              //       liste2[j]=liste[j];
              //    }
              //  }

        if(liste.isNotEmpty){
          print("liste "+liste[0].toString());
          liste2.add(liste[0]);
          int x=0;
          if(liste2.isNotEmpty){
             for(int j=0;j<liste.length;j++){
                 if(liste2[x].day!=liste[j].day){
                   liste2.add(liste[j]);
                   x++;
               }
             // print(liste[j]);
                }

                for(int j=0;j<liste2.length;j++){
                  tL.forEach((key, value) {

                    if(liste2[j].day==key.day){
                        s=s+value;
                        i++;
                    }
                   });
                   s=s/i;  
                   i=0;
                   liste3.add(s);                
                      s=0;

                }

                for(int j=0;j<liste3.length;j++){
                  newMap[liste2[j]]=liste3[j];
                }                 
                return newMap;

               // print(liste3);
          }
          
            
        }
   
  
    return tL;
        }
  Widget buildTabItem({
    required int index,
    required Icon icon,
  }) {
    final isSelected = index == widget.index;

    return IconTheme(
      data: IconThemeData(
        color: isSelected ?           Color.fromRGBO(65, 106, 190, 1)
 : Colors.black,
      ),
      child: IconButton(
        icon: icon,
        onPressed: () => widget.onChangedTab(index),
      ),
    );
  }
}
