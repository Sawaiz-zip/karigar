import 'package:auto_size_text/auto_size_text.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          itemCount: freelancerProfileContent.length,
          itemBuilder: (context, index) {
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
                                  freelancerProfileContent[index].image))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 12),
                          child: Text(freelancerProfileContent[index].name,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0;
                                i < freelancerProfileContent[index].rating;
                                i++)
                              Image.asset(
                                Assets.ratingsStar,
                              ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 25),
                          child: Row(children: [
                            Text(
                              '${freelancerProfileContent[index].jobsDone} Jobs',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(width: 90),
                            Text(
                                'PKR${freelancerProfileContent[index].charges}/hr',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                )),
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
                                                freelancerProfileContent[index]
                                                    .name,
                                          ))),
                              child: Container(
                                height: 18,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(70)),
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
                                rejectedFreelancers.add(selectedIndex);
                              }),
                              child: Container(
                                height: 18,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(70)),
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
    );
  }
}
