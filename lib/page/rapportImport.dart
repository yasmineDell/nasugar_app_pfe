import 'package:appf/api/firebase_api.dart';
import 'package:appf/database.dart';
import 'package:appf/modules/Analys.dart';
import 'package:appf/widget/bouton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:core';

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:unicorndial/unicorndial.dart';

enum UrlType { IMAGE, PDF, UNKNOWN,PNG }


class RapImport extends StatefulWidget {
  const RapImport({ Key? key }) : super(key: key);

  @override
  _RapImportState createState() => _RapImportState();
}

class _RapImportState extends State<RapImport> {
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


  @override
  Widget build(BuildContext context) {
    Analyse analyse = new Analyse(urlAnalyse: '', name: '', email: '', id:'');
        final fileName = file != null ? basename(file!.path) : 'Pas de fichier séléctionné';

    return Scaffold(
       appBar: AppBar(centerTitle: true,
         title: Text("Analyses", textAlign:TextAlign.center,style: TextStyle(fontSize: 19),),
         actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'valider',
            onPressed: () {
            Navigator.pop(context);
          },)
          ]
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: (fileName == "Pas de fichier séléctionné"),
                child: 
              ButtonWidget(
                text: 'Choisir fichier' ,
                icon: Icons.attach_file,
                onClicked: selectFile,
                
              ),),
              SizedBox(height: 8),
                
              Text(
                fileName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(70, 113, 198, 1)),
              ),
              SizedBox(height: 48),
              
              Visibility(
                maintainAnimation: false,
                visible: (fileName != "Pas de fichier séléctionné"),
                child: 
              ButtonWidget(
                text: 'Enregistrer le fichier',
                icon: Icons.cloud_upload_outlined,
                onClicked:() async {
                  analyse= await uploadFile();
                    DateTime now = new DateTime.now();
                 Timestamp myTimeStamp = Timestamp.fromDate(now); //To TimeStamp
                  DatabaseService().ajoutAnalyse(myTimeStamp, analyse);
                } 
              ), ),
              SizedBox(height: 20),
              task != null ? buildUploadStatus(task!) : Container(),
             
             
             
            ],
            
          ),
        ),
      ),
    );
  }
UrlType getUrlType(String url) {
  Uri uri = Uri.parse(url);
  String typeString = uri.path.substring(uri.path.length - 3).toLowerCase();
  if (typeString == "jpg" ) {
    return UrlType.IMAGE;
  }
  if (typeString == "pdf") {
    return UrlType.PDF;
  }
  
   else {
    return UrlType.UNKNOWN;
  }
}

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future<Analyse> uploadFile() async {
    Analyse analyse = new Analyse(urlAnalyse: "", name: "", email: "", id: '');
    if (file == null) return analyse;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return analyse;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
      analyse.name=fileName;
      analyse.urlAnalyse=urlDownload;
    print('Download-Link: $urlDownload');
      print(getUrlType(urlDownload));

      final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
      String email = _firebaseAuth.currentUser!.email.toString();
      analyse.email=email;
    return analyse;
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
  }
  
