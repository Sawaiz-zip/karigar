class OnboardingContent {
  String image;
  String title;
  String discription;

  OnboardingContent(
      {required this.image, required this.title, required this.discription});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: "All kind of services",
      discription:
          "Hire our expert workers for your paint jobs, plumbing services, electricity services, carpentry, pest control, and other services",
      image: "assets/images/onboarding_1.svg"),
  OnboardingContent(
      title: "On time services",
      discription:
          "Tired of waiting for your workers to show up? Try us for the best on time services",
      image: "assets/images/onboarding_2.svg"),
  OnboardingContent(
      title: "Police verified workers",
      discription:
          "We run a background check on every service provider we hire, so you can feel safe while availing our services",
      image: "assets/images/onboarding_3.svg"),
  OnboardingContent(
      title: "Secure Payments",
      discription:
          "We employee the best and the most secure, standard practices of payment processing ",
      image: "assets/images/onboarding_4.svg")
];
