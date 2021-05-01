import 'package:flutter/material.dart';

class Active extends StatelessWidget {
  const Active({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(16),
      child: Center(
        child: Text(
          'Active Orders',
          style: TextStyle(fontSize: 48),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
