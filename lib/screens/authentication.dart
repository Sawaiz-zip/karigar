import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final _name_validate = GlobalKey<FormState>();
  final _email_validate = GlobalKey<FormState>();

  final _password_validate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('Hire',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        )),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Sell',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                'Hello,',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                ),
              ),
              Text(
                'create a new account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50, right: 50),
                child: Form(
                  key: _name_validate,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(fontFamily: 'Poppins')),
                    controller: _name,
                    validator: (value) {
                      if (value!.isEmpty || value == null)
                        return 'Required Field';
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50, right: 50),
                child: Form(
                  key: _email_validate,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(fontFamily: 'Poppins')),
                    controller: _email,
                    validator: (value) {
                      if (value!.isEmpty || value == null)
                        return 'Required Field';
                      if (!value.contains("@") || !value.contains(".com"))
                        return "Invalid Email!";
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Form(
                  key: _password_validate,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(fontFamily: 'Poppins')),
                    controller: _password,
                    validator: (value) {
                      if (value!.isEmpty || value == null)
                        return 'Required Field';
                      if (value.length < 5)
                        return 'Password length must be greater than 5';
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45.0),
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
                        child: Center(
                            child: Text('Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                ))),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45.0),
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
                        child: Center(
                            child: Text('Signup with Google',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                ))),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
