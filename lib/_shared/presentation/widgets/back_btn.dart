import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back));
  }
}
