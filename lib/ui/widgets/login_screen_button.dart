import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback callback;
  final String label;
  final bool enabled;

  const LoginButton({
    required this.callback,
    required this.label,
    required this.enabled,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => enabled ? callback.call() : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(label),
      ),
    );
  }
}
