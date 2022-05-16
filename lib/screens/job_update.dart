import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:karigar/models/freelancer_profile_model.dart';
import 'package:karigar/screens/chatbox.dart';
import 'package:karigar/utils/assets.dart';

class JobUpdate extends StatefulWidget {
  const JobUpdate({Key? key}) : super(key: key);

  @override
  State<JobUpdate> createState() => _JobUpdateState();
}

class _JobUpdateState extends State<JobUpdate> {
  var selectedIndex = -1;
  List rejectedFreelancers = [];
  Map requests = {};

  List keys = [];
  Map users = {};
  List freelancerInfo = [];
  List userKeys = [];
  bool noRequests = false;
  bool show = false;
  Future readData() async {
    DatabaseReference request = FirebaseDatabase.instance.ref('Accepted');
    request.onValue.listen((DatabaseEvent event) {
      requests = event.snapshot.value as Map;
      getKeysFromRequests(requests);
      setState(() {
        show = true;
      });
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

  var emailKey;
  void noRequest() {
    setState(() {
      noRequests = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    readData();
    captureUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(seconds: 3), () => {if (show == false) noRequest()});
    return noRequests
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true,
                leading: IconButton(
                  icon: Image.asset(Assets.backArrowBlack),
                  onPressed: () => Navigator.pop(context),
                ),
                title: Text(
                  'Job Update',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                )),
            body: Center(
                child: Text(
              'No Update Yet',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            )),
          )
        : show
            ? Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    centerTitle: true,
                    leading: IconButton(
                      icon: Image.asset(Assets.backArrowBlack),
                      onPressed: () => Navigator.pop(context),
                    ),
                    title: Text(
                      'Job Update',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    )),
                body: ListView.builder(
                    itemCount: requests.length,
                    itemBuilder: (context, index) {
                      emailKey = requests[keys[index]]["Freelancer Email"]
                          .toString()
                          .split('.');
                      freelancerInfo.add(users[emailKey[0]]);

                      return Padding(
                        padding: const EdgeInsets.all(40),
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 7,
                          child: Container(
                            height: 160,
                            color: Color.fromRGBO(229, 229, 229, 0.2),
                            child: Row(children: [
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20)),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            freelancerProfileContent[index]
                                                .image))),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, bottom: 12),
                                    child: Text(freelancerInfo[index]["name"],
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (int i = 0;
                                          i <
                                              freelancerProfileContent[index]
                                                  .rating;
                                          i++)
                                        Image.asset(
                                          Assets.ratingsStar,
                                        ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, bottom: 25),
                                    child: Row(children: [
                                      Text(
                                        '${freelancerProfileContent[index].jobsDone} Jobs',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ChatBox(
                                                      name:
                                                          freelancerInfo[index]
                                                              ["name"],
                                                    ))),
                                        child: Container(
                                          height: 18,
                                          width: 70,
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
                                                fontSize: 9,
                                                fontWeight: FontWeight.w400),
                                          )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () => setState(() {
                                          rejectedFreelancers
                                              .add(selectedIndex);
                                        }),
                                        child: Container(
                                          height: 18,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(70)),
                                          child: Center(
                                              child: Text(
                                            'Reject',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 9,
                                                fontWeight: FontWeight.w400),
                                          )),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ]),
                          ),
                        ),
                      );
                    }),
              )
            : Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
  }
}
