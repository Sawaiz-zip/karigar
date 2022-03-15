import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karigar/controllers/cart_controller.dart';
import 'package:karigar/models/electrician/motor_model.dart';
import 'package:karigar/screens/cart.dart';
import 'package:karigar/utils/assets.dart';

class Motor extends StatefulWidget {
  const Motor({Key? key}) : super(key: key);

  @override
  State<Motor> createState() => _MotorState();
}

class _MotorState extends State<Motor> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          actions: [
            Padding(
                padding: const EdgeInsets.all(2.0),
                child: Badge(
                  badgeContent: Text(cartController.totalCount.toString()),
                  position: BadgePosition.topEnd(end: 2, top: 4),
                  elevation: 0,
                  child: IconButton(
                    icon: Image.asset(
                      Assets.cartBlack,
                    ),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart())),
                  ),
                )),
          ],
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
        body: ListView.builder(
            itemCount: motorContent.length,
            itemBuilder: (context, index) {
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
                      Image.asset(motorContent[index].image),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(motorContent[index].title,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                          Container(
                            width: 120,
                            child: AutoSizeText(
                              motorContent[index].description,
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
                                width: 10,
                              ),
                              Text(
                                motorContent[index].amount,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
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
                                          if (motorContent[index].counter - 1 <
                                              0)
                                            ;
                                          else
                                            setState(() {
                                              motorContent[index].counter--;
                                              cartController.decrement();
                                            });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(Assets.minusGrey),
                                        ),
                                      ),
                                      Text(motorContent[index]
                                          .counter
                                          .toString()),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () => setState(() {
                                          motorContent[index].counter++;
                                          cartController.increment();
                                        }),
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
