class StringUtils {
  static bool isEmailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static String? readPlurals(int value, {String? singular, String? plural}) {
    String? result = "";
    if (value == 1) {
      result = singular;
    } else if (value > 0) {
      result = plural;
    }
    return result;
  }

  static String getText(String? text, String placeholder) {
    return (text != null && text.isNotEmpty) ? text : placeholder;
  }
}
