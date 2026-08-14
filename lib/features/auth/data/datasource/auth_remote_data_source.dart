import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRemoteDataSource(this._firebaseAuth, this._googleSignIn);

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

    final googleAuth = googleUser.authentication;

    final credentials = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    final userCredential = await _firebaseAuth.signInWithCredential(
      credentials,
    );

    return userCredential;
  }

  Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name
  }) async { 
    final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email, 
      password: password
    );
    
    final user = credentials.user;
    if(user != null){
      await user.updateDisplayName(name);
      await sendVerificationEmailLink();
    }
    return credentials;
  }

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  
  Future<void> sendVerificationEmailLink() async{
    final user = _firebaseAuth.currentUser;
    
    if(user == null){
      throw Exception("No authenticated user found");
    }
    await user.sendEmailVerification();
  }
  
  Future<bool> checkEmailVerification() async{
    final user =  _firebaseAuth.currentUser;
    if(user == null){
      throw Exception("No authenticated user found");
    }
    await user.reload();
    
    return _firebaseAuth.currentUser?.emailVerified ?? false;
  }
  
  Future<void> forgotPassword({
    required String email,  
  })async{
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
