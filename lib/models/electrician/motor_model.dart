import 'package:karigar/utils/assets.dart';

class MotorContent {
  String title;
  String description;
  String image;

  MotorContent(
      {required this.title, required this.description, required this.image});
}

List<MotorContent> motorContent = [
  MotorContent(
      title: 'Motor Technician',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.tvTechnicianCover),
  MotorContent(
      title: 'Fix Motor',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.fixSomethingCover),
  MotorContent(
      title: 'More Motor Stuff',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.tvTechnicianCover),
  MotorContent(
      title: 'Motor 4',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.fixSomethingCover),
];
