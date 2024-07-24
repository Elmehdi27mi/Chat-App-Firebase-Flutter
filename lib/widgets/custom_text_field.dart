import 'package:flutter/material.dart';

class CustemTextFormField extends StatelessWidget {
  String? hintText;
  bool? obscure;
  Function(String)? onChanged;
  CustemTextFormField({this.hintText, this.onChanged, this.obscure = false});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'ths champ is empty';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}
