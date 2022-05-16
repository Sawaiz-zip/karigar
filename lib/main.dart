import 'dart:async';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karigar/controllers/cart_controller.dart';
import 'package:karigar/controllers/location_controller.dart';
import 'package:karigar/controllers/profile_controller.dart';
import 'package:karigar/controllers/requests_controller.dart';
import 'package:karigar/routes.dart';
import 'package:karigar/screens/home_screen.dart';
import 'package:karigar/screens/notification_service.dart';
import 'package:karigar/screens/on_boarding.dart';
import 'package:karigar/screens/signin_screen.dart';
import 'package:karigar/utils/assets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        routes: {
          Routes.homeScreen: (context) => HomeScreen(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _visible = false;

  void fadeIn() {
    setState(() {
      _visible = !_visible;
      Timer(const Duration(milliseconds: 2000), fadeOut);
    });
  }

  void fadeOut() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  void initState() {
    Timer(const Duration(milliseconds: 1500), fadeIn);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 1500),
              child: const SignInScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final cartController = Get.put(CartController());
    final requestsController = Get.put(RequestsController());
    final locationController = Get.put(LocationController());
    final profileController = Get.put(ProfileController());
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Fade(Padding(
          padding: const EdgeInsets.fromLTRB(80.0, 0, 80, 50),
          child: Image.asset(
            Assets.logo,
          ),
        )),
        Fade(Padding(
          padding: const EdgeInsets.fromLTRB(80.0, 10, 80, 30),
          child: Text(
            'Karigar',
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: 50),
          ),
        )),
      ],
    ));
  }

  Widget Fade(Widget widget) {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1000),
      child: widget,
    );
  }
}
