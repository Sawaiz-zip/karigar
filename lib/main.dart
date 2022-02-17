import 'package:flutter/material.dart';
import 'package:karigar/screens/authentication.dart';
import 'package:karigar/screens/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Authentication()));
            },
            child: Container(
                color: Colors.grey,
                height: 40,
                width: 150,
                child: Center(child: Text('Authentication Screen'))),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Onboarding()));
            },
            child: Container(
                color: Colors.grey,
                height: 40,
                width: 150,
                child: Center(child: Text('OnBoarding Screen'))),
          ),
        ],
      ),
    );
  }
}
