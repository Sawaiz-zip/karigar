import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final TextEditingController _password = TextEditingController();
  final _password_validate = GlobalKey<FormState>();

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
      ),
      Form(
        key: _password_validate,
        child: TextFormField(
          textInputAction: TextInputAction.go,
          decoration: const InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(fontFamily: 'Poppins'),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
          ),
          cursorColor: Colors.black,
          controller: _password,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Required Field';
            }
            if (value.length < 5) {
              return 'Password length must be greater than 5';
            }
            return null;
          },
        ),
      ),
    ],
  ),
),


    );
  }
}
