part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState{
  final String message;
  final String? token;
  AuthSuccess(this.token, this.message);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}