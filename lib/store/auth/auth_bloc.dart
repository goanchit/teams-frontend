import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopper/repository/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final AuthenticationRepository authenticationRepository;

  AuthBloc(this.authenticationRepository) : super(AuthInitial()) {

    on<AuthenticateUser>((event, emit) async {
      emit(AuthLoading());
      try {
        final res = await authenticationRepository.handleSignup(event.email, event.password, event.isSignupFlow);
        if (res == '') {
          emit(AuthFailure('Invalid Credentails'));
        } else {
          emit(AuthSuccess(res, "Success"));
        }
      } catch(e) {
        emit(AuthFailure(e.toString()));
      }
    });
    
  }
}
