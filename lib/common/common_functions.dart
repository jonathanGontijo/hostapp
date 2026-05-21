import 'package:flutter/material.dart';

class CommonFunctions {
  static showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), ),
    );
}}