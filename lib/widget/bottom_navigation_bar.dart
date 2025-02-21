
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/themes.dart';


class bottomNavigationBar extends StatelessWidget {
  const bottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      items: const [
        TabItem(title: 'Home', icon: Icons.home),
        TabItem(title: 'About', icon: Icons.cabin),
        TabItem(title: 'Profile', icon: Icons.person),
      ],
      color: const Color.fromARGB(255, 255, 255, 255),
      shadowColor: AppThemes.PrimaryColor,
      gradient: const LinearGradient(colors: [
       AppThemes.PrimaryColor,
       AppThemes.PrimaryColor,
      ]),
      style: TabStyle.reactCircle,
      activeColor:  const Color.fromARGB(255, 255, 255, 255),
      curve: Curves.bounceInOut,
      elevation: 8,
     
    );
  }
}
