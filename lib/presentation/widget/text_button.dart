import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/themes.dart';

class textButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final AlignmentGeometry alignment;
  final Color? color;

  const textButton(
      {super.key,
      required this.text,
      this.color,
      required this.callback,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25),
      child: Align(
        alignment: alignment,
        child: TextButton(
          
            onPressed: callback,
            child: Text(
              text,
              style: TextStyle(
                  color: color, fontSize: AppThemes.SecondaryFontSize),
            )),
      ),
    );
  }
}
