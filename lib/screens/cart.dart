import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
//import 'package:http/http.dart' ;
import 'package:karigar/controllers/cart_controller.dart';
import 'package:karigar/controllers/profile_controller.dart';
import 'package:karigar/models/electrician/fridge_model.dart';
import 'package:karigar/models/electrician/machine_model.dart';
import 'package:karigar/models/electrician/motor_model.dart';
import 'package:karigar/models/electrician/tv_model.dart';
import 'package:karigar/screens/location.dart';
import 'package:karigar/screens/notification_service.dart';
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
  final profileController = Get.find<ProfileController>();
  //bool _promoCodeValid = false;
  final _promoCodeValidator = GlobalKey<FormState>();
  TextEditingController _promoCode = TextEditingController();
  FirebaseDatabase database = FirebaseDatabase.instance;
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
    cartController.totalAmount = subTotal + visitingFee;
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
                                  onPressed: () {},
                                  icon: Image.asset(Assets.promoCodeBlack))
                            ]),
                      ),
                    ),
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
                          NotificationService().showNotification(
                              1, "Karigar", "Your request has been posted", 5),
                          sendData(),
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

  void sendData() async {
    List title = [];
    List amount = [];
    List description = [];
    List counter = [];
    cartController.cartCounter = 0;
    int timeCount = 0;
    for (int cartCounter = 0; cartCounter < cartContent.length; cartCounter++)
      for (int index = 0; index < cartContent[cartCounter].length; index++)
        if (cartContent[cartCounter][index].counter != 0) {
          cartController.cartCounter++;
          title.add(cartContent[cartCounter][index].title);
          amount.add(cartContent[cartCounter][index].amount);
          counter.add(cartContent[cartCounter][index].counter);
          description.add(cartContent[cartCounter][index].description);
          timeCount++;
        }
    late List<Map<String, String>> postData = [];
    var _email = profileController.email.split('.');
    final key = _email[0];
    for (int i = 0; i < timeCount; i++) {
      postData.add({
        "title": title[i],
        "amount": amount[i].toString(),
        "counter": counter[i].toString(),
        "description": description[i].toString(),
      });
    }
    print(postData);
    final Map<String, Map> updates = {};
    for (int i = 0; i < timeCount; i++) {
      updates['${key}/$i'] = postData[i];
      FirebaseDatabase.instance.ref("Requests").update(updates);
    }
  }
}
