import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class TimeSeries extends StatefulWidget {
  @override
  _TimeSeriesState createState() => _TimeSeriesState();
}

class _TimeSeriesState extends State<TimeSeries> {
  Interpreter _interpreter;

  @override
_TimeSeriesState(){
    _loadModel();
  }

  void _loadModel() async {
    _interpreter = await Interpreter.fromAsset('ml/model.tflite');
    print('Interpreter loaded successfully');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
