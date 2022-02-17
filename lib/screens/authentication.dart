import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  // ignore: non_constant_identifier_names
  final _name_validate = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  final _email_validate = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  final _password_validate = GlobalKey<FormState>();

  final List _option = ['Hire', 'Sell'];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                _size.width * 0.1, _size.height * 0.03, _size.width * 0.1, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: Text('Hire',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight:
                              index == 0 ? FontWeight.w500 : FontWeight.w300
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
                    });
                  },
                  child: Text('Sell',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight:
                              index == 1 ? FontWeight.w500 : FontWeight.w300
                          //decoration: TextDecoration.underline
                          )),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                index == 0 ? _size.width * 0.656 : _size.width * 0.81, 0, 0, 0),
            child: const Text('_______'),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                _size.width * 0.1, _size.height * 0.1, _size.width * 0.2, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hello,',
                  style: TextStyle(
                    fontFamily: 'GideonRoman',
                    color: Colors.black,
                    fontSize: 50,
                  ),
                ),
                Text(
                  'create a new account',
                  style: TextStyle(
                    fontFamily: 'MoonTime',
                    color: Colors.black,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                _size.width * 0.1, _size.height * 0.04, _size.width * 0.1, 0),
            child: Form(
              key: _name_validate,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(fontFamily: 'Poppins')),
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
            padding: EdgeInsets.fromLTRB(
                _size.width * 0.1, _size.height * 0.04, _size.width * 0.1, 0),
            child: Form(
              key: _email_validate,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(fontFamily: 'Poppins')),
                controller: _email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Required Field';
                  }
                  if (!value.contains("@") || !value.contains(".com")) {
                    return "Invalid Email!";
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                _size.width * 0.1, _size.height * 0.04, _size.width * 0.1, 0),
            child: Form(
              key: _password_validate,
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(fontFamily: 'Poppins')),
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
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                _size.width * 0.1, _size.height * 0.05, _size.width * 0.1, 0),
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
                            _password_validate.currentState!.validate()) {}
                      },
                      child: const Center(
                          child: Text('Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 20,
                              ))),
                    )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                _size.width * 0.1, _size.height * 0.02, _size.width * 0.1, 0),
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
                      onTap: () async {},
                      child: const Center(
                          child: Text('Signup with Google',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 15,
                              ))),
                    )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                _size.width * 0.1, _size.height * 0.15, _size.width * 0.1, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
                const SizedBox(
                  width: 2,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
