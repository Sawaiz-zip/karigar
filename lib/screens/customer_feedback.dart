import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karigar/controllers/profile_controller.dart';
import 'package:karigar/controllers/requests_controller.dart';
import 'package:karigar/models/feedback_improvement_model.dart';
import 'package:karigar/screens/home_screen.dart';
import 'package:karigar/utils/assets.dart';

class CustomerFeedback extends StatefulWidget {
  const CustomerFeedback({Key? key}) : super(key: key);

  @override
  State<CustomerFeedback> createState() => _CustomerFeedbackState();
}

class _CustomerFeedbackState extends State<CustomerFeedback> {
  final requestsController = Get.find<RequestsController>();
  final profileController = Get.find<ProfileController>();
  Map requests = {};
  List<bool> reviewStar = [false, false, false, false, false];
  List<bool> improvement = [false, false, false, false, false];
  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'FeedBack',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20, 10, 20),
          child: ListView(
            children: [
              Text(
                'Rate Your Freelancer',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              Text(
                'Are you satisfied with the service?',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 40),
                child: Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      IconButton(
                          onPressed: () {
                            reviewStar = [false, false, false, false, false];
                            for (int j = 0; j <= i; j++) {
                              setState(() {
                                reviewStar[j] = true;
                              });
                            }
                          },
                          icon: Image.asset(reviewStar[i]
                              ? Assets.feedbackStarYellow
                              : Assets.feedbackStarWhite))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Text(
                'Tell us what can be improved',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Wrap(
                direction: Axis.horizontal,
                children: [
                  for (int index = 0;
                      index < feedbackImprovementContent.length;
                      index++)
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 40,
                        width: 140,
                        child: Material(
                          borderRadius: BorderRadius.circular(26),
                          color: improvement[index]
                              ? Colors.redAccent.shade200
                              : Colors.grey.shade300,
                          child: TextButton(
                            style: ButtonStyle(backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.transparent;
                                return Colors.transparent;
                              },
                            )),

                            // style: TextButton.styleFrom(
                            //     primary: Colors.transparent,
                            //     alignment: Alignment.center,
                            //     backgroundColor: Colors.transparent,
                            //     shadowColor: Colors.transparent,
                            //     onSurface: Colors.transparent),
                            child: AutoSizeText(
                              feedbackImprovementContent[index].defaultText,
                              maxFontSize: 13,
                              maxLines: 1,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 9,
                                  color: improvement[index]
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            onPressed: () {
                              setState(() {
                                improvement[index] = !improvement[index];
                              });
                            },
                          ),
                        ),
                      ),
                    )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 30),
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: 'Tell us how we can improve.'),
                        style: TextStyle(
                            fontFamily: 'Poppins', fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  onTap: () => {
                    updateData(),
                    deleteData(),
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen(),
                      ),
                      (route) => false,
                    ),
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(color: Colors.redAccent),
                    child: Center(
                        child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future readData() async {
    var freelancerEmail =
        requestsController.freelancerEmail.toString().split('.');
    final key = freelancerEmail[0];
    DatabaseReference request =
        FirebaseDatabase.instance.ref('Users').child(key);
    request.onValue.listen((DatabaseEvent event) {
      requests = event.snapshot.value as Map;
    });
  }

  void updateData() {
    double rate = 0;
    var freelancerEmail =
        requestsController.freelancerEmail.toString().split('.');
    final key = freelancerEmail[0];
    print(reviewStar);
    for (int i = 0; i < 5; i++) {
      if (reviewStar[i] == true)
        setState(() {
          rate++;
        });
      else
        break;
    }
    print(rate);
    // double avg = (rate + double.parse(requests["ratings"])) / 2;
    final postData = {
      'name': requests["name"],
      'email': requests["email"],
      'address': requests["address"],
      'use': requests["use"],
      'rating': rate.toString(),
    };
    final Map<String, Map> updates = {};
    updates['$key'] = postData;
    FirebaseDatabase.instance.ref("Users").update(updates);
  }

  void deleteData() {
    var email = profileController.email.toString().split('.');
    final key = email[0];
    FirebaseDatabase.instance.ref("Requests").child(key).remove();
    FirebaseDatabase.instance.ref("Accepted").child(key).remove();
  }
}
