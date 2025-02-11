import 'package:flutter/material.dart';

class Validator {
  static String? validate(String? value, TextInputType inputType) {
    switch (inputType) {
      case TextInputType.emailAddress:
        return _validateEmail(value);
      case TextInputType.phone:
        return _validatePhone(value);
      case TextInputType.number:
        return _validateNumber(value);
      case TextInputType.url:
        return _validateUrl(value);
      case TextInputType.text:
      default:
        return _validateText(value);
    }
  }

  static String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final RegExp emailExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (!emailExp.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final RegExp phoneExp = RegExp(r'^\d{10}$');
    if (!phoneExp.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? _validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Number is required';
    }
    final num? number = num.tryParse(value);
    if (number == null) {
      return 'Enter a valid number';
    }
    return null;
  }

  static String? _validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL is required';
    }
    final RegExp urlExp = RegExp(
      r"^(https?|ftp)://[^\s/$.?#].[^\s]*$",
    );
    if (!urlExp.hasMatch(value)) {
      return 'Enter a valid URL';
    }
    return null;
  }

  static String? _validateText(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < 3) {
      return 'Text must be at least 3 characters long';
    }
    return null;
  }
}
