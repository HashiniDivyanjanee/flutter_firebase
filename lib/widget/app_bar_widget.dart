import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/themes.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String appBarName;

  const AppBarWidget({
    super.key,
    required this.appBarName,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appBarName,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: AppThemes.PrimaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
