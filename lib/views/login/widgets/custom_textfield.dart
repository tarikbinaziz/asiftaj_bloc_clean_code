import 'package:flutter/material.dart';

/// Reusable TextField Widget
class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final FocusNode? focusNode;
  final Function(String)? onChanged;


  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.onChanged,
    this.focusNode
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onChanged:onChanged ,
    );
  }
}
