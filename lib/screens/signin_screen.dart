import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:karigar/controllers/profile_controller.dart';
import 'package:karigar/models/authentication_model.dart';
import 'package:karigar/screens/home_screen.dart';
import 'package:karigar/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final auth = FirebaseAuth.instance;

  bool _rememberMe = false;

  // ignore: non_constant_identifier_names
  final _name_validate = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  final _email_validate = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  final _password_validate = GlobalKey<FormState>();
  final profileController = Get.put(ProfileController());
  bool loader = false;
  int index = 0;
  int signUp = 1;
  int loginEmailIndex = -1;

  @override
  void initState() {
    _loadUserEmailPassword();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return loader
        ? Scaffold(body: Center(child: CircularProgressIndicator.adaptive()))
        : GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              backgroundColor: Colors.white,
              body: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(_size.width * 0.1,
                        _size.height * 0.03, _size.width * 0.1, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 0;
                              _email.clear();
                              _password.clear();
                              _name.clear();
                              _rememberMe = false;
                            });
                          },
                          child: Text('Hire',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: index == 0
                                      ? FontWeight.w500
                                      : FontWeight.w300
                                  //decoration: TextDecoration.underline
                                  )),
                        ),
                        SizedBox(
                          width: _size.width * 0.08,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 1;
                              _email.clear();
                              _password.clear();
                              _name.clear();
                              _rememberMe = false;
                            });
                          },
                          child: Text('Sell',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: index == 1
                                      ? FontWeight.w500
                                      : FontWeight.w300
                                  //decoration: TextDecoration.underline
                                  )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        index == 0 ? _size.width * 0.656 : _size.width * 0.81,
                        0,
                        0,
                        0),
                    child: const Text('_______'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(_size.width * 0.1,
                        _size.height * 0.1, _size.width * 0.2, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          authenticationContent[0].title,
                          style: const TextStyle(
                            fontFamily: 'GideonRoman',
                            color: Colors.black,
                            fontSize: 50,
                          ),
                        ),
                        Text(
                          authenticationContent[0].subtitle,
                          style: const TextStyle(
                            fontFamily: 'MoonTime',
                            color: Colors.black,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(_size.width * 0.1,
                        _size.height * 0.04, _size.width * 0.1, 0),
                    child: Form(
                      key: _email_validate,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: authenticationContent[0].signUpEmail,
                            hintStyle: const TextStyle(fontFamily: 'Poppins'),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                        cursorColor: Colors.black,
                        controller: _email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Email!';
                          }
                          if (!value.contains('.com') || !value.contains('@')) {
                            return 'Invalid Email!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(_size.width * 0.1,
                        _size.height * 0.04, _size.width * 0.1, 0),
                    child: Form(
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
                          if (value!.length < 5) {
                            return 'Password must be atleast 5 characters long!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(_size.width * 0.1,
                        _size.height * 0.05, _size.width * 0.1, 0),
                    child: Center(
                      child: SizedBox(
                        height: 45,
                        width: 200,
                        child: Material(
                            borderRadius: BorderRadius.circular(25),
                            shadowColor: Colors.black,
                            color: Colors.black,
                            elevation: 7,
                            child: InkWell(
                              onTap: () async {
                                if (_email_validate.currentState!.validate() &&
                                    _password_validate.currentState!
                                        .validate()) {
                                  setState(() {
                                    loader = true;
                                  });
                                  auth
                                      .signInWithEmailAndPassword(
                                          email: _email.text,
                                          password: _password.text)
                                      .then((value) => {
                                            profileController.email =
                                                _email.text,
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen()))
                                          });
                                }
                              },
                              child: Center(
                                  child:
                                      Text(authenticationContent[0].loginSignup,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: 20,
                                          ))),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(_size.width * 0.1,
                        _size.height * 0.02, _size.width * 0.1, 0),
                    child: Center(
                      child: SizedBox(
                        height: 45,
                        width: 200,
                        child: Material(
                            borderRadius: BorderRadius.circular(25),
                            shadowColor: Colors.black,
                            color: Colors.white,
                            elevation: 7,
                            child: InkWell(
                              onTap: () async {
                                print('google');
                              },
                              child: Center(
                                  child: Text(
                                      authenticationContent[0]
                                          .loginSignupGoogle,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                      ))),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(_size.width * 0.1,
                        _size.height * 0.1, _size.width * 0.1, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          authenticationContent[0].dontHaveAnAccount,
                          style: const TextStyle(fontFamily: 'Poppins'),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            });
                          },
                          child: Text(
                            authenticationContent[0].buttonLoginSignup,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }

  void _handleRememberMe(bool? value) {
    _rememberMe = value!;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', _email.text);
        prefs.setString('password', _password.text);
      },
    );
    setState(() {
      _rememberMe = value;
    });
  }

  //load email and password
  void _loadUserEmailPassword() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;
      if (_remeberMe) {
        setState(() {
          _rememberMe = true;
        });
        _email = _email;
        _password = _password;
      }
    } catch (e) {
      print(e);
    }
  }
}
