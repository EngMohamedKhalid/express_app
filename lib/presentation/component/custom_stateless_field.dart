import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
  {super.key, required this.text, required this.padding, this.controller, this.keyType});
  final String text;
  final EdgeInsetsGeometry padding;
  final TextEditingController? controller;
  final TextInputType? keyType;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: TextField(
        keyboardType: keyType,
        controller: controller,
        style: const TextStyle(
          //fontWeight: FontWeight.bold,
            fontSize: 20),
        decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(color: Colors.red),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.red)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          label: Text(text),
          labelStyle: const TextStyle(
            fontSize: 20,
            // fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}