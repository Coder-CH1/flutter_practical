/// BLOC STATE MANAGEMENT EVENT
abstract class AuthEvent{}

class FetchSignupUser extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final String dob;

  FetchSignupUser(this.firstName, this.lastName, this.email, this.password, this.phoneNumber, this.dob);
}

class FetchLoginUser extends AuthEvent {
  final String email;
  final String password;

  FetchLoginUser(this.email, this.password);
}

class LoadSavedWeather extends AuthEvent {}