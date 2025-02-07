import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/front.dart';
import 'package:flutter_firebase/constant/themes.dart';
import 'package:shimmer/shimmer.dart';

class Shimmer_Widget extends StatelessWidget {
  final String text;

  const Shimmer_Widget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: AppThemes.PrimaryColor,
              fontSize: AppThemes.PrimaryFontSize,
              fontFamily: AppFontFamily.secondaryFont),
        ),
      ),
      baseColor:AppThemes.PrimaryColor,
      highlightColor:  Colors.black12,
      enabled: true,
      direction: ShimmerDirection.ltr,
      period: Duration(seconds: 2),
    );
  }
}
