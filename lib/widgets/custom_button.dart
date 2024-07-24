import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? text;
  VoidCallback? onTap;
  CustomButton({this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
          text!,
          style: TextStyle(
              color: Color(0xff2B475E),
              fontWeight: FontWeight.bold,
              fontSize: 14),
        )),
      ),
    );
  }
}
