import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  
  final TextEditingController controller;
  final bool obscuretext;
  final String hintText;
  final IconData icon;

const Mytextfield({super.key, required this.hintText, this.obscuretext=false,   required this.controller,  this.icon=Icons.abc});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscuretext,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        fillColor: Colors.grey.withOpacity(0.6),
        filled: false, 
        prefixIcon: Icon(icon),
      ),
      
    );
  }
}