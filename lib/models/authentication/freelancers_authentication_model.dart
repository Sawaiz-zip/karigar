class FreelancersAuthenticationContent {
  String email;
  String password;

  FreelancersAuthenticationContent(
      {required this.email, required this.password});
}

List<FreelancersAuthenticationContent> freelancersAuthenticationContent = [
  FreelancersAuthenticationContent(
      email: 'shelium@gmail.com', password: 'shelium'),
  FreelancersAuthenticationContent(
      email: 'saadkhan@gmail.com', password: 'saadkhan'),
];
