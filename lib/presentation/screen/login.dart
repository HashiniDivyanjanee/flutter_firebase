import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/assest_path.dart';
import 'package:flutter_firebase/constant/themes.dart';
import 'package:flutter_firebase/presentation/widget/bg_clip_path_widget.dart';
import 'package:flutter_firebase/presentation/widget/buttons.dart';
import 'package:flutter_firebase/presentation/widget/icon_with_button.dart';
import 'package:flutter_firebase/presentation/widget/shimmer_widget.dart';
import 'package:flutter_firebase/presentation/widget/subtitle.dart';
import 'package:flutter_firebase/presentation/widget/text_button.dart';
import 'package:flutter_firebase/presentation/widget/text_form_field.dart';
import 'package:flutter_firebase/routes/rout_cons.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final nameController = TextEditingController();
  final pwController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BgClipPathWidget(
              image: AssetImage(AssestPath.background),
            ),
            const SizedBox(
              height: 30,
            ),
            Shimmer_Widget(),
            subTitle(
              title: 'Sign in to Continue',
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldComponent(
              controller: nameController,
              lableText: "Email Address",
              suffixIcon: Icons.person,
              inputType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              obscureText: false,
              maxLines: 1,
            ),
            TextFormFieldComponent(
              controller: pwController,
              lableText: "Password",
              suffixIcon: Icons.lock,
              inputType: TextInputType.visiblePassword,
              textCapitalization: TextCapitalization.characters,
              obscureText: true,
              maxLines: 1,
            ),
            textButton(
              text: 'Foget Password?',
              callback: () {},
              alignment: Alignment.topRight,
              color: AppThemes.SecondTextColor,
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonComponent(
                buttonText: "LOGIN",
                textColor: Colors.white,
                buttonColor: AppThemes.PrimaryColor,
                callback: () {
                  GoRouter.of(context).pushNamed(AppRoutesConstants.home);
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                subTitle(title: "Don't have an account?"),
                textButton(
                  text: "Sign up",
                  callback: () {
                    GoRouter.of(context).pushNamed(AppRoutesConstants.sign_up);
                  },
                  alignment: Alignment.center,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            subTitle(
                title:
                    "------------------------------------OR------------------------------------"),
            SizedBox(
              height: 20,
            ),
            button_with_icon(),
          ],
        ),
      ),
    );
  }
}
