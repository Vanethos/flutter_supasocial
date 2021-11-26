import 'package:awesome_network/ui/widgets/login_screen_button.dart';
import 'package:awesome_network/ui/widgets/login_screen_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login ⚡'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 20,
            color: Theme.of(context).colorScheme.secondaryVariant,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _LoginBoxHeaderButton(
                        onTap: () => setState(() {
                          _index = 0;
                        }),
                        isEnabled: _isLoginPage(),
                        text: "Login",
                      ),
                    ),
                    Expanded(
                      child: _LoginBoxHeaderButton(
                        onTap: () => setState(() {
                          _index = 1;
                        }),
                        isEnabled: !_isLoginPage(),
                        text: "Subscribe",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: IndexedStack(
                    alignment: Alignment.center,
                    index: _index,
                    children: [
                      _LoginContainer(
                        onLogin: (email, password) {},
                      ),
                      _SubscribeContainer(
                        onSubscribe: (name, email, password) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isLoginPage() {
    return _index == 0;
  }
}

class _LoginBoxHeaderButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isEnabled;
  final String text;

  const _LoginBoxHeaderButton({
    Key? key,
    required this.onTap,
    required this.isEnabled,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: isEnabled ? 10 : 0,
        child: Container(
          decoration: BoxDecoration(
            color: isEnabled
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondaryVariant,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginContainer extends StatefulWidget {
  final Function(String, String) onLogin;

  const _LoginContainer({required this.onLogin, Key? key}) : super(key: key);

  @override
  __LoginContainerState createState() => __LoginContainerState();
}

class __LoginContainerState extends State<_LoginContainer> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Email
        LoginScreenForm(
          controller: emailController,
          hint: "Email",
          inputType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 12.0,
        ),
        LoginScreenForm(
          controller: passwordController,
          hint: "Password",
          obscureText: true,
        ),
        const SizedBox(
          height: 24.0,
        ),
        LoginButton(
          enabled: emailController.text.isNotEmpty &&
              passwordController.text.isNotEmpty,
          callback: () => widget.onLogin(
            emailController.text,
            passwordController.text,
          ),
          label: "Login",
        ),
      ],
    );
  }
}

class _SubscribeContainer extends StatefulWidget {
  final Function(String, String, String) onSubscribe;

  const _SubscribeContainer({required this.onSubscribe, Key? key})
      : super(key: key);

  @override
  __SubscribeContainerState createState() => __SubscribeContainerState();
}

class __SubscribeContainerState extends State<_SubscribeContainer> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /// Email
        LoginScreenForm(
          controller: nameController,
          hint: "Name",
        ),
        const SizedBox(
          height: 12.0,
        ),

        /// Email
        LoginScreenForm(
          controller: emailController,
          hint: "Email",
        ),
        const SizedBox(
          height: 12.0,
        ),

        /// Password
        LoginScreenForm(
          controller: passwordController,
          hint: "Password",
          obscureText: true,
        ),
        const SizedBox(
          height: 24.0,
        ),
        LoginButton(
          enabled: emailController.text.isNotEmpty &&
              passwordController.text.isNotEmpty,
          callback: () => widget.onSubscribe(
            nameController.text,
            emailController.text,
            passwordController.text,
          ),
          label: "Login",
        ),
      ],
    );
  }
}
