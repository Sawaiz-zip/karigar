import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:karigar/screens/job_update.dart';
import 'package:karigar/themes/drawer.dart';
import 'package:karigar/utils/assets.dart';

class Freelancer extends StatefulWidget {
  const Freelancer({Key? key}) : super(key: key);

  @override
  State<Freelancer> createState() => _FreelancerState();
}

class _FreelancerState extends State<Freelancer> {
  var data;
  var users;
  void readData() {
    DatabaseReference requests = FirebaseDatabase.instance.ref('Requests');
    requests.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value;
    });
  }

  void captureUsers() {
    DatabaseReference user = FirebaseDatabase.instance.ref('Users');
    user.onValue.listen((DatabaseEvent event) {
      users = event.snapshot.value;
    });
  }

  @override
  void initState() {
    super.initState();
    captureUsers();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    print(users["nouman"]);
    print(data["nouman"]);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(builder: (AppBarContext) {
          return IconButton(
            icon: Image.asset(Assets.drawerBlack),
            onPressed: () => Scaffold.of(AppBarContext).openDrawer(),
          );
        }),
        actions: [
          Padding(
              padding: const EdgeInsets.all(2.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent),
                child: Text(
                  'Job Update',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => JobUpdate())),
              )),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(children: []),
      drawer: KarigarDrawer(),
    );
  }
}
