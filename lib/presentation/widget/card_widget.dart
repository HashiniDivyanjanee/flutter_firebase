import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/themes.dart';


class Card_Widget extends StatelessWidget {
  final String cardname;
  final IconData card_icon;
  final VoidCallback callback;

  const Card_Widget({
    super.key,
    required this.cardname,
    required this.card_icon,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 120,
        width: 140,
        decoration: BoxDecoration(
            color: AppThemes.cardBackgroundColor,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding:  EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                card_icon,
                size: 50,
                color: Colors.black,
              ),
              Text(
                cardname,
                style:  TextStyle(
                    color: AppThemes.PrimaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
