import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{
  final String ? hintText;
  final bool ? obscureText;
  final IconData ? icon;
  final Color ? iconColor;
  final TextEditingController ? controller ;
  MyTextField({@required this.hintText,
    this.obscureText,
    this.icon,
    this.iconColor,
    @required this.controller});
  @override
  Widget build(BuildContext){
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(icon,color: iconColor,),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 20,
          color: Colors.grey,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey,
              width: 2
          ),
        ),
      ),
    );
  }
}