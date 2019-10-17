import 'package:flutter/material.dart';
import 'alarm_range.dart';

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