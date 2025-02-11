import 'package:flutter/material.dart';
import 'package:go_find_taxi/_shared/presentation/widgets/back_btn.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Align(
        alignment: Alignment.centerLeft,
        child: BackBtn(),
      ),
    );
  }
}
