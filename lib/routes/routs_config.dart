import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/bloc/auth/auth_bloc.dart';
import 'package:flutter_firebase/bloc/data_item_bloc/data_item_bloc.dart';
import 'package:flutter_firebase/presentation/screen/customer.dart';
import 'package:flutter_firebase/presentation/screen/dashboard.dart';
import 'package:flutter_firebase/presentation/screen/home.dart';
import 'package:flutter_firebase/presentation/screen/job_register_tab.dart';
import 'package:flutter_firebase/presentation/screen/login.dart';
import 'package:flutter_firebase/presentation/screen/sign_up.dart';
import 'package:flutter_firebase/presentation/screen/start_screen.dart';
import 'package:flutter_firebase/repository/data_repository.dart';
import 'package:flutter_firebase/routes/rout_cons.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
    errorPageBuilder: (context, state) {
      return const MaterialPage(
          child: Scaffold(
        body: Center(
          child: Text("This Page is not Found!"),
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
      GoRoute(
        name: AppRoutesConstants.login,
        path: '/login',
        builder: (context, state) => BlocProvider(
          create: (context) => AuthBloc(),
          child: Login(),
        ),
      ),
      GoRoute(
        name: AppRoutesConstants.sign_up,
        path: '/sign_up',
        builder: (context, state) => BlocProvider(
          create: (context) => AuthBloc(),
          child: SignUp(),
        ),
      ),
      GoRoute(
        name: AppRoutesConstants.dashboard,
        path: '/dashboard',
        pageBuilder: (context, state) {
          return MaterialPage(child: Dashboard());
        },
      ),
      GoRoute(
        name: AppRoutesConstants.jobRegister,
        path: '/jobRegister',
        pageBuilder: (context, state) {
          return MaterialPage(child: JobRegister());
        },
      ),
       GoRoute(
        name: AppRoutesConstants.customer,
        path: '/customer',
        pageBuilder: (context, state) {
          return MaterialPage(child: Customer());
        },
      ),
    ]);
