import 'package:awesome_network/repositories/authentication/authentication_repository.dart';
import 'package:awesome_network/ui/navigation/navigation.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final AuthenticationRepository authenticationRepository;
  const SplashPage({
    required this.authenticationRepository,
    Key? key,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      /// Wait 1 second for the animation to play
      await Future.delayed(Duration(seconds: 1));
      if (widget.authenticationRepository.isUserAuthenticated()) {
        navigateToTimeline(context);
      } else {
        navigateToLogin(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
