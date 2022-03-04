import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
body: Container(
  width: _size.width,
  height: _size.height,
  child: Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 37,left:17),
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios)),
          ),
        ],
      ),
      Center(
        child: Container(
height: 180,
          width: 180,
          child: Stack(
            children:[
             SvgPicture.asset("images/circle_otp.svg"),
              SvgPicture.asset("images/otp.svg")

            ],),
        ),
      )
    ],
  ),
),


    );
  }
}
