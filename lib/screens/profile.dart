import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karigar/controllers/profile_controller.dart';
import 'package:karigar/utils/assets.dart';
import '../controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.find<ProfileController>();
  var data;
  @override
  void initState() {
    super.initState();
    final emailPath = profileController.email.split('.');
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('Users/${emailPath[0]}');
    starCountRef.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Image.asset(Assets.backArrowBlack)),
        ),
        body: Center(
          child: Column(children: []),
        ));
  }
}
