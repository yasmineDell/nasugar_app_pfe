import 'dart:io';
import 'package:path/path.dart';

import 'package:flutter/material.dart';

class ImageViewr extends StatefulWidget {
  //const ImageViewr({ Key? key }) : super(key: key);
     

  //   final File file;
     final String url;
     final String url1;
      const ImageViewr({
    Key? key,
     required this.url, required this.url1,
  }) : super(key: key);

  @override
  _ImageViewrState createState() => _ImageViewrState();
}

class _ImageViewrState extends State<ImageViewr> {
 //var src = "https://firebasestorage.googleapis.com/v0/b/myfb-f304c.appspot.com/o/files%2F392x696bb%20(1).jpg?alt=media&token=f1c0cb4a-85c6-4408-a958-3b4a3a8ae1ce";
  @override
  Widget build(BuildContext context) {
       // final name = basename(widget.file.path);

    return Scaffold(
      appBar: AppBar(centerTitle: true,
         title: Text(  widget.url, textAlign:TextAlign.center,style: TextStyle(fontSize: 19),),
        
      ),
     body:
     Container(child:Image.network(
       widget.url1,
     
      fit: BoxFit.cover,
  ), )
     );
  }
}