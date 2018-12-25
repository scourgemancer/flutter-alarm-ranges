import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import 'package:intl/intl.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Alarm Ranges',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      home: new MyHomePage(title: 'Alarm Ranges'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<AlarmRange> _alarmRanges = new List();

  void _newAlarmRange() {
    setState(() {
      _alarmRanges.add(new AlarmRange());
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.deepPurple,
      ),
      body: new Center(
        child: ListView.builder(
            itemCount: _alarmRanges.length,
            itemBuilder: (BuildContext ctxt, int index) => _alarmRanges[index]),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _newAlarmRange,
        tooltip: 'Create new alarm',
        child: new Icon(Icons.add),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }
}

class AlarmRange extends StatefulWidget {
  AlarmRange({Key key}) : super(key: key);

  @override
  _AlarmRangeState createState() => new _AlarmRangeState();
}

class _AlarmRangeState extends State<AlarmRange> {
  // numAlarms is how many alarms will play in the given time range
  int numAlarms = 0;

  // The startTime is initialized as the next whole hour
  TimeOfDay startTime = TimeOfDay.now().replacing(
      hour: (TimeOfDay.now().hour + 1)%23, minute: 0);

  // The endTime is initialized as the hour after the next whole hour
  TimeOfDay endTime = TimeOfDay.now().replacing(
      hour: (TimeOfDay.now().hour + 2)%23, minute: 0);

  // numMeters is the radius of how far to go before the alarms cancel in meters
  int numMeters = 0;

  @override
  Widget build(BuildContext context) {// unused but for example
    return new Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      decoration: new BoxDecoration(
        border: new Border.all(color: Colors.black),
        borderRadius: new BorderRadius.all(Radius.circular(15))
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Play"),
              Text("[selected audio file]"),
              new NumberPicker.integer(
                  initialValue: 1,
                  minValue: 0,
                  maxValue: 999,
                  onChanged: (newNum) => setState(() => numAlarms = newNum)),
              Text("many times from"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TimePickerFormField(
                format: DateFormat("h:mm a"),
                decoration: InputDecoration(labelText: 'First'),
                initialTime: startTime,
                onChanged: (time) => setState(() => startTime = time),
              ),
              Text("to"),
              TimePickerFormField(
                format: DateFormat("h:mm a"),
                decoration: InputDecoration(labelText: 'Last'),
                initialTime: endTime,
                onChanged: (time) => setState(() => endTime = time),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("(while within"),
              new NumberPicker.integer(
                  initialValue: 1,
                  minValue: 0,
                  maxValue: 999,
                  onChanged: (newNum) => setState(() => numMeters = newNum)),
              Text("meters from start)"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("[Pick days of week]"),
              Text("[repeating?]"),
            ],
          ),
        ],
      ),
    );
  }
}
