import 'package:karigar/utils/assets.dart';

class FreelancerProfileContent {
  String name;
  int rating;
  int charges;
  int jobsDone;
  String image;

  FreelancerProfileContent(
      {required this.name,
      required this.rating,
      required this.charges,
      required this.jobsDone,
      required this.image});
}

List<FreelancerProfileContent> freelancerProfileContent = [
  FreelancerProfileContent(
      name: 'Farhan Ali',
      rating: 5,
      charges: 1000,
      jobsDone: 467,
      image: Assets.defaultFiveStarFreelancer),
  FreelancerProfileContent(
      name: 'Sikandar Khan',
      rating: 2,
      charges: 500,
      jobsDone: 34,
      image: Assets.defaultTwoStarFreelancer),
  FreelancerProfileContent(
      name: 'Usama Khalid',
      rating: 4,
      charges: 450,
      jobsDone: 130,
      image: Assets.defaultFourStarFreelancer),
  FreelancerProfileContent(
      name: 'Shazil Tariq',
      rating: 3,
      charges: 350,
      jobsDone: 56,
      image: Assets.defaultThreeStarFreelancer),
  FreelancerProfileContent(
      name: 'Nouman Munsoor',
      rating: 1,
      charges: 300,
      jobsDone: 2,
      image: Assets.defaultOneStarFreelancer),
];
