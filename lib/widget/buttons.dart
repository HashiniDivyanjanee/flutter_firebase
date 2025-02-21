import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String buttonText;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback callback;

  ButtonComponent(
      {super.key,
      required this.buttonText,
      required this.textColor,
      required this.buttonColor,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 15, color: textColor, fontWeight: FontWeight.bold),
          )),
    );
  }
}
