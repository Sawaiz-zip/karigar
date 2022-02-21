class AuthenticationContent {
  String title;
  String subtitle;
  String signUpEmail;
  String loginSignup;
  String loginSignupGoogle;
  String dontHaveAnAccount;
  String buttonLoginSignup;

  AuthenticationContent(
      {required this.subtitle,
      required this.title,
      required this.signUpEmail,
      required this.loginSignup,
      required this.loginSignupGoogle,
      required this.dontHaveAnAccount,
      required this.buttonLoginSignup});
}

List<AuthenticationContent> authenticationContent = [
  AuthenticationContent(
      title: "Welcome,",
      subtitle: "login into your account",
      loginSignup: "Login",
      signUpEmail: "Username/Email",
      loginSignupGoogle: "Login with Google",
      dontHaveAnAccount: "Don't have an account?",
      buttonLoginSignup: "Sign Up"),
  AuthenticationContent(
      title: "Hello,",
      subtitle: "create a new account",
      loginSignup: "Sign Up",
      signUpEmail: "Email",
      loginSignupGoogle: "Signup with Google",
      dontHaveAnAccount: "Already have an account?",
      buttonLoginSignup: "Log In"),
];
