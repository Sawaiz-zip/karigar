import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:karigar/utils/assets.dart';

class DrawerContent {
  String title;
  String image;
  VoidCallback onTap;
  DrawerContent(
      {required this.title, required this.image, required this.onTap});
}

List<DrawerContent> drawerContent = [
  DrawerContent(title: 'Profile', image: Assets.profileWhite, onTap: () => {}),
  DrawerContent(
      title: 'Previous Orders',
      image: Assets.previousOrdersWhite,
      onTap: () {}),
  DrawerContent(
      title: 'Favourites', image: Assets.favouritesWhite, onTap: () {}),
  DrawerContent(title: 'Reminders', image: Assets.remindersWhite, onTap: () {}),
  DrawerContent(
      title: 'Manage Credit Card', image: Assets.creditCardWhite, onTap: () {}),
  DrawerContent(title: 'Logout', image: Assets.logoutWhite, onTap: () {}),
];
