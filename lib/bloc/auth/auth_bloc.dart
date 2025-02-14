import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  AuthBloc() : super(AuthInitial()) {
    on<SignInWithEmail>(_onSignInWithEmail);
    on<SignUpWithEmail>(_onSignUpWithEmail);
    on<SignInWithGoogle>(_onsignInWithGoogle);
  }

  Future<void> _onSignInWithEmail(
      SignInWithEmail event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
              email: event.email, password: event.password);
      emit(AuthSuccess(userCredential.user!));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onSignUpWithEmail(
    SignUpWithEmail event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: event.email, password: event.password);
      emit(AuthSuccess(userCredential.user!));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onsignInWithGoogle(
      SignInWithGoogle event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        emit(AuthSuccess(userCredential.user!));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onSignOut(SignOut event, Emitter<AuthState> emit) async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    emit(AuthInitial());
  }
}
