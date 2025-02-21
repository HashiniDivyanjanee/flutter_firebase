import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/themes.dart';


class Second_Title extends StatelessWidget {
  final String second_title;
  const Second_Title({
    super.key,
    required this.second_title,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Text(
         second_title,
          style: const TextStyle(
              color: AppThemes.SecondTextColor,
              fontSize: AppThemes.SecondaryFontSize),
        ),
      ),
    );
  }
}
