import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:karigar/screens/cart.dart';
import 'package:karigar/utils/assets.dart';

class Electrician extends StatefulWidget {
  const Electrician({Key? key}) : super(key: key);

  @override
  State<Electrician> createState() => _ElectricianState();
}

class _ElectricianState extends State<Electrician> {
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
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
                          onPressed: () {},
                          child: Text('All services',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 12))),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
                          onPressed: () {},
                          child: Text('Motor',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                  fontSize: 12))),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
                          onPressed: () {},
                          child: Text('Fridge',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                  fontSize: 12))),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
                          onPressed: () {},
                          child: Text('Machine',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                  fontSize: 12))),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 330,
                  width: 250,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                          image: AssetImage(Assets.tvTechnicianCover)),
                      color: Color(0xB2FFB8B8)),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                        onTap: () {},
                        child: Image.asset(Assets.favouriteBlack)),
                  ),
                ),
              )
            ]),
      ),
      drawer: Drawer(),
    );
  }
}
