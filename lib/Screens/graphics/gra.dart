
/// Package import
import 'dart:html';

import 'package:appf/modules/Glycemie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
import '../../../../../model/sample_view.dart';

/// Renders the line chart with default data time axis sample.
class DateTimeDefault extends SampleView {
  /// Creates the line chart with default data time axis sample.
  //const DateTimeDefault(Key key) : super(key: key);

  @override
  _DateTimeDefaultState createState() => _DateTimeDefaultState();
}

/// State class of the line chart with default data time axis.
class _DateTimeDefaultState extends SampleViewState {
              final user = FirebaseAuth.instance.currentUser;

  _DateTimeDefaultState();
  late TrackballBehavior _trackballBehavior;
  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
        tooltipSettings: const InteractiveTooltip(
            format: 'point.x : point.y', borderWidth: 0));
    super.initState();

  }    
  

 
  @override
  Widget build(BuildContext context) {

 


    return 
    Scaffold(
         // drawer: NavigationDrawerWidget(),

        appBar: AppBar(centerTitle: true,
         title: Text("Nouvelle donnée"),
         actions: <Widget>[
           
          IconButton(
            icon: const Icon(Icons.cancel_outlined),
            tooltip: 'annuler',
            onPressed: () {
            Navigator.pop(context);
          },)]
      ),
      body:
     // _buildbody(context)
      _buildDefaultDateTimeAxisChart()
//       StreamBuilder(    
     

//         stream: FirebaseFirestore.instance.collection('Glycemie').where('email',isEqualTo: user!.email).snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//          // citiesRef.where('country', 'in', ['USA', 'Japan']);

//           if (!snapshot.hasData) {
//             return Center(
//               child: LinearProgressIndicator(),
//             );
//           } else{     
//             List<Glycemie> glycemie = snapshot.data!.docs.map((document)=> Glycemie.fromMap(snapshot.data)

            
//             ).toList();
            
//                  return _buildDefaultDateTimeAxisChart(glycemie);
// }
//           })

    );
  }

  /// Returns the line chart with default datetime axis.
  SfCartesianChart _buildDefaultDateTimeAxisChart() {
    return SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: ChartTitle(
            text: isCardView
                ? ''
                : 'Ma Glycémie'),
        primaryXAxis:
            DateTimeAxis(majorGridLines: const MajorGridLines(width: 0)),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 6,
          interval: 0.1,
          labelFormat: r'{value} g/L ',
          title: AxisTitle(text: isCardView ? '' : 'g/L'),
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0),
        ),
        series: _getDefaultDateTimeSeries(),
        trackballBehavior: _trackballBehavior);
  }

  /// Returns the line chart with default data time axis.
  List<LineSeries<ChartSampleData, DateTime>> _getDefaultDateTimeSeries() {
   // ignore: todo
   ///TODO:  il faut trouver une facons pour faire marcher hadi enfin the goal is to get data from 
    // db and n3amer this list , i also think that it's possible to make it dakhel body or fucntion li 9belha 
    // please rayane find a solution... 
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: DateTime(2021, 06, 5), yValue: 1.5),
      ChartSampleData(x: DateTime(2021, 06, 6), yValue: 2),
      ChartSampleData(x: DateTime(2021, 06, 7), yValue: 1),
      ChartSampleData(x: DateTime(2021, 06, 8), yValue: 1.6),
      ChartSampleData(x: DateTime(2021, 06, 9), yValue: 0.8),
      ChartSampleData(x: DateTime(2021, 06, 10), yValue: 2.1),
      ChartSampleData(x: DateTime(2021, 06, 11), yValue: 0.9),
       ChartSampleData(x: DateTime(2021, 06, 12), yValue: 1.6),
      ChartSampleData(x: DateTime(2021, 06, 13), yValue: 0.8),
      ChartSampleData(x: DateTime(2021, 06, 14), yValue: 2.1),
      ChartSampleData(x: DateTime(2021, 06, 15), yValue: 0.9), ChartSampleData(x: DateTime(2021, 06, 8), yValue: 1.6),
      ChartSampleData(x: DateTime(2021, 06, 16), yValue: 0.8),
      ChartSampleData(x: DateTime(2021, 06, 17), yValue: 2.1),
      ChartSampleData(x: DateTime(2021, 06, 18), yValue: 0.9),

    ];
    return <LineSeries<ChartSampleData, DateTime>>[
      LineSeries<ChartSampleData, DateTime>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData data, _) => data.x as DateTime,
        yValueMapper: (ChartSampleData data, _) => data.yValue,
        color: const Color.fromRGBO(242, 117, 7, 1),
      )
    ];
  }
}