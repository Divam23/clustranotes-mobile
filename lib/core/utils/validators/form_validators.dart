class FormValidators {
  static String? validateName(String? name){
    final nameRegex = RegExp(r"^[a-zA-Z\s'\-]+$");
    if(name == null || name.trim().isEmpty ){
      return "Name can't be empty";
    }
    if(!nameRegex.hasMatch(name)){
      return "Name can't contain special characters and numbers (only space and ' allowed)";
    }
    if(name.length < 2){
      return "Name must be at least 2 letters long";
    }
    return null;
  }

  static String? validateEmail(String? email) {
    final value = email?.trim();

    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }

    final emailRegex = RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty';
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (password.length > 64) {
      return 'Password must be at most 64 characters long';
    }

    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password must contain a lowercase letter';
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must contain an uppercase letter';
    }

    if (!RegExp(r'\d').hasMatch(password)) {
      return 'Password must contain a number';
    }

    if (!RegExp(r'[^\w\s]').hasMatch(password)) {
      return 'Password must contain a special character';
    }

    return null;
  }
}
