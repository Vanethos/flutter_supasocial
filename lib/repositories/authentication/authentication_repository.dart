import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationRepository {
  final SupabaseClient client;

  AuthenticationRepository(this.client);

  Future<bool> signIn(String email, String password) async {
    final response = await client.auth.signIn(email: email, password: password);
    if (response.error != null) {
      return false;
    }

    return true;
  }

  Future<bool> subscribe(String email, String password) async {
    final response = await client.auth.signUp(email, password);
    if (response.error != null) {
      return false;
    }

    return true;
  }

  Future<bool> logout() async {
    final logout = await client.auth.signOut();
    if (logout.error != null) {
      return false;
    }

    return true;
  }

  bool isUserAuthenticated() {
    return client.auth.currentSession != null;
  }
}
