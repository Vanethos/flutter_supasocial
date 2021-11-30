import 'package:flutter/material.dart';

const String routeSplash = "/";
const String routeLogin = "/login";
const String routeTimeline = "/timeline";

Future<void> navigateToLogin(BuildContext context) =>
    Navigator.of(context).pushNamedAndRemoveUntil(routeLogin, (_) => false);

Future<void> navigateToTimeline(BuildContext context) =>
    Navigator.of(context).pushReplacementNamed(routeTimeline);
