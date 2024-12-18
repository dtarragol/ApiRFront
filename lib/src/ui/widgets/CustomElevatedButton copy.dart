import 'package:apir_front/src/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({super.key, 
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        textStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 10.0,
        shadowColor: AppTheme.secondaryColor.withOpacity(0.5),
        backgroundColor: AppTheme.primaryColor,
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return AppTheme.primaryColor.withOpacity(0.8);
            }
            return AppTheme.primaryColor;
          },
        ),
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(
            minWidth: 88.0,
            minHeight: 36.0,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: AppTheme.backgroundColorLight,
            ),
          ),
        ),
      ),
    );
  }
}