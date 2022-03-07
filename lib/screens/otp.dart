import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:country_code_picker/country_code_picker.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final TextEditingController _phoneno = TextEditingController();
  final _phoneno_validate = GlobalKey<FormState>();
  String country_code='+92';

  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;

    return Scaffold(
     // resizeToAvoidBottomInset: false,   //new line

      body: SingleChildScrollView(
        child: Container(
          width: _size.width,
          height: _size.height,
          child: Column(
            children: [
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
                        SvgPicture.asset("Images/circle_otp.svg"),
                        SvgPicture.asset("Images/otp.svg")
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Continue with phone',style: TextStyle(
                    fontSize: 24,fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300
                  ),),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('We will send a One Time ' + '\n'
                      'Password on this phone number',style: TextStyle(
                      fontSize: 11.5,fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300
                  ),textAlign: TextAlign.center,),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(

                    border: Border(
                        bottom: BorderSide(
                      color: Colors.black,
                    )),
                  ),
                  child: CountryCodePicker(
                    enabled: true,
onChanged: (CountryCode value){
                      country_code=value.dialCode!;
print(country_code);
                      },

                    initialSelection: 'PK',
                    favorite: ['+92', 'PK'],
                    showCountryOnly: false,
                    showDropDownButton: true,
                    showOnlyCountryWhenClosed: true,
                    showFlagMain: true,
                    alignLeft: true,
closeIcon: Icon(Icons.keyboard_arrow_down_sharp),
textStyle: TextStyle(fontSize: 15,color: Colors.black,fontFamily: 'Poppins'),
                    searchDecoration: InputDecoration(
                      hintText: 'Region',
                      hintStyle: TextStyle(fontFamily: 'Poppins'),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                ),
              ),
SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _phoneno_validate,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
                    child: TextFormField(
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.number,
                      decoration:  InputDecoration(
                       prefixText:  country_code+" ",
iconColor: Colors.black,
 suffixIconColor: Colors.black,
 prefixStyle: TextStyle(color: Colors.black),
 //                   hintText: '  Phone Number',
                        hintStyle: TextStyle(fontFamily: 'Poppins'),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                    labelText: 'Phone No',labelStyle: TextStyle(color: Colors.black),
                      ),
                      cursorColor: Colors.black,
                      controller: _phoneno,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required Field';
                        }
                        if (value.length < 10) {
                          return 'Incorrect phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    child: Text("Next"),
                    onPressed: () {
                      _phoneno_validate.currentState!.validate();
print(country_code+_phoneno.text);
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
            ],
          ),
        ),
      ),
    );
  }
}
