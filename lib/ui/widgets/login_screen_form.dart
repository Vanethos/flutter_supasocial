import 'package:flutter/material.dart';

class LoginScreenForm extends StatefulWidget {
  final String hint;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType inputType;
  final Function(String)? onChanged;

  const LoginScreenForm({
    Key? key,
    required this.hint,
    required this.controller,
    this.onChanged,
    this.obscureText = false,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  State<LoginScreenForm> createState() => _LoginScreenFormState();
}

class _LoginScreenFormState extends State<LoginScreenForm> {
  var _textObscured = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _textObscured,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          suffixIcon: widget.obscureText
              ? (_textObscured
                  ? IconButton(
                      onPressed: () => setState(() {
                        _textObscured = false;
                      }),
                      icon: const Icon(Icons.visibility),
                    )
                  : IconButton(
                      onPressed: () => setState(() {
                        _textObscured = true;
                      }),
                      icon: const Icon(Icons.visibility_off),
                    ))
              : null,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onBackground,
              width: 2.0,
            ),
          ),
          hintText: widget.hint,
        ),
      ),
    );
  }
}
