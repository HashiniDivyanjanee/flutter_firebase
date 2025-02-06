import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/themes.dart';

class button_with_icon extends StatelessWidget {
  const button_with_icon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Icon(Icons.add_a_photo),
        onPressed: () {},
        label: Text("Sign in with Google"),
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 2, 37, 83),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          fixedSize: Size(300,50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ));
  }
}
