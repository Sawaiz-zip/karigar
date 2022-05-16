import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:karigar/card_number_formatter.dart';
import 'package:karigar/controllers/cart_controller.dart';
import 'package:karigar/controllers/requests_controller.dart';
import 'package:karigar/expiry_date_formatter.dart';
import 'package:karigar/models/electrician/tv_model.dart';
import 'package:karigar/screens/customer_feedback.dart';
import 'package:karigar/screens/home_screen.dart';
import 'package:karigar/utils/assets.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:timezone/data/latest.dart' as tz;
import '../models/electrician/fridge_model.dart';
import '../models/electrician/machine_model.dart';
import '../models/electrician/motor_model.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Source _source = Source();
  final _form_key = GlobalKey<FormState>();
  TextEditingController _cardNumber = TextEditingController();
  final requestsController = Get.find<RequestsController>();
  TextEditingController _expiryDate = TextEditingController();
  TextEditingController _cvc = TextEditingController();
  int subTotal = 0;
  List cartContent = [fridgeContent, motorContent, machineContent, tvContent];
  late final CreditCard testCard;
  // late tz.TZDateTime dateTime;
  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            "pk_test_51KwvIwSHEbXizT2eH9KIh9zn1L8w91aD0sinfjBsVz5W6uWjJwGJ21gnwQOt53Hw6NJ0aOZPgtXLtHB8AxDgijWR007MqK1rLr",
        merchantId: "acct_1KwvIwSHEbXizT2e",
        androidPayMode: 'test'));
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
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Image.asset(Assets.backArrowBlack)),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            20, MediaQuery.of(context).size.height * 0.25, 10, 10),
        child: Form(
            key: _form_key,
            child: ListView(
              children: [
                Text(
                  'Card Number',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
                TextFormField(
                  //autofocus: true,
                  //focusNode: _focusNode,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    new LengthLimitingTextInputFormatter(16),
                    new CardNumberFormatter(),
                  ],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: '1234 1234 1234 1234',
                    hintStyle: TextStyle(fontFamily: 'Poppins'),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                  cursorColor: Colors.black,
                  controller: _cardNumber,
                  validator: (value) {
                    if (value!.isEmpty && value.length != 16) {
                      return 'Required Field';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        //autofocus: true,
                        //focusNode: _focusNode,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          new LengthLimitingTextInputFormatter(4),
                          new ExpiryDateFormatter(),
                        ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,

                        decoration: const InputDecoration(
                          hintText: 'Expiration Date',
                          hintStyle: TextStyle(fontFamily: 'Poppins'),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                        cursorColor: Colors.black,
                        controller: _expiryDate,
                        validator: (value) {
                          if (value!.isEmpty && value.length != 4) {
                            return 'Required Field';
                          }
                          return null;
                        },
                      ),
                    ),
                    Flexible(
                      child: TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        //autofocus: true,
                        //focusNode: _focusNode,
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(3),
                        ],
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: 'CVC',
                          hintStyle: TextStyle(fontFamily: 'Poppins'),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                        cursorColor: Colors.black,
                        controller: _cvc,
                        validator: (value) {
                          if (value!.isEmpty && value.length != 3) {
                            return 'Required Field';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(26),
                    ),
                    height: 45,
                    child: Center(
                      child: Text(
                        'Pay',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  onTap: () async {
                    if (_form_key.currentState!.validate()) {
                      for (int cartCounter = 0;
                          cartCounter < cartContent.length;
                          cartCounter++)
                        for (int index = 0;
                            index < cartContent[cartCounter].length;
                            index++)
                          cartContent[cartCounter][index].counter = 0;
                      // dateTime = await NotificationService()
                      //     .timeCheck(10)
                      //     .whenComplete(
                      //       () => NotificationService().showNotification(
                      //           1,
                      //           'Karigar',
                      //           'Work has been posted. Stay tuned!',
                      //           10,
                      //           dateTime),
                      //     );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => CustomerFeedback(),
                        ),
                        (route) => false,
                      );
                      cartController.totalCount = 0.obs;
                      StripePayment.createSourceWithParams(SourceParams(
                        type: 'ideal',
                        amount:
                            ((int.parse(requestsController.totalAmount)) * 0.51)
                                .toInt(),
                        currency: 'eur',
                        returnURL: 'example://stripe-redirect',
                      )).then((source) {
                        setState(() {
                          _source = source;
                        });
                        // ignore: invalid_return_type_for_catch_error, argument_type_not_assignable_to_error_handler
                      }).catchError(() => print("Error"));
                    }
                  },
                ),
              ],
            )),
      ),
    );
  }
}
