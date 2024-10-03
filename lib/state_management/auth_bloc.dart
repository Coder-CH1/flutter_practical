import 'package:assessment/state_management/auth_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth_manager/auth_manager.dart';
import '../auth_manager/model.dart';

//BLOC STATE MANAGEMENT
class AuthBloc extends Bloc<AuthEvent, Welcome?> {
  final AuthManager authManager;

  AuthBloc(this.authManager) : super(null) {
    on<FetchUser>((event, emit) async {
      try {
        final user = await authManager.signup(
            event.firstName, event.lastName, event.email, event.password, event.phoneNumber, event.dob);
        emit(user);
      } catch (_) {
        emit(null);
      }
    });

    on<FetchUser>((event, emit) async {
    try {
      final user = await authManager.login(
          event.email, event.password);
      emit(user);
    } catch (_) {
      emit(null);
      }
    });
  }
}




