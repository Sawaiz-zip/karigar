import 'package:flutter/material.dart';

class Electrician extends StatefulWidget {
  const Electrician({Key? key}) : super(key: key);

  @override
  State<Electrician> createState() => _ElectricianState();
}

class _ElectricianState extends State<Electrician> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        'ELECTRICIAN',
        style: TextStyle(
            fontFamily: 'Poppins', fontWeight: FontWeight.w800, fontSize: 50),
      )),
    );
  }
}
