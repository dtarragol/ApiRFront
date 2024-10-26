import 'package:apir_front/src/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCenterTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const CustomCenterTextField({super.key, 
    required this.text, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(color: AppTheme.primaryColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primaryColor),
        ),
      ),
    );
  }
}