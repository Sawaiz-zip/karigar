import 'package:karigar/utils/assets.dart';

class AllServicesContent {
  String title;
  String description;
  String image;

  AllServicesContent(
      {required this.title, required this.description, required this.image});
}

List<AllServicesContent> allServicesContent = [
  AllServicesContent(
      title: 'TV Technician',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.tvTechnicianCover),
  AllServicesContent(
      title: 'Fix Something',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.fixSomethingCover),
  AllServicesContent(
      title: '3',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.tvTechnicianCover),
  AllServicesContent(
      title: '4',
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      image: Assets.fixSomethingCover),
];
