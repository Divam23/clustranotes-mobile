import 'package:clustranotes_mobile/features/user/data/datasources/user_remote_data_source.dart';
import 'package:clustranotes_mobile/features/user/data/mappers/user_mapper.dart';
import 'package:clustranotes_mobile/features/user/domain/models/user_model.dart';
import 'package:clustranotes_mobile/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  final UserRemoteDataSource _remoteDataSource;
  
  UserRepositoryImpl(this._remoteDataSource);
  
  @override
  Future<UserModel> authenticateUser() async{
    final dto = await _remoteDataSource.authenticateUser();
    return UserMapper.toDomain(dto);
  }
  
  @override
  Future<UserModel> getCurrentUser() async{
    final dto = await _remoteDataSource.getCurrentUser();
    return UserMapper.toDomain(dto);
  }
}
