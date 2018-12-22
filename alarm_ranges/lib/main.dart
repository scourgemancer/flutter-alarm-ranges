import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Alarm Ranges',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
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
  List<Alarm> _alarms = new List();

  void _newAlarm() {
    setState(() {
      _alarms.add(new Alarm());
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: ListView.builder(
            itemCount: _alarms.length,
            itemBuilder: (BuildContext ctxt, int index) => _alarms[index]),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _newAlarm,
        tooltip: 'Create new alarm',
        child: new Icon(Icons.add),
      ),
    );
  }
}

class Alarm extends StatefulWidget {
  Alarm({Key key}) : super(key: key);

  @override
  _AlarmState createState() => new _AlarmState();
}

class _AlarmState extends State<Alarm> {
  @override
  Widget build(BuildContext context) {
    return new Text("Play [selected audio file] [number] many times from " +
        "[start time] to [end time] (while within [number] meters from start)");
  }
}
