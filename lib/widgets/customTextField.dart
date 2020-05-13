import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Widget prefix;
  final Widget suffix;
  final bool obscure;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final Function onEditingComplete;
  final bool enabled;

  CustomTextField({
    this.hint: "",
    this.prefix,
    this.suffix,
    this.obscure: false,
    this.textInputType: TextInputType.text,
    this.onChanged,
    this.onEditingComplete,
    this.enabled: true,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(24),
      ),
      padding: prefix != null ? null : const EdgeInsets.only(left: 24),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onChanged: onChanged,
        enabled: enabled,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
