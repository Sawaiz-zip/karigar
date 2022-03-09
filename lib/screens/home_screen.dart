import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:karigar/screens/cart.dart';
import 'package:karigar/screens/electrician.dart';
import 'package:karigar/utils/assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, _size.height * 0.03,
                  _size.width * 0.3, _size.height * 0.03),
              child: AutoSizeText(
                'Search for any kind of job that you want done',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
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
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Electrician())),
              child: Container(
                padding: const EdgeInsets.all(20),
                height: 200,
                width: _size.width * 0.9,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(Assets.electricianCover),
                        fit: BoxFit.fill)),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Electrician',
                    style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(3, 3),
                            blurRadius: 5.0,
                            color: Colors.black,
                          ),
                        ],
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 350,
                  width: _size.width * 0.4,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(Assets.plumberCover),
                          fit: BoxFit.fill)),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Plumber',
                      style: TextStyle(
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(3, 3),
                              blurRadius: 5.0,
                              color: Colors.black,
                            ),
                          ],
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: 160,
                        width: _size.width * 0.4,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(Assets.carpenterCover),
                                fit: BoxFit.fill)),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Carpenter',
                            style: TextStyle(
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(3, 3),
                                    blurRadius: 5.0,
                                    color: Colors.black,
                                  ),
                                ],
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: 160,
                      width: _size.width * 0.4,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(Assets.painterCover),
                              fit: BoxFit.fill)),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Painting',
                          style: TextStyle(
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(3, 3),
                                  blurRadius: 5.0,
                                  color: Colors.black,
                                ),
                              ],
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
