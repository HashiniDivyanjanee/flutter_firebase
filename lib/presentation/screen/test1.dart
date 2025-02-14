import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/bloc/auth/auth_bloc.dart';
import 'package:flutter_firebase/presentation/screen/home.dart';
import 'package:flutter_firebase/routes/rout_cons.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Email Input Field
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),

            // Password Input Field
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),

            // Sign-In Button
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  // Show error message if sign-in fails
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                } else if (state is AuthSuccess) {
                  GoRouter.of(context).pushNamed(AppRoutesConstants.home);
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return CircularProgressIndicator(); // Show loading indicator
                }
                return ElevatedButton(
                  onPressed: () {
                    // Trigger the sign-in event
                    context.read<AuthBloc>().add(
                          SignInWithEmail(
                            _emailController.text,
                            _passwordController.text,
                          ),
                        );
                  },
                  child: Text('Sign In'),
                );
              },
            ),
            SizedBox(height: 10),

            // Sign-In with Google Button
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(SignInWithGoogle());
              },
              child: Text('Sign In with Google'),
            ),
          ],
        ),
      ),
    );
  }
}