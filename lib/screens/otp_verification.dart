import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:karigar/screens/home_screen.dart';
import 'package:karigar/screens/otp.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Otp_verification extends StatefulWidget {
  @override
  _Otp_verificationState createState() => _Otp_verificationState();
}

class _Otp_verificationState extends State<Otp_verification> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: _size.width,
          height: _size.height,
          child: Column(children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 37, left: 17),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                ),
              ],
            ),
            Center(
              child: Container(
                height: 180,
                width: 180,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      SvgPicture.asset("assets/images/circle_otp.svg"),
                      SvgPicture.asset("assets/images/otp_verification.svg")
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Verify phone number',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'We sent a verification code to ${country_code + phoneNo} , ' +
                      '\n'
                          ' please enter the code below',
                  style: TextStyle(
                      fontSize: 11.5,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            OtpTextField(
              numberOfFields: 4,
              borderColor: Color(0xFFE5E5E5),
              fillColor: Color(0xFFE5E5E5),
              cursorColor: Color(0xFFE5E5E5),
              enabledBorderColor: Color(0xFFE5E5E5),
              disabledBorderColor: Color(0xFFE5E5E5),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
            Padding(
              padding: const EdgeInsets.only(top: 160.0),
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  child: Text("Verify & Proceed"),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen())),
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
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Didn’t receive a code?  ',
                      style: TextStyle(
                          fontSize: 11.5,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend code',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11.5,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
