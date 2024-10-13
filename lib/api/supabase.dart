import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseLayer {
  Future<AuthResponse?> login(String email, String password) async {
    try {
      final AuthResponse resp;
      resp = await Supabase.instance.client.auth
          .signInWithPassword(email: email, password: password);
      return resp;
    } catch (error) {
      return null;
    }
  }


  Future<AuthResponse?> signUp(String email, String password) async {
    try {
      final AuthResponse resp;
      resp = await Supabase.instance.client.auth
          .signUp(email: email, password: password);
      return resp;
    } catch (error) {
      return null;
    }
  }

}
