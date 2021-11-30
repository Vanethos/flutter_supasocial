import 'package:awesome_network/configs/keys.dart';
import 'package:awesome_network/repositories/authentication/authentication_repository.dart';
import 'package:awesome_network/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: supabaseUrl, anonKey: supabaseAnonKey, debug: true // optional
      );

  final authenticationRepository =
      AuthenticationRepository(Supabase.instance.client);

  runApp(
    AwesomeNetworkApp(
      authenticationRepository: authenticationRepository,
    ),
  );
}
