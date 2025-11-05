mixin AppValidator {
  String? emailValidator(String? value, {bool checkEmpty = true}) {
    if (!checkEmpty && _isEmpty(value)) {
      return null;
    }
    if (_isEmpty(value)) {
      return 'Please Enter Your Email';
    }
    var emailValidPattern = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!emailValidPattern.hasMatch(value!)) {
      return 'Please enter valid email';
    }
    return null;
  }
  String? nameValidator(String? value) {
    if (_isEmpty(value)) {
      return 'Please enter your name';
    }
    var nameValidPattern = RegExp(r"^[a-zA-Z\s]+$");
    if (!nameValidPattern.hasMatch(value!.trim())) {
      return 'Please enter a valid name';
    }
    return null;
  }
  String? landlineNumberValidator(String? value, {bool returnEmptyString = false}) {
    if (value == null || value.trim().isEmpty) {
      if (returnEmptyString) {
        return '';
      }
      return 'Please enter landline number';
    }

    String pattern = r'^[0-9]{10}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value.trim())) {
      if (returnEmptyString) {
        return '';
      }
      return 'Please enter a valid 10-digit landline number';
    }

    return null;
  }
  String? pincodeValidator(String? value) {
    if (_isEmpty(value)) {
      return 'Please enter pincode';
    }

    String pattern = r'^[0-9]{6}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value!.trim())) {
      return 'Please enter a valid 6-digit pincode';
    }

    return null;
  }
  String? mobileValidator(String? value, {bool returnEmptyString = false}) {
    if (value == null || value.trim().isEmpty) {
      if (returnEmptyString) {
        return '';
      }
      return 'Please enter mobile number';
    }
    String pattern = r'^[0-9]{10}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value.trim())) {
      if (returnEmptyString) {
        return '';
      }
      return 'Please enter a valid 10-digit mobile number';
    }

    return null;
  }

  String? passwordValidator(String? value) {
    if (_isEmpty(value)) {
      return 'Please enter password';
    }
    return null;
  }

  String? strongPasswordValidator(String? value) {
    if (_isEmpty(value)) {
      return '*Minimum 8 characters, with a combination of upper and\n  lower case letters, characters and numbers.';
    }

    if (value!.length < 8) {
      return '*Minimum 8 characters';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return '*At least one uppercase letter';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return '*At least one lowercase letter';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return '*At least one digit';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return '*At least one special character';
    }
    return null;
  }

  String? confirmPasswordValidator(
      {String? password, String? confirmPassword}) {
    if (_isEmpty(confirmPassword)) {
      return 'Please enter password';
    }
    if (!_isEqual(password ?? '', confirmPassword!)) {
      return 'Password is not same';
    }
    return null;
  }
  String validatePancard(String value) {
    String pattern = r'^[A-Z]{5}[0-9]{4}[A-Z]$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please Enter Pancard Number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please Enter Valid Pancard Number';
    }
    return "";
  }
  String? emptyValidator(String? value,
      {String? title, bool returnEmptyString = false}) {
    if (value == null || value.trim().isEmpty) {
      if (returnEmptyString) {
        return '';
      }
      return 'Please Enter ${title ?? ''}';
    }
    return null;
  }

  String? bankAccountNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a Bank Account Number';
    }

    String pattern = r'^[0-9]{9,18}$'; // Assuming bank account numbers are between 9 to 18 digits
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value.trim())) {
      return 'Please enter a valid Bank Account Number';
    }

    return null;
  }

  String? pfAccountNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter UAN Number';
    }

    String pattern = r'^[0-9]{12}$'; // Assuming UAN is a 12-digit number
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value.trim())) {
      return 'Please enter a valid UAN Number';
    }

    return null;
  }
/*  String? pfAccountNumberValidator(String? value) {
    if (_isEmpty(value)) {
      return 'Please enter PF Account Number';
    }

    String pattern = r'^[A-Z]{2}[0-9]{7}[A-Z0-9]{1}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value!.trim())) {
      return 'Please enter a valid PF Account Number';
    }

    return null;
  }*/
  String? emptyDropdownValidator(String? value, {String? title}) {
    if (value == null || value.trim().isEmpty) {
      return 'Please Select ${title ?? ''}';
    }
    return null;
  }

  bool _isEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return true;
    }
    return false;
  }

  bool _isEqual(String value1, String value2) {
    return value1 == value2;
  }

  String? otpValidator(String? value){
    if(_isEmpty(value)){
      return '*Please Enter Otp';
    }

    if(value!.length < 6){
      return '*Minimum 6 digits Otp';
    }
    return null;
  }
}
