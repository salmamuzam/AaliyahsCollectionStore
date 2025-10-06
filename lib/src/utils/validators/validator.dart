class AaliyahValidator {
  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return "First Name is required!";
    }

    if (value.contains(RegExp(r'[0-9]'))) {
      return "First Name must contain only letters!";
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return "Last Name is required!";
    }

    if (value.contains(RegExp(r'[0-9]'))) {
      return "Last Name must contain only letters!";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required!";
    }

    // Standard email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return "Invalid email address!";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required!";
    }

    // Check for minimum password length
    if (value.length < 6) {
      return "Password must be at least 6 characters long!";
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one uppercase letter!";
    }

    // Check for number
    if (!value.contains(RegExp(r'\d'))) {
      return "Password must contain at least one number!";
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}<>]'))) {
      return "Password must contain at least one special character!";
    }

    return null;
  }
}
