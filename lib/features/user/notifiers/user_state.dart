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
    Object? user = _undefined,
    bool? isLoading,
    Object? error = _undefined
  }){
    return UserState(
      user: identical(user, _undefined) ? this.user : user as UserModel?,
      isLoading: isLoading ?? this.isLoading,
      error: identical(error, _undefined) ? this.error : error as String?
    );
  }
}
