import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karigar/screens/home_screen.dart';
import 'package:karigar/screens/signup_screen.dart';

import '../models/on_boarding_model.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(viewportFraction: 1, keepPage: true);
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView.builder(
              controller: controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 18, top: 100, bottom: 0),
                      child: Container(
                        child: SvgPicture.asset(contents[i].image),
                        width: 400,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Center(
                          child: Text(
                        contents[i].title,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Poppins",
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Center(
                        child: Text(
                          contents[i].discription,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
        Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  contents.length, (index) => buildDot(index, context))),
        ),
        // ignore: deprecated_member_use\
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: SizedBox(
            width: 100,
            child: ElevatedButton(
              child: Text("Next"),
              onPressed: () {
                setState(() {
                  int index = currentIndex + 1;
                  if (index == contents.length) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpScreen()));
                  } else
                    controller.jumpToPage(index);
                });
              },
              style: ElevatedButton.styleFrom(
                elevation: 20,
                shadowColor: Colors.black,
                primary: Colors.black,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                });
              },
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.black),
              )),
        )
      ],
    ));
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: currentIndex == index ? Color(0xffF9A826) : Color(0xFFC4C4C4),
          borderRadius: BorderRadius.all(Radius.circular(100))),
    );
  }
}
