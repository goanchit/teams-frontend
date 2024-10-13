import 'package:shopper/api/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationRepository {
  final SupabaseLayer sbase;
  AuthenticationRepository(this.sbase); 

  Future<String?> handleSignup(String email, String password, bool isLoginFlow) async {
    final AuthResponse? res;
    if (isLoginFlow) {
      res = await sbase.login(email, password);
    } else {
      res = await sbase.signUp(email, password);
    }
    if (res != null) {
      return res.session?.accessToken;
    }
    return '';
  }
}