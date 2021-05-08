class Validators {
  static bool isValidEmail(String email) {
    final String emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(emailPattern, caseSensitive: false).hasMatch(email);
  }

  static String isValidUserName(String username) {
    if (username.length < 5 || username.length > 15) return "Username phải bao gồm 5-15 ký tự";

    final String usernamePattern = "\^[A-Za-z0-9_]+\$";
    if (!RegExp(usernamePattern, caseSensitive: false).hasMatch(username)) {
      return "Username phải có dạng: abc123, abc_123";
    }
    return "";
  }

  static bool isValidTag(String tag) {
    if (tag.length < 2 || tag.length > 30) return false;

    final String tagPattern = "\^[A-Za-z0-9]+\$";
    return RegExp(tagPattern, caseSensitive: false).hasMatch(tag);
  }

  static bool isValidName(String name) {
    return name.isEmpty || name.length > 15 ? false : true;
  }

  static String isValidPhoneNumber(String phone) {
    final String phonePattern = r'^(0)+([0-9]{9})$';
    if (phone == null || phone == "") {
      return "phone not empty";
    } else {
      if (!RegExp(phonePattern, caseSensitive: false).hasMatch(phone)) {
        return "errInvalidPhone";
      }
    }
    return "";
  }

  static bool isValidPassword(String password) => password.length < 6 ? false : true;

  static bool isValidNumber(String number) {
    final String numberPattern = "\^[0-9]+\$";
    return RegExp(numberPattern, caseSensitive: false).hasMatch(number);
  }
}
