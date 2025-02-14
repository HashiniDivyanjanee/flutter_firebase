import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/assest_path.dart';

class CustomIconButton extends StatelessWidget {
    final VoidCallback callback;
  const CustomIconButton({
    super.key, required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image(image: AssetImage(AssestPath.googleicon)),
      onPressed: () {
        callback();
      },
    );
  }
}
