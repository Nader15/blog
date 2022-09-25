class AppValidations {
  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'You must enter your Password';
    } else if (value.length < 6) {
      return 'Enter your Correct Password';
    } else {
      return null;
    }
  }
  // static String? validatePassword(String value) {
  //   RegExp regex =
  //   RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  //   if (value.isEmpty) {
  //     return 'Please enter password';
  //   } else {
  //     if (!regex.hasMatch(value)) {
  //       return 'Enter valid password';
  //     } else {
  //       return null;
  //     }
  //   }
  // }
}
