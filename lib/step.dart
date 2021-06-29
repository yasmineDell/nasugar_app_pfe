
import 'package:appf/database.dart';
import 'package:appf/modules/act_phy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/src/material/icons.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pedometer/pedometer.dart';
import 'package:vector_math/vector_math_64.dart' as math;

import 'main.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}



/*class StepCounter extends StatefulWidget {
  @override
  _StepCounterState createState() => _StepCounterState();
}

class _StepCounterState extends State<StepCounter> {
   Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Container(

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[





              Text(
                'Steps taken:',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                _steps,
                style: TextStyle(fontSize: 60),
              ),
              Divider(
                height: 100,
                thickness: 0,
                color: Colors.white,
              ),
              Text(
                'Pedestrian status:',
                style: TextStyle(fontSize: 30),
              ),
              Icon(
                _status == 'walking'
                    ? Icons.directions_walk
                    : _status == 'stopped'
                        ? Icons.accessibility_new
                        : Icons.error,
                size: 100,
              ),
              Center(
                child: Text(
                  _status,
                  style: _status == 'walking' || _status == 'stopped'
                      ? TextStyle(fontSize: 30)
                      : TextStyle(fontSize: 20, color: Colors.red),
                ),
              )
            ],
          ),
        ),

    );
  }
}*/


class RadialProgress extends StatefulWidget {
  final double goalCompleted = 0.8;


  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _radialProgressAnimationController;
  late Animation<double> _progressAnimation;
  final Duration fadeInDuration = Duration(milliseconds: 500);
  final Duration fillDuration = Duration(seconds: 2);
  var date1 = DateTime.now();

  Actphy act = Actphy(date: "", e_pat: "", nb_pas: 0);
  int nb=0;





  double progressDegrees = 0;
  var count = 0;


   late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = 'arret', _steps = '?';

  /*void initState1() {
    super.initState();
    initPlatformState();
  }*/
    void sendNotification() {

    flutterLocalNotificationsPlugin.show(0,
     'Bravo!!! ',
      'Vous avez atteind votre goal du jour!',
       NotificationDetails(
         android:AndroidNotificationDetails(
           channel.id,
           channel.name,
           channel.description,
           importance: Importance.high,
           color: Colors.blue,
           playSound: true,
           icon: '@mipmap/ic_launcher'
         ) )

       );

  }



  void onStepCount(StepCount event) {
    print(event);
    setState(() {
                    final user = FirebaseAuth.instance.currentUser;

      DateTime now = DateTime.now();
      _steps = event.steps.toString();
      act.nb_pas = event.steps;
      act.date=  "${now.day}/${now.month}/${now.year}";
      act.e_pat= user!.email!;

        DateTime t = DateTime(12,40);
        int diff = difference(t, DateTime.now());

       if(DateTime.now().isAfter(t) && nb == 0 ){
          nb=1;
        DatabaseService().ajoutAct(act);
      }
      
      print(act.date);
      print(act.e_pat);
      print(act.nb_pas);
      if(event.steps==8000){
        sendNotification();
      }
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  void reset() {
    setState(() {
    //  int steps = 0;
     // steps = 0;
     // _steps = resetPedo(_steps);

    });
  }
  @override
  void initState() {
    super.initState();
    initPlatformState();
    _radialProgressAnimationController =
        AnimationController(vsync: this, duration: fillDuration);
    _progressAnimation = Tween(begin: 0.0, end: 360.0).animate(CurvedAnimation(
        parent: _radialProgressAnimationController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {
          progressDegrees = widget.goalCompleted * _progressAnimation.value;
        });
      });

    _radialProgressAnimationController.forward();
  }


  @override
  void dispose() {
    _radialProgressAnimationController.dispose();
    super.dispose();
  }

  int difference(date1 , date2){
    return date2.difference(date1).inDays;

  }

// la méthode qui initialise le step counter chaque jour
String  resetPedo(String s)
{
  var duration;
    int i= duration.inDays ;
    int diff = difference(date1, DateTime.now());
    
    if (diff < 1  ) {
  print("hello ");

 _steps = "0" ;
 return _steps;


}
return s;

}



  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 190.0,
        width: 190.0,
        padding: EdgeInsets.symmetric(vertical: 40.0),
        child: AnimatedOpacity(
          opacity: progressDegrees > 30 ? 1.0 : 0.0,
          duration: fadeInDuration,
          child: Column(
            children: <Widget>[
                 Text(
                'Nombre de pas:',
                style: TextStyle(fontSize: 16),
              ),
              Text(

                _steps.toString() ,
                style: TextStyle(fontSize: 19),
              ),
              // Divider(
              //   // //height: 100,
              //   

              // ),
              // Divider(
              //   thickness: 1,
              //    color: Colors.white,

              // ),
              SizedBox(
                height:9
              ),
              Text(
                'Votre état',
                style: TextStyle(fontSize: 16 , color: Colors.black),
              ),
              Icon(
                _status == 'marche'
                    ? Icons.directions_walk

                    : _status == 'arret'
                        ? Icons.accessibility_new
                        : Icons.error,
                size: 21,
                color: Colors.blue,
              ),
              Center(
                child: Text(
                  _status,
                  style: _status == 'marche' || _status == 'arret'
                      ? TextStyle(fontSize: 14)
                      : TextStyle(fontSize: 14, color: Colors.blue ),
                ),
              )
              /*Text(
                'Objectif : 6000 ', // on prend la valeur saisi par le malade
                style: TextStyle(fontSize: 15.0, letterSpacing: 1.5 ,color: Colors.grey[400]),
              ),
              SizedBox(
                height: 4.0,
              ),

                  Container(
                height: 2.0,
                width: 80.0,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(65, 106, 190, 1),
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
              ),

              SizedBox(
                height: 4.0,
              ),
             Container(
                child: Icon(Icons.directions_walk_rounded,),
                //padding: const EdgeInsets.only(top: 8.0),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                '3000',
                style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.indigo.shade900),
              ),
              Text(
                'step',
                style: TextStyle(
                    fontSize: 14.0, color: Colors.blue, letterSpacing: 1.5),
              ),*/
            ],
          ),
        ),
      ),
      painter: RadialPainter(progressDegrees),
    );
  }
}

class RadialPainter extends CustomPainter {
  double progressInDegrees;

  RadialPainter(this.progressInDegrees);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);

    Paint progressPaint = Paint()
      ..shader = LinearGradient(
              colors: [Color.fromRGBO(65, 106, 190, 1), Colors.indigo.shade900])
          .createShader(Rect.fromCircle(center: center, radius: size.width / 2))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90),
        math.radians(progressInDegrees),
        false,
        progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}



