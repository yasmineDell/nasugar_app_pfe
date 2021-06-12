import 'package:appf/Screens/Home/navigation_drawer_widget.dart';
import 'package:appf/api/firebase_api.dart';
import 'package:appf/widget/bouton.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';





class Rapport_Analyse extends StatefulWidget {
  const Rapport_Analyse({ Key? key }) : super(key: key);

  @override
  _Rapport_AnalyseState createState() => _Rapport_AnalyseState();
}

class _Rapport_AnalyseState extends State<Rapport_Analyse> {
   static final String title = 'Firebase Upload';
  UploadTask? task;
  File? file;

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
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'Pas de fichier séléctionné';

    return Scaffold(
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
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: 'Choisir fichier' ,
                icon: Icons.attach_file,
                onClicked: selectFile,
                
              ),
              SizedBox(height: 8),
              Text(
                fileName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(70, 113, 198, 1)),
              ),
              SizedBox(height: 48),
              ButtonWidget(
                text: 'Télécharger le fichier',
                icon: Icons.cloud_upload_outlined,
                onClicked: uploadFile,
              ),
              SizedBox(height: 20),
              task != null ? buildUploadStatus(task!) : Container(),
            ],
          ),
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
  }
  
