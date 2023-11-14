import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({
    super.key,
    required this.text,
    required this.icon,
    required this.isPasswordField,
    required this.controller,
    this.errorCode,
  });

  final String text;
  final IconData icon;
  final TextEditingController controller;
  final bool isPasswordField;
  final String? errorCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: TextField(
        controller: controller,
        obscureText: isPasswordField,
        style: TextStyle(fontSize: 14),
        cursorColor: Colors.grey,
        //textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          hintText: text,
          errorText: errorCode == "" ? null : errorCode,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          errorStyle: TextStyle(fontSize: 12),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: Icon(
              icon,
              color: Colors.black,
              size: 26,
            ),
          ),
          filled: true,
          fillColor: Colors.grey[350],
        ),
      ),
    );
  }
}
