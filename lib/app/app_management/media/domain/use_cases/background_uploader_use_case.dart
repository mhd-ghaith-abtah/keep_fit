import 'package:dartz/dartz.dart';
import 'package:keep_fit/app/app_management/media/data/remote/models/params/media_upload_params.dart';
import 'package:keep_fit/app/app_management/media/data/repositories/background_uploader_repository.dart';
import 'package:keep_fit/app/app_management/media/domain/entities/background_uploader_entity.dart';
import 'package:keep_fit/core/features/domain/entities/error_entity.dart';
import 'package:keep_fit/core/features/domain/use_cases/use_case.dart';

class BackgroundUploaderUseCase
    extends UseCase<BackgroundUploaderEntity, MediaUploadParams> {
  BackgroundUploaderRepository repository;

  BackgroundUploaderUseCase(this.repository);

  @override
  Future<Either<ErrorEntity, BackgroundUploaderEntity>> call(
          MediaUploadParams params) async =>
      repository.enqueueFile(params);
}
