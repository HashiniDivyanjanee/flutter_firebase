import 'package:flutter/material.dart';
import 'package:flutter_firebase/interface/home.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter( errorPageBuilder: (context, state) {
    return const MaterialPage(
        child: Scaffold(
      body: Center(
        child: Text("This Page is not Found!!"),
      ),
    ));
  },
  routes: [
    GoRoute(path: '/', pageBuilder:(context, state) {
      return MaterialPage(child: Home());
    },)
  ]
);