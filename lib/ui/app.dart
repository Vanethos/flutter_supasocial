import 'package:awesome_network/ui/assets/theme.dart';
import 'package:awesome_network/ui/screens/login/login_page.dart';
import 'package:flutter/material.dart';

class AwesomeNetworkApp extends StatelessWidget {
  const AwesomeNetworkApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: const LoginScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
