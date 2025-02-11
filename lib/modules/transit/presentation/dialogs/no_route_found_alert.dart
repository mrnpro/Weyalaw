import 'package:flutter/material.dart';

void showNoRouteFoundAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Oops!"),
      content: const Text(
          "Couldn't find any route similar to your search. Please try another route."),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("OK"),
        ),
      ],
    ),
  );
}
