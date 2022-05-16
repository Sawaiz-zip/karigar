import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:karigar/models/authentication_model.dart';
import 'package:karigar/screens/notification_service.dart';
import 'package:karigar/screens/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final auth = FirebaseAuth.instance;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _reEnterPassword = TextEditingController();
  final TextEditingController _address = TextEditingController();
  bool _rememberMe = false;
  FirebaseDatabase database = FirebaseDatabase.instance;

  // ignore: non_constant_identifier_names
  final _name_validate = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  final _email_validate = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  final _password_validate = GlobalKey<FormState>();
  final _reEnterPassword_validate = GlobalKey<FormState>();
  final _address_validate = GlobalKey<FormState>();
  bool loader = false;

  int index = 0;
  int signUp = 1;
  int loginEmailIndex = -1;

  @override
  void initState() {
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
                              _reEnterPassword.clear();
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
                              _reEnterPassword.clear();
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
                          authenticationContent[1].title,
                          style: const TextStyle(
                            fontFamily: 'GideonRoman',
                            color: Colors.black,
                            fontSize: 50,
                          ),
                        ),
                        Text(
                          authenticationContent[1].subtitle,
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
                      key: _name_validate,
                      child: TextFormField(
                        //autofocus: true,
                        //focusNode: _focusNode,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(fontFamily: 'Poppins'),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                        cursorColor: Colors.black,
                        controller: _name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required Field';
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
                      key: _email_validate,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: authenticationContent[1].signUpEmail,
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
                        obscureText: true,
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
                        _size.height * 0.04, _size.width * 0.1, 0),
                    child: Form(
                      key: _reEnterPassword_validate,
                      child: TextFormField(
                        obscureText: true,
                        textInputAction: TextInputAction.go,
                        decoration: const InputDecoration(
                          hintText: 'Re-Enter Password',
                          hintStyle: TextStyle(fontFamily: 'Poppins'),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                        cursorColor: Colors.black,
                        controller: _reEnterPassword,
                        validator: (value) {
                          if (value != _password.text) {
                            return "Password's don't match";
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
                      key: _address_validate,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.go,
                        decoration: const InputDecoration(
                          hintText: 'Address',
                          hintStyle: TextStyle(fontFamily: 'Poppins'),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                        cursorColor: Colors.black,
                        controller: _address,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Address can't be empty";
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
                                if (_name_validate.currentState!.validate() &&
                                    _email_validate.currentState!.validate() &&
                                    _password_validate.currentState!
                                        .validate() &&
                                    _reEnterPassword_validate.currentState!
                                        .validate() &&
                                    _address_validate.currentState!
                                        .validate()) {
                                  setState(() {
                                    loader = true;
                                  });

                                  var use = index == 0 ? "Hire" : "Sell";
                                  registerUser(_name.text, _email.text,
                                      _address.text, use);
                                  auth
                                      .createUserWithEmailAndPassword(
                                          email: _email.text,
                                          password: _password.text)
                                      .then((value) => {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignInScreen()))
                                          });
                                  NotificationService().showNotification(
                                      1,
                                      'SignUp Successful',
                                      "You have been signed up as a ${index == 0 ? "Customer" : "Freelancer"}",
                                      5);
                                }
                              },
                              child: Center(
                                  child:
                                      Text(authenticationContent[1].loginSignup,
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
                                      authenticationContent[1]
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
                          authenticationContent[1].dontHaveAnAccount,
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
                                      builder: (context) => SignInScreen()));
                            });
                          },
                          child: Text(
                            authenticationContent[1].buttonLoginSignup,
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

  void registerUser(
      String name, String email, String address, String use) async {
    var postData;
    if (use == 'Sell') {
      postData = {
        'name': name,
        'email': email,
        'address': address,
        'use': use,
        'rating': 0,
      };
    } else
      // User Entry
      postData = {
        'name': name,
        'email': email,
        'address': address,
        'use': use,
      };
    final _email = email.split('.');
    final Map<String, Map> updates = {};
    updates['${_email[0]}'] = postData;

    return FirebaseDatabase.instance.ref("Users").update(updates);
  }
}
