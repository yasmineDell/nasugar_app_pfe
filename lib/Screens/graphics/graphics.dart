/*
import 'package:appf/Screens/Home/navigation_drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class graphics extends StatefulWidget {
  const graphics({ Key? key }) : super(key: key);

  @override
  _graphicsState createState() => _graphicsState();
}

class _graphicsState extends State<graphics> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          drawer: NavigationDrawerWidget(),

        appBar: AppBar(centerTitle: true,
         title: Text("Graphique", textAlign:TextAlign.center,style: TextStyle(fontSize: 17),),
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
          
          );
  }
}*/
/*
/// Dart import
import 'dart:math';

import 'package:appf/widget/custom_button.dart';
/// Package imports
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
import '../../../../model/sample_view.dart';

/// Renders the chart with crosshair sample.
class DefaultCrossHair extends SampleView {
  /// creates the chart with crosshair.
  //const DefaultCrossHair(Key key) : super(key: key);

  @override
  _DefaultCrossHairState createState() => _DefaultCrossHairState();
}

/// State class of the chart with crosshair.
class _DefaultCrossHairState extends SampleViewState {
  _DefaultCrossHairState();
  late bool alwaysShow;
  late double duration;
  final List<String> _lineTypeList =
      <String>['both', 'vertical', 'horizontal'].toList();
  late String _selectedLineType;
  late CrosshairLineType _lineType;
  List<ChartSampleData> randomData = getDatatTimeData();

  @override
  void initState() {
    _selectedLineType = 'both';
    _lineType = CrosshairLineType.both;
    duration = 2;
    alwaysShow = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            bottom: model.isWebFullView || !isCardView ? 0 : 60),
        child: _buildDefaultCrossHairChart());
  }

  @override
  Widget buildSettings(BuildContext context) {
    final double screenWidth =
        model.isWebFullView ? 245 : MediaQuery.of(context).size.width;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(
            title: Text('Line type', style: TextStyle(color: model.textColor)),
            trailing: Container(
                padding: EdgeInsets.only(left: 0.07 * screenWidth),
                width: 0.5 * screenWidth,
                height: 50,
                alignment: Alignment.bottomLeft,
                child: DropdownButton<String>(
                    underline:
                        Container(color: const Color(0xFFBDBDBD), height: 1),
                    value: _selectedLineType,
                    items: _lineTypeList.map((String value) {
                      return DropdownMenuItem<String>(
                          value: (value != null) ? value : 'both',
                          child: Text(value,
                              style: TextStyle(color: model.textColor)));
                    }).toList(),
                    onChanged: (dynamic value) {
                      onLineTypeChange(value);
                      stateSetter(() {});
                    })),
          ),
          ListTile(
              title: Text('Show always',
                  style: TextStyle(
                    color: model.textColor,
                  )),
              trailing: Container(
                  padding: EdgeInsets.only(left: 0.05 * screenWidth),
                  width: 0.5 * screenWidth,
                  child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      activeColor: model.backgroundColor,
                      value: alwaysShow,
                      onChanged: (bool? value) {
                        setState(() {
                          alwaysShow = value!;
                          stateSetter(() {});
                        });
                      }))),
          ListTile(
            title:
                Text('Hide delay  ', style: TextStyle(color: model.textColor)),
            trailing: Container(
              width: 0.5 * screenWidth,
              padding: EdgeInsets.only(left: 0.03 * screenWidth),
              child: CustomDirectionalButtons(
                maxValue: 10,
                initialValue: duration,
                onChanged: (double val) => setState(() {
                  duration = val;
                }),
                step: 2,
                iconColor: model.textColor,
                style: TextStyle(fontSize: 20.0, color: model.textColor),
              ),
            ),
          ),
        ],
      );
    });
  }

  /// Returns the cartesian chart with crosshair.
  SfCartesianChart _buildDefaultCrossHairChart() {
    _lineType = _lineType;
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat.y(),
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          interactiveTooltip: InteractiveTooltip(
              enable: (_lineType == CrosshairLineType.both ||
                      _lineType == CrosshairLineType.vertical)
                  ? true
                  : false)),

      /// To enable the cross hair for cartesian chart.
      crosshairBehavior: CrosshairBehavior(
          enable: true,
          hideDelay: duration * 1000,
          lineWidth: 1,
          activationMode: ActivationMode.singleTap,
          shouldAlwaysShow: alwaysShow,
          lineType: _lineType),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          interactiveTooltip: InteractiveTooltip(
              enable: (_lineType == CrosshairLineType.both ||
                      _lineType == CrosshairLineType.horizontal)
                  ? true
                  : false),
          majorTickLines: const MajorTickLines(width: 0)),
      series: getDefaultCrossHairSeries(),
    );
  }

  /// Returns the list of chart series which need to
  /// render on the Cartesian chart.
  List<LineSeries<ChartSampleData, DateTime>> getDefaultCrossHairSeries() {
    return <LineSeries<ChartSampleData, DateTime>>[
      LineSeries<ChartSampleData, DateTime>(
          dataSource: randomData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          width: 2)
    ];
  }

  /// Method the update the crosshair line type in the chart on change.
  void onLineTypeChange(String item) {
    _selectedLineType = item;
    if (_selectedLineType == 'both') {
      _lineType = CrosshairLineType.both;
    }
    if (_selectedLineType == 'horizontal') {
      _lineType = CrosshairLineType.horizontal;
    }
    if (_selectedLineType == 'vertical') {
      _lineType = CrosshairLineType.vertical;
    }
    setState(() {
      /// update the crosshair line type changes
    });
  }
}

/// Method to get random data points for the chart with crosshair sample.
List<ChartSampleData> getDatatTimeData() {
  final List<ChartSampleData> _randomData = <ChartSampleData>[];
  final Random _rand = Random();
  double _value = 100;
  for (int i = 1; i < 2000; i++) {
    if (_rand.nextDouble() > 0.5) {
      _value += _rand.nextDouble();
    } else {
      _value -= _rand.nextDouble();
    }
    _randomData.add(ChartSampleData(x: DateTime(1900, i, 1), y: _value));
  }
  return _randomData;
}

/// Package import
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
         title: Text("Graphique"),
         actions: <Widget>[
           
    
          ]
      ),
      body:
     // _buildbody(context)
      _buildDefaultDateTimeAxisChart()
      // StreamBuilder(    
     

      //   stream: FirebaseFirestore.instance.collection('Glycemie').where('email',isEqualTo: user!.email).snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //    // citiesRef.where('country', 'in', ['USA', 'Japan']);

      //     if (!snapshot.hasData) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } 
      //     return _buildDefaultDateTimeAxisChart();
      //     })

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
          interval: 1,
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
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: DateTime(2021, 06, 1,07,00), yValue: 0.9),
      ChartSampleData(x: DateTime(2021, 06, 1,11,00), yValue: 1.5),
      ChartSampleData(x: DateTime(2021, 06, 1,12,00), yValue: 2),
      ChartSampleData(x: DateTime(2021, 06, 1,17,00), yValue: 1.7),

      ChartSampleData(x: DateTime(2021, 06, 2), yValue: 2),
      ChartSampleData(x: DateTime(2021, 06, 3), yValue: 1),
      ChartSampleData(x: DateTime(2021, 06, 4), yValue: 1.6),
      ChartSampleData(x: DateTime(2021, 06, 5), yValue: 0.8),
      ChartSampleData(x: DateTime(2021, 06, 6), yValue: 2.1),
      ChartSampleData(x: DateTime(2021, 06, 7), yValue: 0.9),
    
      ChartSampleData(x: DateTime(2021, 06, 8), yValue: 1.6),
      ChartSampleData(x: DateTime(2021, 06, 9), yValue: 0.8),
      ChartSampleData(x: DateTime(2021, 06, 10), yValue: 2.1),
      ChartSampleData(x: DateTime(2021, 06, 11), yValue: 0.9),
       ChartSampleData(x: DateTime(2021, 06, 12), yValue: 1.6),
      ChartSampleData(x: DateTime(2021, 06, 13), yValue: 0.8),
      ChartSampleData(x: DateTime(2021, 06, 14), yValue: 2.1),
      ChartSampleData(x: DateTime(2021, 06, 15), yValue: 0.9), 
      ChartSampleData(x: DateTime(2021, 06, 16), yValue: 0.8),
      ChartSampleData(x: DateTime(2021, 06, 17), yValue: 2.1),
      ChartSampleData(x: DateTime(2021, 06, 18), yValue: 0.9),
   ChartSampleData(x: DateTime(2021, 06, 19), yValue: 0.8),
      ChartSampleData(x: DateTime(2021, 06, 20), yValue: 2.1),
      ChartSampleData(x: DateTime(2021, 06, 21), yValue: 0.9),

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
}*/
/// Package imports
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
import '../../../../../model/sample_view.dart';

/// Renders the spline types cahrt sample.
class SplineTypes extends SampleView {
  /// Creates the spline types cahrt sample.
 // const SplineTypes(Key key) : super(key: key);

  @override
  _SplineTypesState createState() => _SplineTypesState();
}

/// State class for spline types chart.
class _SplineTypesState extends SampleViewState {
  _SplineTypesState();

  final List<String> _splineList =
      <String>['natural', 'monotonic', 'cardinal', 'clamped'].toList();
  late String _selectedSplineType;
  late SplineType _spline;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _selectedSplineType = 'natural';
    _spline = SplineType.natural;
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
         // drawer: NavigationDrawerWidget(),

        appBar: AppBar(centerTitle: true,
         title: Text("Graphique"),
         actions: <Widget>[
           
    
          ]
      ),
    body:
     _buildTypesSplineChart());
  }

  @override
  Widget buildSettings(BuildContext context) {
    return 
    
    StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
      return Row(
        children: <Widget>[
          Text('Spline type ',
              style: TextStyle(
                color: model.textColor,
                fontSize: 16,
              )),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            height: 50,
            alignment: Alignment.bottomLeft,
            child: DropdownButton<String>(
                underline: Container(color: const Color(0xFFBDBDBD), height: 1),
                value: _selectedSplineType,
                items: _splineList.map((String value) {
                  return DropdownMenuItem<String>(
                      value: (value != null) ? value : 'natural',
                      child: Text(value,
                          style: TextStyle(color: model.textColor)));
                }).toList(),
                onChanged: (dynamic value) {
                  _onPositionTypeChange(value.toString());
                  stateSetter(() {});
                }),
          ),
        ],
      );
    });
  }

  /// Returns the spline types chart.
  SfCartesianChart _buildTypesSplineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: isCardView ? '' : 'Export growth of Brazil'),
      primaryXAxis: NumericAxis(
        majorGridLines: const MajorGridLines(width: 0),
        interval: 1,
      ),
      primaryYAxis: NumericAxis(
          labelFormat: '{value} g/L',
          minimum: 0,
          maximum: 6,
          interval: 1,
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getSplineTypesSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Returns the list of chart series which need to render on the spline chart.
  List<SplineSeries<_ChartData, num>> _getSplineTypesSeries() {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData(15, 0.9),
    //  _ChartData(15, 1.2),
     
      _ChartData(16, 1.4),
      _ChartData(16, 2.3),
      _ChartData(17, 1.6),
      _ChartData(18, 0.9),
      _ChartData(19, 1.2),
      _ChartData(20, 1.6),
      _ChartData(21, 1.1),
      _ChartData(22, 1),
      _ChartData(23, 0.7),
      _ChartData(24, 1.1),
      _ChartData(25, 1.4),
     

   
    ];
    return <SplineSeries<_ChartData, num>>[
      SplineSeries<_ChartData, num>(

          /// To set the spline type here.
          splineType: _spline,
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          width: 2)
    ];
  }

  /// Method to change the spline type using dropdown menu.
  void _onPositionTypeChange(String item) {
    _selectedSplineType = item;
    if (_selectedSplineType == 'natural') {
      _spline = SplineType.natural;
    }
   
    setState(() {
      /// update the spline type changes
    });
  }
}

/// Private class for storing the spline series data points.
class _ChartData {
  _ChartData(this.x, this.y);
  final double x;
  final double y;
}