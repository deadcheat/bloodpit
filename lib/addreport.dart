import 'package:flutter/material.dart';
import 'package:bloodpit/report.dart';
import 'package:bloodpit/timing.dart';

import 'package:bloodpit/datepicker.dart';

class AddReportDialog extends StatefulWidget {
  @override
  AddReportDialogState createState() => new AddReportDialogState();
}

class AddReportDialogState extends State<AddReportDialog> {
  final formKey = new GlobalKey<FormState>();
  static final double _diastolic_default = 130.0;
  static final double _systolic_default = 80.0;
  static final double _pulse_default = 80.0;
  static final double _bp_max = 220.0;
  static final double _bp_min = 30.0;
  static final double _p_max = 150.0;
  static final double _p_min = 30.0;
  double _first_diastolic = _diastolic_default;
  double _first_systolic = _systolic_default;
  double _first_pulse = _pulse_default;
  double _second_diastolic = _diastolic_default;
  double _second_systolic = _systolic_default;
  double _second_pulse = _pulse_default;
  Timing _timing = Timing.MORNING;
  DateTime _date = new DateTime.now();

  void handleTimingChanged(Timing value) {
    setState(() {
      _timing = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Add New Report'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(new Report(
                null,
                _date,
                _timing,
                new Measurement(_first_diastolic.toInt(),
                    _first_systolic.toInt(), _first_pulse.toInt()),
                new Measurement(_second_diastolic.toInt(),
                    _second_systolic.toInt(), _second_pulse.toInt()),
              ));
        },
        tooltip: 'Add Record',
        child: new Icon(Icons.save),
        backgroundColor: Colors.red,
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          child: new Column(
            children: [
              new DatePicker(
                labelText: 'Date',
                selectedDate: _date,
                selectDate: (DateTime date) {
                  setState(() {
                    _date = date;
                  });
                },
              ),
              new Container(
                margin: new EdgeInsets.only(),
                alignment: Alignment.centerLeft,
                child: new Text("Timing(Morning/Evening)",
                    style: new TextStyle(fontWeight: FontWeight.bold)),
              ),
              new Container(
                child: new Flexible(
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio<Timing>(
                          value: Timing.MORNING,
                          groupValue: _timing,
                          onChanged: handleTimingChanged,
                          // onChanged: handleRadioValueChanged
                        ),
                        new Text("Morning"),
                        new Radio<Timing>(
                          value: Timing.EVENING,
                          activeColor: Colors.orange,
                          groupValue: _timing,
                          onChanged: handleTimingChanged,
                          // onChanged: handleRadioValueChanged
                        ),
                        new Text("Evening"),
                      ]),
                ),
              ),
              new Container(
                alignment: Alignment.centerLeft,
                child: new Text("1st time measurement",
                    style: new TextStyle(fontWeight: FontWeight.bold)),
              ),
              new Container(
                margin: new EdgeInsets.only(
                  top: 10.0,
                ),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        child: new Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    new Container(
                      child: new CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: new Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    new Container(
                      child: new CircleAvatar(
                        backgroundColor: Colors.pinkAccent,
                        child: new Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                margin: new EdgeInsets.only(
                  top: 15.0,
                ),
                alignment: Alignment.centerLeft,
                child: new Text("2nd time measurement",
                    style: new TextStyle(fontWeight: FontWeight.bold)),
              ),
              new Container(
                margin: new EdgeInsets.only(
                  top: 10.0,
                ),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        child: new Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    new Container(
                      child: new CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: new Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    new Container(
                      child: new CircleAvatar(
                        backgroundColor: Colors.pinkAccent,
                        child: new Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextField(
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                margin: new EdgeInsets.only(
                  top: 15.0,
                ),
                alignment: Alignment.centerLeft,
                child: new Text("Averages",
                    style: new TextStyle(fontWeight: FontWeight.bold)),
              ),
              new Container(
                margin: new EdgeInsets.only(
                  top: 10.0,
                ),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: new CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        child: new Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextFormField(),
                    ),
                    new Container(
                      child: new CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: new Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextFormField(),
                    ),
                    new Container(
                      child: new CircleAvatar(
                        backgroundColor: Colors.pinkAccent,
                        child: new Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new TextFormField(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
