import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/assest_path.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image(image: AssetImage(AssestPath.googleicon)),
      onPressed: () {},
    );
  }
}
