import 'package:clustranotes_mobile/features/auth/notifier/auth_state.dart';
import 'package:flutter/material.dart';

class AuthRouterNotifier extends ChangeNotifier{
  AuthState _authState;
  
  AuthRouterNotifier(this._authState);
  
  AuthState get authState => _authState;
  
  void update(AuthState state){
    if(_authState == state){
      return;
    }
    
    _authState = state;
    notifyListeners();
  }
}
