import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignInProvider = Provider<GoogleSignIn>((ref) {
  final googleSignIn = GoogleSignIn.instance;

  googleSignIn.initialize(
    serverClientId: '1037995510893-a9e3bkmrpkhpe27ci4plnao6d2dm3r1c.apps.googleusercontent.com'
  );

  return googleSignIn;
});
