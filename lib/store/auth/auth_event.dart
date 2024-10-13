part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthenticateUser extends AuthEvent {
  final String email;
  final String password;
  final bool isSignupFlow;

  AuthenticateUser(this.email, this.password, this.isSignupFlow);
}