part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInWithEmail extends AuthEvent {
  final String email;
  final String password;

  SignInWithEmail(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignUpWithEmail extends AuthEvent {
  final String email;
  final String password;

  SignUpWithEmail(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignInWithGoogle extends AuthEvent{}

class SignOut extends AuthEvent{}