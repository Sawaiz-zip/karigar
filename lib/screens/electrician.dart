import 'package:auto_size_text/auto_size_text.dart';
import 'package:karigar/models/electrician/fridge_model.dart';
import 'package:karigar/models/electrician/machine_model.dart';
import 'package:karigar/models/electrician/motor_model.dart';
import 'package:karigar/themes/drawer.dart';
import 'package:flutter/material.dart';
import 'package:karigar/models/electrician/all_services_model.dart';
import 'package:karigar/screens/cart.dart';
import 'package:karigar/models/electrician_services_model.dart';
import 'package:karigar/utils/assets.dart';

class Electrician extends StatefulWidget {
  const Electrician({Key? key}) : super(key: key);

  @override
  State<Electrician> createState() => _ElectricianState();
}

class _ElectricianState extends State<Electrician> {
  PageController _pageController = PageController(
    initialPage: 0,
  );
  int _displayDescription = 0;
  int _selectedService = 0;
  List categories = [
    allServicesContent,
    motorContent,
    fridgeContent,
    machineContent
  ];
  @override
  Widget build(BuildContext context) {
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
          InkWell(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart())),
            child: Image.asset(Assets.cartBlack),
          )
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
              Container(
                height: 30,
                child: Expanded(
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    for (int index = 0;
                        index < electricianContent.length;
                        index++)
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
                          onPressed: () {
                            setState(() {
                              _selectedService = index;
                              _pageController.animateToPage(0,
                                  duration: Duration(microseconds: 1),
                                  curve: Curves.easeIn);
                            });
                          },
                          child: AutoSizeText(
                            electricianContent[index].service,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: _selectedService == index
                                    ? FontWeight.bold
                                    : FontWeight.w300,
                                color: Colors.black,
                                fontSize: 12),
                            maxLines: 1,
                            maxFontSize: 12,
                          ))
                  ]),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 400,
                child: Expanded(
                  flex: 1,
                  child: PageView.builder(
                      itemCount: categories[_selectedService].length,
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _displayDescription = index;
                        });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Container(
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
                                          categories[_selectedService][index]
                                              .image)),
                                  color: Color(0xB2FFB8B8)),
                            ),
                            Positioned(
                              bottom: 30,
                              left: 125,
                              child: InkWell(
                                onTap: () {},
                                child: Image.asset(Assets.favouriteBlack),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ),
              Text(
                categories[_selectedService][_displayDescription].title,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              AutoSizeText(
                categories[_selectedService][_displayDescription].description,
                style: TextStyle(fontSize: 9),
                maxFontSize: 12,
                maxLines: 4,
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset(Assets.arrow)
            ]),
      ),
      drawer: KarigarDrawer,
    );
  }
}
