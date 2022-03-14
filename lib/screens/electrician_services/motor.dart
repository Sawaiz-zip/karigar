import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:karigar/utils/assets.dart';

class Motor extends StatefulWidget {
  const Motor({Key? key}) : super(key: key);

  @override
  State<Motor> createState() => _MotorState();
}

class _MotorState extends State<Motor> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Image.asset(Assets.backArrowBlack),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Motor Mechanic',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(40),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 7,
              child: Container(
                height: 160,
                color: Color.fromRGBO(229, 229, 229, 0.2),
                child: Row(children: [
                  Image.asset(Assets.defaultElectricianServices),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('New Motor Installation',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      Container(
                        width: 120,
                        child: AutoSizeText(
                          'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 9,
                              fontWeight: FontWeight.w300),
                          maxLines: 3,
                          maxFontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text('25\$'),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            height: 36,
                            width: 86,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      if (_counter - 1 < 0)
                                        ;
                                      else
                                        setState(() => _counter--);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(Assets.minusGrey),
                                    ),
                                  ),
                                  Text(_counter.toString()),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () => setState(() => _counter++),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(Assets.plusGrey),
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      )
                    ],
                  )
                ]),
              ),
            ),
          );
        }));
  }
}