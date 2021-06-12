import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
  
}

class _DateTimePickerState extends State<DateTimePicker> {
 late double _height;
 late double _width;

 late String _setTime, _setDate;

 late String _hour, _minute, _time;

 late String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
      
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
         title: Text("Nouvelle donnée"),
      actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save_outlined),
            tooltip: 'Show Snackbar',
            onPressed: () {
            Navigator.pop(context);
          },)]
      ),
      body:
        
       Container(
        width: _width,
        height: _height,
        alignment:Alignment.center,
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                
                Text(
                  'Choisir la date',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),
                ),
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    width: _width / 2.3, //4.3
                    height: _height / 15,
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200],	
                    
                  	borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 25, color: Colors.grey[700]),
                      textAlign: TextAlign.center,
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _dateController,
                      onSaved: ( val) {
                        _setDate = val!;
                      },
                      decoration: InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          // labelText: 'Time',
                          contentPadding: EdgeInsets.only(top: 0.0)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  'Choisir l\u0027heure',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),
                ),
                InkWell(
                  onTap: () {
                    _selectTime(context);
                  },

                  child: Container(                                                                                                                    
                    margin: EdgeInsets.only(top: 10),
                    width: _width / 2.3,
                    height: _height / 15,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200],
                    		borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 25,color: Colors.grey[700]),
                      textAlign: TextAlign.center,
                      onSaved: (val) {
                        _setTime = val!;
                      },
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _timeController,
                      decoration: InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                              
                          // labelText: 'Time',
                          contentPadding: EdgeInsets.all(10)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
       
      ),
    
     floatingActionButton: FloatingActionButton(
           onPressed:() {
                         Navigator.pop(context);
             
            // Navigate back to first route when tapped.
          },
        
            
          child: Icon(Icons.save_outlined),
          backgroundColor: Color.fromRGBO(	17,190,121,1),
          

        ),
    );
  }
}
