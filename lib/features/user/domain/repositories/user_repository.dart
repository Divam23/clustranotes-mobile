import 'package:clustranotes_mobile/features/user/domain/models/user_model.dart';

abstract interface class UserRepository {
  Future<UserModel> authenticateUser();
  Future<UserModel> getCurrentUser();
}
