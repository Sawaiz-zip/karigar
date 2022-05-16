import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'waiting_area.dart';
import 'package:karigar/controllers/profile_controller.dart';
import 'package:karigar/controllers/requests_controller.dart';
import 'package:karigar/screens/freelancer.dart';
import 'package:karigar/screens/location.dart';
import 'package:karigar/utils/assets.dart';

class JobDescription extends StatefulWidget {
  const JobDescription({Key? key}) : super(key: key);

  @override
  State<JobDescription> createState() => _JobDescriptionState();
}

class _JobDescriptionState extends State<JobDescription> {
  final requestsController = Get.find<RequestsController>();
  final profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    print("Requests");
    print(requestsController.totalAmount);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Image.asset(Assets.backArrowBlack),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Job Description',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w400),
          )),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: int.parse(
                  requestsController.requests["workCount"]["workCount"]),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(40),
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 7,
                  child: Container(
                    height: 160,
                    color: Color.fromRGBO(229, 229, 229, 0.2),
                    child: Row(children: [
                      Image.asset(Assets.defaultElectricianServices),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                requestsController.requests[index.toString()]
                                        ["title"]
                                    .toString(),
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 120,
                              child: AutoSizeText(
                                requestsController.requests[index.toString()]
                                    ['description'],
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 9,
                                    fontWeight: FontWeight.w300),
                                maxLines: 3,
                                maxFontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Amount: ",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "${requestsController.totalAmount} PKR",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => {
                  acceptJob(),
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => WaitingArea()))
                },
                child: Container(
                  height: 25,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(70)),
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
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 25,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(70)),
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
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
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
