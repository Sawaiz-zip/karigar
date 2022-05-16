import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:karigar/controllers/profile_controller.dart';
import 'package:karigar/controllers/requests_controller.dart';
import 'package:karigar/screens/job_description.dart';
import 'package:karigar/screens/job_update.dart';
import 'package:karigar/screens/waiting_area.dart';
import 'package:karigar/themes/drawer.dart';
import 'package:karigar/utils/assets.dart';

class Freelancer extends StatefulWidget {
  const Freelancer({Key? key}) : super(key: key);

  @override
  State<Freelancer> createState() => _FreelancerState();
}

class _FreelancerState extends State<Freelancer> {
  final requestsController = Get.find<RequestsController>();
  final profileController = Get.find<ProfileController>();
  Map requests = {};
  List<Widget> cards = [];
  Map users = {};
  List userKeys = [];
  bool show = false;
  bool noRequests = false;
  var snapshot;
  List keys = [];
  Future readData() async {
    DatabaseReference request = FirebaseDatabase.instance.ref('Requests');
    request.onValue.listen((DatabaseEvent event) {
      requests = event.snapshot.value as Map;
      getKeysFromRequests(requests);
      setState(() {
        show = true;
      });
    });
  }

  void noRequest() {
    setState(() {
      noRequests = true;
    });
  }

  void getKeysFromRequests(Map<dynamic, dynamic> map) {
    // Get all keys
    map.keys.forEach((key) {
      keys.add(key);
    });
  }

  void getKeysFromUsers(Map<dynamic, dynamic> map) {
    // Get all keys
    map.keys.forEach((key) {
      userKeys.add(key);
    });
  }

  Future captureUsers() async {
    DatabaseReference user = FirebaseDatabase.instance.ref('Users');
    user.onValue.listen((DatabaseEvent event) {
      users = event.snapshot.value as Map;
      getKeysFromUsers(users);
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
    Future.delayed(
        Duration(seconds: 3), () => {if (show == false) noRequest()});
    return noRequests
        ? WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: Builder(builder: (AppBarContext) {
                  return IconButton(
                    icon: Image.asset(Assets.drawerBlack),
                    onPressed: () => Scaffold.of(AppBarContext).openDrawer(),
                  );
                }),
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              drawer: KarigarDrawer(),
              body: Center(
                  child: Text(
                'No Work Yet',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              )),
            ),
          )
        : WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                leading: Builder(builder: (AppBarContext) {
                  return IconButton(
                    icon: Image.asset(Assets.drawerBlack),
                    onPressed: () => Scaffold.of(AppBarContext).openDrawer(),
                  );
                }),
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              body: show
                  ? ListView.builder(
                      itemCount: keys.length,
                      itemBuilder: (context, index) {
                        createCards();
                        for (int i = 0; i < keys.length; i++)
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              cards[index],
                            ],
                          );
                        return SizedBox();
                      })
                  : WillPopScope(
                      onWillPop: () async => false,
                      child: Scaffold(
                        body: Center(child: CircularProgressIndicator()),
                        drawer: KarigarDrawer(),
                      ),
                    ),
              drawer: KarigarDrawer(),
            ),
          );
  }

  void createCards() {
    cards = [];
    for (int i = 0; i < keys.length; i++) {
      if (userKeys.contains(keys[i])) {
        cards.add(
          InkWell(
            onTap: () => {
              requestsController.totalAmount =
                  requests[keys[i]]['totalAmount']['totalAmount'].toString(),
              requestsController.address =
                  requests[keys[i]]['address']['address'].toString(),
              requestsController.name = users[keys[i]]['name'].toString(),
              requestsController.user = users[keys[i]],
              requestsController.requests = requests[keys[i]],
              requestsController.email = keys[i],
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => JobDescription()))
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
              child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 7,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    color: Color.fromRGBO(229, 229, 229, 0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Name: ",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      users[keys[i]]['name'].toString(),
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Total Amount: ",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      requests[keys[i]]['totalAmount']
                                              ['totalAmount']
                                          .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Address: ",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      requests[keys[i]]['address']['address']
                                          .toString(),
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () => {
                                      requestsController.totalAmount =
                                          requests[keys[i]]['totalAmount']
                                                  ['totalAmount']
                                              .toString(),
                                      requestsController.address =
                                          requests[keys[i]]['address']
                                                  ['address']
                                              .toString(),
                                      requestsController.name =
                                          users[keys[i]]['name'].toString(),
                                      requestsController.user = users[keys[i]],
                                      requestsController.requests =
                                          requests[keys[i]],
                                      requestsController.email = keys[i],
                                      acceptJob(),
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WaitingArea()))
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(70)),
                                      child: Center(
                                          child: Text(
                                        'Accept',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      )),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 25,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(70)),
                                      child: Center(
                                          child: Text(
                                        'Reject',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ),
                  )),
            ),
          ),
        );
      }
    }
  }

  void acceptJob() {
    late Map<String, String> postData = {};
    requestsController.freelancerEmail = profileController.email;
    postData = {
      "Consumer Email": requestsController.email,
      "Freelancer Email": profileController.email
    };
    final key = requestsController.email;
    final Map<String, Map> updates = {};

    updates['${key}'] = postData;
    FirebaseDatabase.instance.ref("Accepted").update(updates);
  }
}
