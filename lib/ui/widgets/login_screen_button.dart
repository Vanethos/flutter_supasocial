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
    return MaterialButton(
      onPressed: () => enabled ? callback.call() : null,
      color: enabled
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.primary.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
