import 'package:dailyzap/helpers/globals/navigator.dart';
import 'package:flutter/material.dart';

Future<bool> confirm(String headline, String content) async {
  final context = navigatorKey.currentContext;
  if (context == null) {
    return false;
  }
  return (await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(headline),
                content: Text(content),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text("No")),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text("Yes")),
                ],
              ))) ??
      false;
}
