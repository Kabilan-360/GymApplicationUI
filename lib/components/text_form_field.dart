import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final String? Function(String?)? validator; // Validator as a parameter


   CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 1.0), // Adds a border
        borderRadius: BorderRadius.circular(8), // Rounds the corners
      ),
      child: TextFormField(
        decoration:  InputDecoration(
          icon: Icon(icon, color: Colors.amber,),
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.black
          )
          // contentPadding: EdgeInsets.only(left: 16)
        ),
        validator: validator
      ),
    );
  }
}
