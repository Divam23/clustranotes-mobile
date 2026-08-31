import 'package:clustranotes_mobile/features/user/domain/models/user_model.dart';

class UserState {
  final UserModel? user;
  final bool isLoading;
  final String? error;
  
  const UserState({
    this.user,
    this.isLoading=false,
    this.error
  });
  
  static const _undefined = Object();
  
  UserState copyWith({
    UserModel? user,
    bool? isLoading,
    String? error
  }){
    return UserState(
      user: identical(user, _undefined) ? this.user : user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error
    );
  }
}
