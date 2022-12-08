import 'package:flutter/material.dart';

class CustomStateFulTextField extends StatefulWidget {
  const CustomStateFulTextField(
  {super.key, required this.padding, required this.lable, this.controller});
  final EdgeInsetsGeometry padding;
  final String lable;
  final TextEditingController? controller;
  @override
  State<CustomStateFulTextField> createState() =>
      _CustomStateFulTextFieldState();
}

class _CustomStateFulTextFieldState extends State<CustomStateFulTextField> {
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: TextField(
        controller: widget.controller,
        obscureText: secure,
        style: const TextStyle(
          //fontWeight: FontWeight.bold,
            fontSize: 20),
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                secure = !secure;
              });
            },
            child: secure ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          ),
          floatingLabelStyle: const TextStyle(color: Colors.red),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.red)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          label: Text(widget.lable),
          labelStyle: const TextStyle(
            fontSize: 20,
            // fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
