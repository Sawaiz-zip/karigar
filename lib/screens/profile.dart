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

  bool change = true;
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
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            Text(profileController.name,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 50, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Active Jobs',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w300)),
                      Text('1',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                  Column(
                    children: [
                      Text('Previous Jobs',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w300)),
                      Text('27',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                  Column(
                    children: [
                      Text('All Jobs',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w300)),
                      Text('28',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
              child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 7,
                  child: Container(
                    height: 60,
                    color: Color.fromRGBO(229, 229, 229, 0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              Assets.profile,
                            ),
                            Column(
                              children: [
                                Text('Name',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300)),
                                Text(profileController.name,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            TextButton(
                              style:
                                  TextButton.styleFrom(primary: Colors.black),
                              child: Text('Change'),
                              onPressed: () => setState(() => change = true),
                            )
                          ]),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
              child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 7,
                  child: Container(
                    height: 60,
                    color: Color.fromRGBO(229, 229, 229, 0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              Assets.email,
                              color: Colors.black,
                            ),
                            Column(
                              children: [
                                Text('Email',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300)),
                                Text(profileController.email,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            TextButton(
                              style:
                                  TextButton.styleFrom(primary: Colors.black),
                              child: Text('Change'),
                              onPressed: () => setState(() => change = true),
                            )
                          ]),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
              child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 7,
                  child: Container(
                    height: 60,
                    color: Color.fromRGBO(229, 229, 229, 0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              Assets.phone,
                              color: Colors.black,
                            ),
                            Column(
                              children: [
                                Text('Phone Number',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300)),
                                Text("03218416082",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            TextButton(
                              style:
                                  TextButton.styleFrom(primary: Colors.black),
                              child: Text('Change'),
                              onPressed: () => setState(() => change = true),
                            )
                          ]),
                    ),
                  )),
            ),
          ]),
        ));
  }
}
