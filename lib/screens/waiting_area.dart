import 'package:flutter/material.dart';

class WaitingArea extends StatefulWidget {
  const WaitingArea({Key? key}) : super(key: key);

  @override
  State<WaitingArea> createState() => _WaitingAreaState();
}

class _WaitingAreaState extends State<WaitingArea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Waiting for Job to be accepted',
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }
}
