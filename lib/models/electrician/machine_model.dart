import 'package:karigar/utils/assets.dart';

class MachineContent {
  String title;
  String description;
  int amount;
  String image;
  int counter = 0;

  MachineContent({
    required this.title,
    required this.description,
    required this.amount,
    required this.image,
  });
}

List<MachineContent> machineContent = [
  MachineContent(
      title: 'New Machine Installation',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.",
      amount: 2500,
      image: Assets.defaultElectricianServices),
  MachineContent(
      title: 'Machine Repair',
      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit",
      amount: 1500,
      image: Assets.defaultElectricianServices),
  MachineContent(
      title: 'Machine Cover Change',
      description: "Lorem ipsum dolor sit amet, consectetur",
      amount: 500,
      image: Assets.defaultElectricianServices),
  MachineContent(
    title: 'Short Circuit Repair',
    description:
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor",
    amount: 300,
    image: Assets.defaultElectricianServices,
  ),
  MachineContent(
      title: 'Fuse Change',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut",
      amount: 250,
      image: Assets.defaultElectricianServices),
];
