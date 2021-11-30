import 'package:awesome_network/repositories/authentication/authentication_repository.dart';
import 'package:awesome_network/ui/assets/theme.dart';
import 'package:awesome_network/ui/navigation/navigation.dart';
import 'package:awesome_network/ui/screens/login/login_page.dart';
import 'package:awesome_network/ui/screens/splash/splash_page.dart';
import 'package:awesome_network/ui/screens/timeline/timeline.dart';
import 'package:flutter/material.dart';

class AwesomeNetworkApp extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;
  const AwesomeNetworkApp({
    required this.authenticationRepository,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      initialRoute: routeSplash,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case routeLogin:
            return MaterialPageRoute(
              builder: (_) => LoginPage(
                authenticationRepository: authenticationRepository,
              ),
            );
          case routeTimeline:
            return MaterialPageRoute(
              builder: (_) => TimelinePage(
                authenticationRepository: authenticationRepository,
              ),
            );
          case routeSplash:
            return MaterialPageRoute(
              builder: (_) => SplashPage(
                authenticationRepository: authenticationRepository,
              ),
            );
        }
      },
    );
  }
}
