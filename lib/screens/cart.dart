import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:karigar/controllers/cart_controller.dart';
import 'package:karigar/models/electrician/fridge_model.dart';
import 'package:karigar/models/electrician/machine_model.dart';
import 'package:karigar/models/electrician/motor_model.dart';
import 'package:karigar/models/electrician/tv_model.dart';
import 'package:karigar/screens/location.dart';
import 'package:karigar/screens/payment.dart';
import 'package:karigar/utils/assets.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Widget> CartItem = [SizedBox()];
  List cartContent = [fridgeContent, motorContent, machineContent, tvContent];
  int cartCounter = 0;
  int subTotal = 0;
  int visitingFee = 200;
  final cartController = Get.find<CartController>();
  //bool _promoCodeValid = false;
  final _promoCodeValidator = GlobalKey<FormState>();
  TextEditingController _promoCode = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    subTotal = 0;
    for (int i = 0; i < cartContent.length; i++) {
      for (int j = 0; j < cartContent[i].length; j++) {
        subTotal += int.parse(cartContent[i][j].amount.toString()) *
            int.parse(cartContent[i][j].counter.toString());
      }
    }
    if (subTotal == 0) visitingFee = 0;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Cart',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Image.asset(Assets.backArrowBlack)),
        ),
        body: subTotal > 0
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    for (int cartCounter = 0;
                        cartCounter < cartContent.length;
                        cartCounter++)
                      for (int index = 0;
                          index < cartContent[cartCounter].length;
                          index++)
                        if (cartContent[cartCounter][index].counter != 0)
                          Padding(
                            padding: const EdgeInsets.all(40),
                            child: Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 7,
                              child: Container(
                                height: 160,
                                color: Color.fromRGBO(229, 229, 229, 0.2),
                                child: Row(children: [
                                  Image.asset(
                                      cartContent[cartCounter][index].image),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          cartContent[cartCounter][index].title,
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500)),
                                      Container(
                                        width: 120,
                                        child: AutoSizeText(
                                          cartContent[cartCounter][index]
                                              .description,
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
                                            '${cartContent[cartCounter][index].amount} PKR'
                                                .toString(),
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
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () {
                                                      if (cartContent[cartCounter]
                                                                      [index]
                                                                  .counter -
                                                              1 <
                                                          0)
                                                        ;
                                                      else
                                                        setState(() {
                                                          cartContent[cartCounter]
                                                                  [index]
                                                              .counter--;
                                                          cartController
                                                              .decrement();
                                                        });
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Image.asset(
                                                          Assets.minusGrey),
                                                    ),
                                                  ),
                                                  Text(cartContent[cartCounter]
                                                          [index]
                                                      .counter
                                                      .toString()),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () => setState(() {
                                                      cartContent[cartCounter++]
                                                              [index]
                                                          .counter++;
                                                      cartController
                                                          .increment();
                                                    }),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Image.asset(
                                                          Assets.plusGrey),
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ]),
                              ),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(0, 0, 0, 0.35),
                            ),
                            borderRadius: BorderRadius.circular(26)),
                        height: 45,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: SizedBox(
                                  width: 250,
                                  child: Form(
                                    key: _promoCodeValidator,
                                    child: TextFormField(
                                      controller: _promoCode,
                                      validator: (value) {
                                        // for (int i = 0;
                                        //     i < promoCodeContent.length;
                                        //     i++) {
                                        //   if (_promoCode.value ==
                                        //       promoCodeContent[i]) {
                                        //     setState(
                                        //         () => _promoCodeValid = true);
                                        //     return null;
                                        //   } else
                                        //     setState(
                                        //         () => _promoCodeValid = false);
                                        // }

                                        return null;
                                      },
                                      cursorColor: Colors.grey,
                                      decoration: InputDecoration.collapsed(
                                          hintText: 'Add promo code',
                                          hintStyle: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300)),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    // if (_promoCodeValidator.currentState!
                                    //     .validate()) {
                                    //   setState(() => _promoCodeValid = true);

                                    //   print(_promoCodeValid);
                                    // } else {
                                    //   setState(() => _promoCodeValid = false);
                                    //   print(_promoCodeValid);
                                    // }
                                  },
                                  icon: Image.asset(Assets.promoCodeBlack))
                            ]),
                      ),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: _promoCodeValid
                    //           ? Colors.greenAccent.shade100
                    //           : Colors.redAccent.shade100),
                    //   child: AnimatedCrossFade(
                    //     firstChild: Text('InValid'),
                    //     secondChild: Text('Valid'),
                    //     crossFadeState: _promoCodeValid
                    //         ? CrossFadeState.showSecond
                    //         : CrossFadeState.showFirst,
                    //     duration: Duration(seconds: 0),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              Text(
                                '$subTotal PKR',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Visiting Fee',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              Text(
                                '$visitingFee PKR',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              Text(
                                '${(subTotal + visitingFee)} PKR',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Location())),
                        },
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(26),
                          ),
                          height: 45,
                          child: Center(
                            child: Text(
                              'Proceed to checkout',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'There is nothing in the cart',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 30,
                  ),
                ),
              )));
  }
}
