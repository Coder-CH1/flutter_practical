//BLOC STATE MANAGEMENT EVENT
abstract class AuthEvent{}

class FetchUser extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final String dob;

  FetchUser(this.firstName, this.lastName, this.email, this.password, this.phoneNumber, this.dob);
}

class LoadSavedWeather extends AuthEvent {}