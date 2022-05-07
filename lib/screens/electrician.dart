import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:get/get.dart';
import 'package:karigar/controllers/cart_controller.dart';
import 'package:karigar/models/electrician/electrician_services_model.dart';
import 'package:karigar/screens/electrician_services/fridge.dart';
import 'package:karigar/screens/electrician_services/machine.dart';
import 'package:karigar/screens/electrician_services/motor.dart';
import 'package:karigar/screens/electrician_services/tv.dart';
import 'package:karigar/themes/drawer.dart';
import 'package:flutter/material.dart';
import 'package:karigar/screens/cart.dart';
import 'package:karigar/utils/assets.dart';

class Electrician extends StatefulWidget {
  const Electrician({Key? key}) : super(key: key);

  @override
  State<Electrician> createState() => _ElectricianState();
}

class _ElectricianState extends State<Electrician> {
  final electricianServices = [Motor(), Fridge(), Machine(), TV()];
  PageController _pageController = PageController(
    initialPage: 0,
  );
  int _selectedService = 0;
  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(builder: (AppBarContext) {
          return IconButton(
            icon: Image.asset(Assets.drawerBlack),
            onPressed: () => Scaffold.of(AppBarContext).openDrawer(),
          );
        }),
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
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart())),
                ),
              )),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0, _size.height * 0.03, _size.width * 0.3, 0),
                child: AutoSizeText(
                  'Electrician',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0, 0, _size.width * 0.3, _size.height * 0.03),
                child: AutoSizeText(
                  'Professional and efficient service',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
                  height: 40,
                  width: 340,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Search Services',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(Assets.search),
                        ),
                      ]),
                ),
              ),
              Center(
                child: Text(
                  electricianServicesContent[_selectedService].name,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 15),
                  maxLines: 1,
                ),
              ),
              Container(
                height: 400,
                child: PageView.builder(
                    itemCount: electricianServicesContent.length,
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _selectedService = index;
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          Center(
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => electricianServices[
                                          _selectedService])),
                              child: Container(
                                  height: 330,
                                  margin: const EdgeInsets.all(20),
                                  width: 250,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(40),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            electricianServicesContent[
                                                    _selectedService]
                                                .image)),
                                    color: Color.fromRGBO(239, 239, 239, 1),
                                  )),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 155,
                            child: InkWell(
                              onTap: () {},
                              child: Image.asset(Assets.favouriteBlack),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                electricianServicesContent[_selectedService].title,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              AutoSizeText(
                electricianServicesContent[_selectedService].description,
                style: TextStyle(fontSize: 9),
                maxFontSize: 12,
                maxLines: 4,
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset(Assets.arrow),
            ]),
      ),
      drawer: KarigarDrawer(),
    );
  }
}
