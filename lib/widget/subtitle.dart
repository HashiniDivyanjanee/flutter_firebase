import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/themes.dart';

class subTitle extends StatelessWidget {
  final String title;
  const subTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
            color: AppThemes.SecondTextColor,
            fontSize: AppThemes.SecondaryFontSize),
      ),
    );
  }
}
