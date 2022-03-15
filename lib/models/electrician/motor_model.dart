import 'package:karigar/utils/assets.dart';

class MotorContent {
  String title;
  String description;
  int amount;
  String image;
  int counter = 0;

  MotorContent({
    required this.title,
    required this.description,
    required this.amount,
    required this.image,
  });
}

List<MotorContent> motorContent = [
  MotorContent(
      title: 'New Motor Installation',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.",
      amount: 2500,
      image: Assets.defaultElectricianServices),
  MotorContent(
      title: 'Motor Repair',
      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit",
      amount: 500,
      image: Assets.defaultElectricianServices),
  MotorContent(
      title: 'Motor Cover Change',
      description: "Lorem ipsum dolor sit amet, consectetur",
      amount: 500,
      image: Assets.defaultElectricianServices),
  MotorContent(
    title: 'Short Circuit Repair',
    description:
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor",
    amount: 300,
    image: Assets.defaultElectricianServices,
  ),
  MotorContent(
      title: 'Fuse Change',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut",
      amount: 250,
      image: Assets.defaultElectricianServices),
];
