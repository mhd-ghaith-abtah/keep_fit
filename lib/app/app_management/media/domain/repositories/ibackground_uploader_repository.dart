import 'package:dartz/dartz.dart';
import 'package:keep_fit/app/app_management/media/data/remote/models/params/media_upload_params.dart';
import 'package:keep_fit/app/app_management/media/domain/entities/background_uploader_entity.dart';
import 'package:keep_fit/core/features/domain/entities/error_entity.dart';
import 'package:keep_fit/core/features/domain/repositories/irepository.dart';

abstract class IBackgroundUploaderRepository extends IRepository {
  Future<Either<ErrorEntity, BackgroundUploaderEntity>> enqueueFile(
      MediaUploadParams mediaUploadParams);
}
