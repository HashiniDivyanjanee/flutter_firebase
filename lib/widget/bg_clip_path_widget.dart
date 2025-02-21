import 'package:flutter/material.dart';
import 'package:flutter_firebase/widget/clip_path_widgets.dart';

class BgClipPathWidget extends StatelessWidget {
  final ImageProvider image;

  BgClipPathWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
          height: 280,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          )),
      clipper: AppCustomeClipper(),
    );
  }
}
