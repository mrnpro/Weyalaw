import 'package:flutter/material.dart';

class BorderLessTextField extends StatelessWidget {
  const BorderLessTextField(
      {super.key,
      this.onChanged,
      required this.hintText,
      required this.controller,
      required this.label});

  final String hintText;
  final TextEditingController controller;
  final String label;

  final Function(String value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
              color: const Color(0xFF000000).withOpacity(0.5),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(
          width: 300,
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              hintText: hintText,
              border: InputBorder.none,
              fillColor: Colors.transparent,
              filled: true,
            ),
          ),
        ),
      ],
    );
  }
}
