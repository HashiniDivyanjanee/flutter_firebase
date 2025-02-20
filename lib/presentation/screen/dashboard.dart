import 'package:flutter/material.dart';
import 'package:flutter_firebase/presentation/widget/app_bar_widget.dart';
import 'package:flutter_firebase/presentation/widget/bottom_navigation_bar.dart';
import 'package:flutter_firebase/presentation/widget/card_widget.dart';
import 'package:flutter_firebase/routes/rout_cons.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        appBarName: 'Dashboard',
      ),
      bottomNavigationBar: bottomNavigationBar(),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: Column(children: [
              Card1(context),
              const SizedBox(
                height: 20,
              ),
              Card2(context),
              const SizedBox(
                height: 20,
              ),
              Card3(context),
              const SizedBox(
                height: 20,
              ),
              Card4(context),
            ]),
          ),
        ),
      ),
    );
  }
}

Widget Card4(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Card_Widget(cardname: 'TEST 5', card_icon: Icons.wallet, callback: () {}),
      Card_Widget(cardname: 'TEST 6', card_icon: Icons.face, callback: () {}),
    ],
  );
}

Widget Card3(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Card_Widget(
          cardname: 'TEST 3', card_icon: Icons.dangerous, callback: () {}),
      Card_Widget(
          cardname: 'TEST 4', card_icon: Icons.kayaking, callback: () {}),
    ],
  );
}

Widget Card2(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Card_Widget(
          cardname: 'JOB LIST',
          card_icon: Icons.text_snippet,
          callback: () {
            GoRouter.of(context).pushNamed(AppRoutesConstants.customer);
          }),
      Card_Widget(cardname: 'TEST 2', card_icon: Icons.image, callback: () {}),
    ],
  );
}

Widget Card1(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Card_Widget(
          cardname: 'CUSTOMER',
          card_icon: Icons.person,
          callback: () {
            GoRouter.of(context).pushNamed(AppRoutesConstants.customer);
          }),
      Card_Widget(
          cardname: 'NEW JOB',
          card_icon: Icons.pest_control,
          callback: () {
            GoRouter.of(context).pushNamed(AppRoutesConstants.jobRegister);
          }),
    ],
  );
}
