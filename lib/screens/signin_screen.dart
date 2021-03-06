import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:karigar/controllers/profile_controller.dart';
import 'package:karigar/models/authentication_model.dart';
import 'package:karigar/screens/freelancer.dart';
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

  // ignore: unused_field
  bool _rememberMe = false;

  // ignore: non_constant_identifier_names
  final _email_validate = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  final _password_validate = GlobalKey<FormState>();
  final profileController = Get.find<ProfileController>();
  bool loader = false;
  int index = 0;
  int signUp = 1;
  int loginEmailIndex = -1;
  var data;
  void readData() {
    DatabaseReference users = FirebaseDatabase.instance.ref('Users');
    users.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value;
    });
  }

  @override
  void initState() {
    loader = false;
    readData();
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
                        _size.height * 0.2, _size.width * 0.2, 0),
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
                            return 'Wrong Password!';
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
                                  var key;
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
                                            key = _email.text.split('.'),
                                            profileController.address =
                                                data[key[0]]["address"],
                                            profileController.name =
                                                data[key[0]]["name"],
                                            profileController.use =
                                                data[key[0]]["use"],
                                            if (data[key[0]]["use"] == "Hire")
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeScreen()))
                                            else
                                              {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Freelancer()))
                                              }
                                          })
                                      .catchError((error) {
                                    setState(() {
                                      loader = false;
                                    });
                                    print("ERROR");
                                    print(error);
                                    // Handle Errors here.
                                    var errorCode = error.code;
                                    if (errorCode == 'wrong-password') {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Error"),
                                              content: Text(error.message),
                                              actions: [
                                                FlatButton(
                                                  child: Text("Ok"),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                )
                                              ],
                                            );
                                          });

                                      //console.log(error);
                                    }
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
