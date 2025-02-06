import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/themes.dart';

class subTitle extends StatelessWidget {
  final String tiltle;
  const subTitle({
    super.key,
    required this.tiltle,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        tiltle,
        style: TextStyle(
            color: AppThemes.SecondTextColor,
            fontSize: AppThemes.SecondaryFontSize),
      ),
    );
  }
}
