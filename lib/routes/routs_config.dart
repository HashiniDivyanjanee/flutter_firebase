import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/bloc/data_item_bloc/data_item_bloc.dart';
import 'package:flutter_firebase/presentation/screen/home.dart';
import 'package:flutter_firebase/presentation/screen/start_screen.dart';
import 'package:flutter_firebase/repository/data_repository.dart';
import 'package:flutter_firebase/routes/rout_cons.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
    errorPageBuilder: (context, state) {
      return const MaterialPage(
          child: Scaffold(
        body: Center(
          child: Text("This Page is not Found!!"),
        ),
      ));
    },
    routes: [
      GoRoute(
        name: AppRoutesConstants.StartScreen,
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: StartScreen());
        },
      ),
      GoRoute(
        name: AppRoutesConstants.home,
        path: '/home',
        builder: (context, state) => BlocProvider(
          create: (context) => DataItemBloc(DataRepository()),
          child: Home(),
        ),
      ),
    ]);
