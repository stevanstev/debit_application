mixin FormValidation {
  String validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty || phoneNumber == null) {
      return 'Phone Number is Empty!';
    }

    return '';
  }
}
