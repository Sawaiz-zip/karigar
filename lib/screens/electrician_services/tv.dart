import 'package:flutter/material.dart';

class TV extends StatefulWidget {
  const TV({Key? key}) : super(key: key);

  @override
  State<TV> createState() => _TVState();
}

class _TVState extends State<TV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        'TV',
        style: TextStyle(fontSize: 50),
      )),
    );
  }
}
