import 'package:apir_front/src/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final VoidCallback onPressed;
  final Icon? icon;

  const CustomAppBar({super.key, 
    required this.text,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(
        color: AppTheme.backgroundColorLight,
        onPressed: onPressed
      ),
      shadowColor: Colors.grey,
      title: Text(
        text,
        style: TextStyle(color: AppTheme.backgroundColorLight),
      ),
      backgroundColor: AppTheme.primaryColor,
      actions: [
        if (icon != null) ...[
          IconButton(
            icon: icon!,
            onPressed: onPressed,
          ),
        ]
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}