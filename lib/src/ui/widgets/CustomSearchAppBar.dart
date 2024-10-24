import 'package:apir_front/src/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String hintText;
  final VoidCallback onFilterPressed;
  final ValueChanged<String> onSearchChanged;

  CustomSearchAppBar({
    required this.hintText,
    required this.onFilterPressed,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.grey,
      title: TextField(
        onChanged: onSearchChanged,
        style: TextStyle(color: AppTheme.primaryColor),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppTheme.primaryColor.withOpacity(0.6)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ),
      ),
      backgroundColor: AppTheme.primaryColor,
      actions: [
        IconButton(
          icon: Icon(Icons.filter_list, color: AppTheme.backgroundColorLight),
          onPressed: onFilterPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}