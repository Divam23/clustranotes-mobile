import 'package:clustranotes_mobile/features/upload/data/datasource/upload_remote_datasource.dart';
import 'package:clustranotes_mobile/features/upload/domain/repositories/upload_repository.dart';

class UploadRepositoryImpl implements UploadRepository{
  final UploadRemoteDataSource _remoteDataSource;
  
  UploadRepositoryImpl(this._remoteDataSource);
}
