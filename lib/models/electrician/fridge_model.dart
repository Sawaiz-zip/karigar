import 'package:karigar/utils/assets.dart';

class FridgeContent {
  String title;
  String description;
  String image;

  FridgeContent(
      {required this.title, required this.description, required this.image});
}

List<FridgeContent> fridgeContent = [
  FridgeContent(
      title: 'Fridge Technician',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.tvTechnicianCover),
  FridgeContent(
      title: 'Fix Fridge',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.fixSomethingCover),
  FridgeContent(
      title: 'More Fridge Stuff',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.tvTechnicianCover),
  FridgeContent(
      title: 'Fridge 4',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.fixSomethingCover),
];
