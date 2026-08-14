import 'dart:async';
import 'package:clustranotes_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:clustranotes_mobile/features/auth/notifier/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;
  Timer? _verificationCooldownTimer;
  
  AuthNotifier(this._repository) : super(const AuthState());
  
  Future<void> signInWithGoogle() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final userCredential = await _repository.signInWithGoogle();
      state = state.copyWith(isLoading: false, user: userCredential.user);
      debugPrint('UID: ${userCredential.user?.uid}');
      debugPrint('Email: ${userCredential.user?.email}');
    } catch (error, stackTrace) {
      debugPrint("Error while signing in: $error");
      debugPrintStack(stackTrace: stackTrace);
      state = state.copyWith(
        isLoading: false,
        error: error.toString(),
        user: null,
      );
    }
  }

  Future<bool> signUp ({
    required String email,
    required String password,
    required String name
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final credential = await _repository.registerWithEmailAndPassword(
        email: email,
        password: password,
        name: name
      );
      
      state = state.copyWith(
        error: null, user: credential.user
      );
      return true;
    } catch (error) {
      state = state.copyWith(error: error.toString(), user: null);
      return false;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
  
  Future<void> signIn({
    required String email,
    required String password
  }) async{
    state = state.copyWith(isLoading: true, error: null);
    try{
      final credential = await _repository.signInWithEmailAndPassword(email: email, password: password);
      state = state.copyWith(error: null, user: credential.user);
    }
    catch (error) {
      state = state.copyWith(error: error.toString(), user: null);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
  
  Future<void> resendEmailVerificationLink() async{
    if(state.verificationResendCooldown > 0) return;
    state = state.copyWith(isSendingVerification: true, error: null);
    
    try{
      await _repository.sendEmailVerificationLink();
      _startVerificationCooldownTimer();
      state = state.copyWith(error: null);
    }
    catch(error){
      state = state.copyWith(error: error.toString());
    }
    finally{
      state = state.copyWith(isSendingVerification: false);
    }
  }
  
  Future<bool> checkEmailVerification() async{
    state = state.copyWith(isCheckingVerification: true, error: null);
    
    try{
      final response = await _repository.checkEmailVerification();
      state = state.copyWith(error: null);
      
      return response;
    }catch(error){
      state = state.copyWith(error: error.toString());
      return false;
    }
    finally{
      state = state.copyWith(isCheckingVerification: false);
    }
  }
  
  Future<void> forgotPassword({
    required String email,
  }) async{
    state = state.copyWith(isLoading: true, error: null);
    try{
      await _repository.forgotPassword(email: email);
      state = state.copyWith(error: null);
    }
    catch(error){
      state = state.copyWith(error: error.toString());
    }
    finally{
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await _repository.signOut();
      state = state.copyWith(error: null);
      state = const AuthState();
    } catch (error, stackTrace) {
      debugPrint("Error logging out: $error");
      debugPrintStack(stackTrace: stackTrace);
      state = state.copyWith(error: error.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
  
  void _startVerificationCooldownTimer(){
    _verificationCooldownTimer?.cancel();
    
    state = state.copyWith(verificationResendCooldown: 45);
    
    _verificationCooldownTimer = Timer.periodic(
      const Duration(seconds: 1),
        (timer){
          final remaining = state.verificationResendCooldown;
          if(remaining <= 1 ){
            timer.cancel();
            
            state = state.copyWith(verificationResendCooldown: 0);
            
            return;
          }
          state = state.copyWith(verificationResendCooldown: remaining-1);
        }
    );
  }
}
