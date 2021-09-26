/*

/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
import '../../../../../model/sample_view.dart';

/// Renders the defaul spline chart sample.
class SplineDefault extends SampleView {
  /// Creates the defaul spline chart Series.
  const SplineDefault({Key? key}) : super(key: key);

  @override
  _SplineDefaultState createState() => _SplineDefaultState();
}

/// State class of the default spline chart.
class _SplineDefaultState extends SampleViewState {
  _SplineDefaultState();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         // drawer: NavigationDrawerWidget(),

        appBar: AppBar(centerTitle: true,
         title: Text("Graphique"),
         actions: <Widget>[
           
    
          ]
      ),
    body: 
        Container(
  height: 500,
  child: Card(
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child:    
    _buildDefaultSplineChart(),
    
  ),),
    );
  }

  /// Returns the defaul spline chart.
  SfCartesianChart _buildDefaultSplineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: isCardView ? '' : 'Average high/low temperature of London'),
      legend: Legend(isVisible: !isCardView),
      primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          labelPlacement: LabelPlacement.onTicks),
      primaryYAxis: NumericAxis(
          minimum: 30,
          maximum: 80,
          axisLine: const AxisLine(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          labelFormat: '{value}°F',
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getDefaultSplineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// Returns the list of chart series which need to render on the spline chart.
  List<SplineSeries<ChartSampleData, String>> _getDefaultSplineSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'Jan', y: 43, secondSeriesYValue: 37, thirdSeriesYValue: 41),
      ChartSampleData(
          x: 'Feb', y: 45, secondSeriesYValue: 37, thirdSeriesYValue: 45),
      ChartSampleData(
          x: 'Mar', y: 50, secondSeriesYValue: 39, thirdSeriesYValue: 48),
      ChartSampleData(
          x: 'Apr', y: 55, secondSeriesYValue: 43, thirdSeriesYValue: 52),
      ChartSampleData(
          x: 'May', y: 63, secondSeriesYValue: 48, thirdSeriesYValue: 57),
      ChartSampleData(
          x: 'Jun', y: 68, secondSeriesYValue: 54, thirdSeriesYValue: 61),
      ChartSampleData(
          x: 'Jul', y: 72, secondSeriesYValue: 57, thirdSeriesYValue: 66),
      ChartSampleData(
          x: 'Aug', y: 70, secondSeriesYValue: 57, thirdSeriesYValue: 66),
      ChartSampleData(
          x: 'Sep', y: 66, secondSeriesYValue: 54, thirdSeriesYValue: 63),
      ChartSampleData(
          x: 'Oct', y: 57, secondSeriesYValue: 48, thirdSeriesYValue: 55),
      ChartSampleData(
          x: 'Nov', y: 50, secondSeriesYValue: 43, thirdSeriesYValue: 50),
      ChartSampleData(
          x: 'Dec', y: 45, secondSeriesYValue: 37, thirdSeriesYValue: 45)
    ];
    return <SplineSeries<ChartSampleData, String>>[
      SplineSeries<ChartSampleData, String>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        markerSettings: const MarkerSettings(isVisible: true),
        name: 'High',
      ),
      SplineSeries<ChartSampleData, String>(
        dataSource: chartData,
        name: 'Low',
        markerSettings: const MarkerSettings(isVisible: true),
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
      )
    ];
  }
}
*/
/// Package imports
import 'package:appf/Screens/Home/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
import '../../../../../model/sample_view.dart';

/// Renders the spline types cahrt sample.
class SplineTypes extends SampleView {
  /// Creates the spline types cahrt sample.
  const SplineTypes( {Key? key, required this.map1, required this.map2, required this.map3, required this.map4}) : super(key: key);

  final Map<DateTime,double> map1;
  final Map<DateTime,double> map2;
  final Map<DateTime,double> map3;
  final Map<DateTime,double> map4;

  @override
  _SplineTypesState createState() => _SplineTypesState();
}

/// State class for spline types chart.
class _SplineTypesState extends SampleViewState {
  _SplineTypesState();

  final List<String> _splineList =
      <String>['juin', 'juillet',].toList();
  late String _selectedSplineType;
  late SplineType _spline;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _selectedSplineType = 'juin';
    _spline = SplineType.natural;
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: 'jour : ', canShowMarker: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String t="";
    return
    DefaultTabController(
  length: 2,
  child:
    Scaffold(
         // drawer: NavigationDrawerWidget(),
          //drawer: NavigationDrawerWidget(),

        appBar: AppBar(
          
           bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.bloodtype)),
                Tab(icon: Icon(Icons.directions_walk_rounded)),

              ],
            ),
            
          
          centerTitle: true,
         title: Text("Graphique"),
         actions: <Widget>[
           
    
          ]
      ),
    body: 
   TabBarView(
        children: [
          Center(
              child: SingleChildScrollView ( // this will make your body scrollable
  //child:  Container(
  // height: 1500,
  child: Column(
     crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[    buildSettings(context),

    Card(
   // semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child:         _buildTypesSplineChart(widget.map1,1)

    ),
    SizedBox(height:20),
  Divider(height:2, color: Colors.black45,thickness: 1,),
  SizedBox(height:20),

  Text(" À jeune"),
  SizedBox(height:20),

  Divider(height:2, color: Colors.black45,thickness: 1,),
    SizedBox(height:15),


         _buildTypesSplineChart(widget.map2,2),

           Divider(height:2, color: Colors.black45,thickness: 1,),

           SizedBox(height:20),

  Text(" Avant le déjeuner"),
  SizedBox(height:20),

  Divider(height:2, color: Colors.black45,thickness: 1,),
    SizedBox(height:15),
             _buildTypesSplineChart(widget.map3,2),


               Divider(height:2, color: Colors.black45,thickness: 1,),

               SizedBox(height:20),

  Text(" Après midi"),


  SizedBox(height:20),

  Divider(height:2, color: Colors.black45,thickness: 1,),
    SizedBox(height:15),

             _buildTypesSplineChart(widget.map4,2),

  Divider(height:2, color: Colors.black45,thickness: 1,),

  SizedBox(height:20),

  Text("Avant coucher"),
  SizedBox(height:20),

  Divider(height:2, color: Colors.black45,thickness: 1,),
    SizedBox(height:15),
    ],
  ),
),),
          Center(
              child: 
                Column(
     crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
                 SizedBox(height:142),

    Card(
   // semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child:    
              _buildDefaultColumnChart()

              ),

               SizedBox(height:20),
  Divider(height:2, color: Colors.black45,thickness: 1,),
  SizedBox(height:20),

  Text(" Graphique représentant l'activité phisique "),
  SizedBox(height:20),

  Divider(height:2, color: Colors.black45,thickness: 1,),
    SizedBox(height:15),

                  ],
      ),
   //  ),
    ),
         ] )),);
  }
  /*  SingleChildScrollView ( // this will make your body scrollable
  //child:  Container(
  // height: 1500,
  child: Column(
     crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
    Card(
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child:         _buildTypesSplineChart(widget.map,1)

    
  ),
    SizedBox(height:20),

  Text(" À jeun"),
  SizedBox(height:20),

  Divider(height:2, color: Colors.black45,thickness: 1,),
    SizedBox(height:15),


         _buildTypesSplineChart(widget.map,2),
          SizedBox(height:20),

  Text(" À jeun"),
  SizedBox(height:20),

  Divider(height:2, color: Colors.black45,thickness: 1,),
    SizedBox(height:15),


         _buildTypesSplineChart(widget.map,3),


              ] ) ), */

  @override
  Widget buildSettings(BuildContext context) {
    return 
    
    StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
      return Row(
        children: <Widget>[
          Text('  Selectionnez le mois ',
              style: TextStyle(
                color: model.textColor,
                fontSize: 13
              )),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            height: 50,
            alignment: Alignment.bottomLeft,
            child: DropdownButton<String>(
                underline: Container(color: const Color(0xFF3F2929), height: 1),
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
  SfCartesianChart _buildTypesSplineChart( Map<DateTime,double> map, int i
) {
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
      series: _getSplineTypesSeries(map,i),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Returns the list of chart series which need to render on the spline chart.
  List<SplineSeries<_ChartData, num>> _getSplineTypesSeries(Map<DateTime, double> map, int i) {
    final List<_ChartData> chartData = <_ChartData>[];

  
     map.forEach((k,v) {
       print('${k}: ${v}');
       if(k.month==DateTime.june){
       chartData.add(_ChartData(k.day, v));

       }
     } 
); 


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
    if (_selectedSplineType == 'juin') {
     // _spline = SplineType.natural;
     print("rahi f juin");
    }
   
    setState(() {
      /// update the spline type changes
    });
  }

    /// Get default column chart
  SfCartesianChart _buildDefaultColumnChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: isCardView ? '' : 'Population growth of various countries'),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          labelFormat: '{value} pas',
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getDefaultColumnSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }
/// Get default column series
  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
            ChartSampleData(x: '19', y: 9876),

      ChartSampleData(x: '20', y: 4010),

      ChartSampleData(x: '21', y: 5671),
      ChartSampleData(x: '22', y: 818),
      ChartSampleData(x: '23', y: 151),
      ChartSampleData(x: '24', y: 1302),
      ChartSampleData(x: '25', y: 2017),
      ChartSampleData(x: '26', y: 3683),
      ChartSampleData(x: '27', y: 345),
      ChartSampleData(x: '28', y: 1302),
      ChartSampleData(x: '29', y: 8762),
      ChartSampleData(x: '30', y: 12779),
      ChartSampleData(x: '1', y: 231),
      ChartSampleData(x: '2', y: 198),
       ChartSampleData(x: '3', y: 64),
       ChartSampleData(x: '4', y: 123),
       ChartSampleData(x: '5', y: 261),
       ChartSampleData(x: '6', y: 7851),
       ChartSampleData(x: '7', y: 172),


    ];
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        dataLabelSettings: DataLabelSettings(
            isVisible: true, textStyle: const TextStyle(fontSize: 10)),
      )
    ];
  }


}


/// Private class for storing the spline series data points.
class _ChartData {
  _ChartData(this.x, this.y);
  final int x;
  final double y;
}

/*
/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
import '../../../../../model/sample_view.dart';

/// Renders the line chart with default data time axis sample.
class DateTimeDefault extends SampleView {
  /// Creates the line chart with default data time axis sample.
  const DateTimeDefault({Key? key, required this.map}) : super(key: key);
 final Map<DateTime,double> map;

  @override
  _DateTimeDefaultState createState() => _DateTimeDefaultState();
}

/// State class of the line chart with default data time axis.
class _DateTimeDefaultState extends SampleViewState {
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
    body: Card(
       
      child: new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child:  _buildDefaultDateTimeAxisChart(widget.map),
    )  ,),

     //Text(widget.map.toString())
     
     );
  }

    
    
    
  

  /// Returns the line chart with default datetime axis.
  SfCartesianChart _buildDefaultDateTimeAxisChart(Map <DateTime,double> map) {
    return SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: ChartTitle(
            text: isCardView
                ? ''
                : 'Euro to USD monthly exchange rate - 2015 to 2018'),
        primaryXAxis:
            DateTimeAxis(majorGridLines: const MajorGridLines(width: 0),
            enableAutoIntervalOnZooming: true,
            zoomFactor:1,
            ),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 6,
          interval: 0.5,
          labelFormat: r'{value}g/l',
          title: AxisTitle(text: isCardView ? '' : 'Dollars'),
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0),
        ),
        series: _getDefaultDateTimeSeries(map),
        trackballBehavior: _trackballBehavior);
  }

  /// Returns the line chart with default data time axis.
  List<LineSeries<ChartSampleData, DateTime>> _getDefaultDateTimeSeries(Map <DateTime,double> map) {
    final List<ChartSampleData> chartData = <ChartSampleData>[
     
    ];
    
     map.forEach((k,v) {
       print('${k}: ${v}');
       chartData.add(  ChartSampleData(x:k, yValue:v));
     });
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