import 'package:awesome_network/repositories/authentication/authentication_repository.dart';
import 'package:awesome_network/ui/navigation/navigation.dart';
import 'package:awesome_network/ui/utils/utils.dart';
import 'package:flutter/material.dart';

class TimelinePage extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;
  const TimelinePage({required this.authenticationRepository, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Timeline",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(
              height: 24.0,
            ),
            LogoutButton(
              authenticationRepository: authenticationRepository,
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;
  const LogoutButton({
    required this.authenticationRepository,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final canLogout = await authenticationRepository.logout();
        if (!canLogout) {
          await showInfoDialog(
              context, "Login", "There was an error with Login");
          return;
        }
        if (canLogout) {
          navigateToLogin(context);
        }
      },
      child: const Text("LOGOUT"),
    );
  }
}
