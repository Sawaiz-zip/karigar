import 'package:karigar/utils/assets.dart';

class FridgeContent {
  String title;
  String description;
  String amount;
  String image;
  int counter = 0;

  FridgeContent({
    required this.title,
    required this.description,
    required this.amount,
    required this.image,
  });
}

List<FridgeContent> fridgeContent = [
  FridgeContent(
      title: 'New Fridge Installation',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.",
      amount: "Rs.2500/-",
      image: Assets.defaultElectricianServices),
  FridgeContent(
      title: 'Fridge Repair',
      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit",
      amount: "Rs.1500/-",
      image: Assets.defaultElectricianServices),
  FridgeContent(
      title: 'Fridge Cover Change',
      description: "Lorem ipsum dolor sit amet, consectetur",
      amount: "Rs.500/-",
      image: Assets.defaultElectricianServices),
  FridgeContent(
    title: 'Short Circuit Repair',
    description:
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor",
    amount: "Rs.300/-",
    image: Assets.defaultElectricianServices,
  ),
  FridgeContent(
      title: 'Fuse Change',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut",
      amount: "Rs.250/-",
      image: Assets.defaultElectricianServices),
];
