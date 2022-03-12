import 'package:flutter/material.dart';
import 'package:karigar/models/drawer_model.dart';
import 'package:karigar/utils/assets.dart';

Drawer KarigarDrawer = Drawer(
  backgroundColor: Colors.black.withOpacity(0.50),
  child: ListView(
    children: [
      DrawerHeader(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 50),
          child: Row(children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image:
                    DecorationImage(image: AssetImage(Assets.defaultProfile)),
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Abdul Wasey',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Text(
                  'View Profile',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 9,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
              ],
            ),
          ]),
        ),
      ),
      for (int index = 0; index < drawerContent.length - 1; index++)
        ListTile(
          leading: Image.asset(drawerContent[index].image),
          title: Text(
            drawerContent[index].title,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 13,
                color: Colors.white),
          ),
        ),
      Padding(
        padding: const EdgeInsets.only(top: 200),
        child: ListTile(
          leading: Image.asset(drawerContent[drawerContent.length - 1].image),
          title: Text(
            drawerContent[drawerContent.length - 1].title,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 13,
                color: Colors.white),
          ),
        ),
      )
    ],
  ),
);
