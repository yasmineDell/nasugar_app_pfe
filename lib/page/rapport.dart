import 'package:appf/Screens/Home/navigation_drawer_widget.dart';
import 'package:appf/api/firebase_api.dart';
import 'package:appf/api/pdf_api.dart';
import 'package:appf/modules/Analys.dart';
import 'package:appf/modules/Glycemie.dart';
import 'package:appf/page/image_viewer_page.dart';
import 'package:appf/page/pdf_viewer_page.dart';
import 'package:appf/page/rapportImport.dart';
import 'package:appf/urils/constant.dart';
import 'package:appf/urils/loading.dart';
import 'package:appf/widget/bouton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'dart:core';

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:unicorndial/unicorndial.dart';

import '../database.dart';





class Rapport_Analyse extends StatefulWidget {
  const Rapport_Analyse({ Key? key }) : super(key: key);

  @override
  _Rapport_AnalyseState createState() => _Rapport_AnalyseState();
}

class _Rapport_AnalyseState extends State<Rapport_Analyse> {
   static final String title = 'Firebase Upload';
  UploadTask? task;
  File? file;
     bool vf =false;
 


  Future rapp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp();

 // runApp(MyApp());
}

 @override
void initState() { 
  super.initState();
  
}
void showPanel(){
}
bool isImage(String path) {
  final mimeType = lookupMimeType(path);

  return mimeType!.startsWith('image/');
}
UrlType getUrlType(String url) {
  Uri uri = Uri.parse(url);
  String typeString = uri.path.substring(uri.path.length - 3).toLowerCase();
  if (typeString == "jpg") {
    return UrlType.IMAGE;
  }
  if (typeString == "pdf") {
    return UrlType.PDF;
  } else {
    return UrlType.UNKNOWN;
  }
}

  @override
  Widget build(BuildContext context) {
                final user = FirebaseAuth.instance.currentUser;

    final fileName = file != null ? basename(file!.path) : 'Pas de fichier séléctionné';
      // final floatingButtons = List<UnicornButton>();
       List <UnicornButton> floatingButtons=[];
    floatingButtons.add(
      UnicornButton(
        hasLabel: true,
                labelHasShadow: false,

        labelText: "Attachment",
        currentButton: FloatingActionButton(
          heroTag: "attachment",
          backgroundColor:  Colors.grey[600],
          mini: true,
          child: Icon(Icons.attach_file),
          onPressed: () {
            print('Attachment FAB clicked');
             Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>RapImport(), // Analyses(),
        ));
          },
        ),
      ),
    );
   /* floatingButtons.add(
      UnicornButton(
        hasLabel: true,
        labelText: "Camera",
        labelHasShadow: false,
       // labelBackgroundColor: Colors.black38,
        currentButton: FloatingActionButton(
          onPressed: () {
            print('Camera FAB clicked');
          },
          heroTag: "camera",
          backgroundColor: Colors.grey[600],

          mini: true,
          child: Icon(Icons.photo_camera, color: Colors.white,),
        ),
      ),
    );
    */
    var ana;
        return  StreamProvider<List<Analyse>>.value(
     // catchError: (_, __) => nn,
          
          value: DatabaseService().analyse, 
         // initialData: null,
           initialData:  ana,
       child:  
     Scaffold(
      floatingActionButton: UnicornDialer(
          backgroundColor: Colors.black38,
          parentButtonBackground: Color.fromRGBO(29, 194, 95, 1),
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.add),
          childButtons: floatingButtons),
          drawer: NavigationDrawerWidget(),

        appBar: AppBar(centerTitle: true,
         title: Text("Analyses", textAlign:TextAlign.center,style: TextStyle(fontSize: 19),),
         actions: <Widget>[
            
            IconButton(
            icon: const Icon(Icons.cancel_outlined),
            tooltip: 'annuler',
            onPressed: () {
            Navigator.pop(context);
          },
          )
          ]
      ),

      body:  StreamBuilder(    
     

        stream: FirebaseFirestore.instance.collection('Analyse').where('email',isEqualTo: user!.email).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
         // citiesRef.where('country', 'in', ['USA', 'Japan']);

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } 
  
         return  ListView(
           children: snapshot.data!.docs.map((document)
           {return  Padding(
             padding: const EdgeInsets.only(top: 8.0),
             child: GestureDetector(

            onTap: () { 
         //     print(user['uid']);
              if (user != null) {
  String? name = user.displayName;
  String? email = user.email;
  print(name);
  print(''+email!);
 // System.Uri photo_url = user.PhotoUrl;
  // The user's Id, unique to the Firebase project.
  // Do NOT use this value to authenticate with your backend server, if you
  // have one; use User.TokenAsync() instead.
 // String? uid = user!.UserId;
}
          
 
            } ,
                child: 
                
                Card(
                     margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
                     borderOnForeground: false,
                 // width: MediaQuery.of(context).size.width/1.2,
                 // height: MediaQuery.of(context).size.height/6,
                  child:// 

                //  )
                  ListTile( leading:
                    (getUrlType(document['urlAnlayse'])== UrlType.IMAGE  )?
                    
                                          Image.network(document['urlAnlayse']):

                 
                     Icon(Icons.picture_as_pdf),
                    
                

                         title: 
                          
                         Text(document['name'].toString()
                        ,
                         style:TextStyle(fontSize: 14.5) ,
                         ),

                        onTap: (){
                         showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[Column( children: [SizedBox(height: 27),

                          Text('Détails:'.toUpperCase(), style: TextStyle(fontSize: 17),),
                                                                        SizedBox(height: 45),
                                                                      

                            Row(
                              children: [
                                              SizedBox(width: 59),

                  SizedBox(
                    width:129,
                    child:   ElevatedButton(
                
              style: ElevatedButton.styleFrom(
                primary:Colors.redAccent,
                
                // Color.fromRGBO(29, 194, 95, 1),
                  minimumSize: Size.fromHeight(40), 
                  
                  ),
                    onPressed: () {
                          final user = FirebaseAuth.instance.currentUser;

                        final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
                       String uid = _firebaseAuth.currentUser!.uid.toString();  
                            mydialog(context,
                                title: "Suppression",
                                content: "Voulez-vous supprimer ",
                                ok: () async {
                              Navigator.of(context).pop();
                              loading(context);
                              bool delete =
                                    
                                  await DatabaseService().deleteAnalyse(document['id']);
                                  print(FirebaseAuth.instance.currentUser!.uid);
                                 Navigator.of(context).pop();

                              if (delete != null) {
                                Navigator.of(context).pop();
                              }
                            });
                          },
                 child: Text("Supprimer", style:TextStyle(fontSize: 16) ,),
      ),
                  ),
                                SizedBox(width: 10),

           SizedBox(
                    width:129,
                    child:   ElevatedButton(
                
              style: ElevatedButton.styleFrom(
                primary:// Colors.red,
               // Color.fromRGBO(29, 194, 95, 1),
               Colors.grey[500],
                  minimumSize: Size.fromHeight(40), 
                  
                  ),
                  onPressed:() async {
                    final url = 'files/'+document['name'];
                    final file = await PDFApi.loadFirebase(url);

                    if(file == null) return ;

                    if( getUrlType(document['urlAnlayse'])== UrlType.IMAGE) {
                      openImage(context, 'files/'+document['name'],document['urlAnlayse']);
                      print(document['urlAnlayse']);
                    }
                    else{
                        openPDF(context,file);

                    }
                  } ,
                 child: Text("Visionner", style:TextStyle(fontSize: 16) ,),
      ),
                  ),
                 ]
                            ),
    SizedBox(height: 45), ] ,  )                                 
   ]
                          
                           );
                        }
                          );
                    
                  
                        })

                 
             ),      
              ),);
         
          
          
        
           }
         ).toList(),
           
        );
        }
      ),

     ),
    );

  }


  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(70, 113, 198, 1)),
            );
          } else {
            return Container();
          }
        },
      );

   void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );

      void openImage(BuildContext context, String str, String str2) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ImageViewr( url: str,url1: str2)),);
  }
  
