import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/front.dart';
import 'package:flutter_firebase/constant/string.dart';
import 'package:flutter_firebase/constant/themes.dart';
import 'package:shimmer/shimmer.dart';

class Shimmer_Widget extends StatelessWidget {
  const Shimmer_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Center(
        child: Text(
          AppStrings.welcomeMessage,
          style: TextStyle(
              color: AppThemes.PrimaryColor,
              fontSize: AppThemes.PrimaryFontSize,
              fontFamily: AppFontFamily.secondaryFont),
        ),
      ),
      baseColor: Colors.black12,
      highlightColor: AppThemes.PrimaryColor,
      enabled: true,
      direction: ShimmerDirection.ltr,
      period: Duration(seconds: 2),
    );
  }
}
