class ErrorHandling {
  static handleError(String e) {
    if (e == "email-already-in-use") {
      return "The email is already in use";
    } else if (e == "channel-error") {
      return "The fields can't be empty";
    } else if (e == "invalid-email") {
      return "Invalid email format";
    } else if (e == "user-not-found" || e == "wrong-password") {
      return "Invalid email or password";
    } else {
      return "An error occured";
    }
  }
}
