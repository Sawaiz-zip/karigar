import 'package:karigar/utils/assets.dart';

class ElectricianServices {
  String name;
  String title;
  String description;
  String image;

  ElectricianServices(
      {required this.name,
      required this.title,
      required this.description,
      required this.image});
}

List<ElectricianServices> electricianServicesContent = [
  ElectricianServices(
      name: 'Motor',
      title: 'Motor Technician',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.tvTechnicianCover),
  ElectricianServices(
      name: 'Fridge',
      title: 'Fridge Technician',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.fixSomethingCover),
  ElectricianServices(
      name: 'Machine',
      title: 'Machine Technician',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.tvTechnicianCover),
  ElectricianServices(
      name: 'TV',
      title: 'TV Technician',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.tvTechnicianCover),
];
