import 'package:karigar/utils/assets.dart';

class DrawerContent {
  String title;
  String image;
  DrawerContent({required this.title, required this.image});
}

List<DrawerContent> drawerContent = [
  DrawerContent(title: 'Profile', image: Assets.profileWhite),
  DrawerContent(title: 'Previous Orders', image: Assets.previousOrdersWhite),
  DrawerContent(title: 'Favourites', image: Assets.favouritesWhite),
  DrawerContent(title: 'Reminders', image: Assets.remindersWhite),
  DrawerContent(title: 'Manage Credit Card', image: Assets.creditCardWhite),
  DrawerContent(title: 'Logout', image: Assets.logoutWhite),
];
