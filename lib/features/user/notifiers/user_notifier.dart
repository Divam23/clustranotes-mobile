import 'package:clustranotes_mobile/features/user/domain/models/user_model.dart';
import 'package:clustranotes_mobile/features/user/domain/repositories/user_repository.dart';
import 'package:clustranotes_mobile/features/user/notifiers/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';

class UserNotifier extends StateNotifier<UserState>{
  final UserRepository _userRepository;
  
  UserNotifier(this._userRepository): super(const UserState());
  
  Future<UserModel?> authenticateUser() async{
    state = state.copyWith(isLoading: true, error: null);
    try{
      final user = await _userRepository.authenticateUser();
      state = state.copyWith(user: user, error: null);
      return user;
    }
    catch(error, stackTrace){
      debugPrint('Error authenticating user: $error');
      debugPrintStack(stackTrace: stackTrace);
      state = state.copyWith(error: error.toString());
      return null;
    }
    finally{
      state = state.copyWith(isLoading: false);
    }
  }
  
  Future<void> getCurrentUser() async{
    state = state.copyWith(isLoading: true, error: null);
    try{
      final user = await _userRepository.getCurrentUser();
      state = state.copyWith(
        user: user,
        error: null
      );
    }catch(error, stackTrace){
      debugPrint('Error fetching current user: $error');
      debugPrintStack(stackTrace: stackTrace);
      state = state.copyWith(error: error.toString());
    }
    finally{
      state = state.copyWith(
        isLoading: false
      );
    }
  }
  
  void clearUser(){
    state = state.copyWith(
      user: null,
      error: null
    );
  }
}
