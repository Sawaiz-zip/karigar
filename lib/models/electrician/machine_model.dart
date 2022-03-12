import 'package:karigar/utils/assets.dart';

class MachineContent {
  String title;
  String description;
  String image;

  MachineContent(
      {required this.title, required this.description, required this.image});
}

List<MachineContent> machineContent = [
  MachineContent(
      title: 'Machine Technician',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.tvTechnicianCover),
  MachineContent(
      title: 'Fix Machine',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.fixSomethingCover),
  MachineContent(
      title: 'More Machine Stuff',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.tvTechnicianCover),
  MachineContent(
      title: 'Machine 4',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.fixSomethingCover),
];
