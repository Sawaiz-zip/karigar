import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karigar/controllers/cart_controller.dart';
import 'package:karigar/models/electrician/fridge_model.dart';
import 'package:karigar/screens/cart.dart';
import 'package:karigar/utils/assets.dart';
import 'package:badges/badges.dart';

class Fridge extends StatefulWidget {
  const Fridge({Key? key}) : super(key: key);

  @override
  State<Fridge> createState() => _FridgeState();
}

class _FridgeState extends State<Fridge> {
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
                  badgeContent:
                      Obx(() => Text(cartController.totalCount.toString())),
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
            'Fridge Mechanic',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
            itemCount: fridgeContent.length,
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
                      Image.asset(fridgeContent[index].image),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(fridgeContent[index].title,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                          Container(
                            width: 120,
                            child: AutoSizeText(
                              fridgeContent[index].description,
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
                                '${fridgeContent[index].amount} PKR',
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
                                          if (fridgeContent[index].counter - 1 <
                                              0)
                                            ;
                                          else
                                            setState(() {
                                              fridgeContent[index].counter--;
                                              cartController.decrement();
                                            });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(Assets.minusGrey),
                                        ),
                                      ),
                                      Text(fridgeContent[index]
                                          .counter
                                          .toString()),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () => setState(() {
                                          fridgeContent[index].counter++;
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
