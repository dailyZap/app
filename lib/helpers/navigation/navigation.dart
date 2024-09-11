import 'package:dailyzap/helpers/globals/navigator.dart';
import 'package:flutter/material.dart';

void navigate(String route, {Map<String, dynamic>? arguments}) {
  navigatorKey.currentState?.pushNamedAndRemoveUntil(
      route, ModalRoute.withName(route),
      arguments: arguments);
}

void navigateNewSubPage(String route, {Map<String, dynamic>? arguments}) {
  navigatorKey.currentState?.pushNamed(route, arguments: arguments);
}
