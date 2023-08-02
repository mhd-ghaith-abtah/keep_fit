import 'package:keep_fit/app/app_management/media/domain/entities/background_uploader_entity.dart';
import 'package:keep_fit/core/features/data/remote_data_source/models/responses/base_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'background_uploader_response.g.dart';

@JsonSerializable()
class BackgroundUploaderResponse extends BaseResponseModel {
  @JsonKey(name: "taskId")
  final String? taskId;

  BackgroundUploaderResponse({required this.taskId});

  factory BackgroundUploaderResponse.fromJson(Map<String, dynamic> json) =>
      _$BackgroundUploaderResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BackgroundUploaderResponseToJson(this);

  @override
  BackgroundUploaderEntity toEntity() =>
      BackgroundUploaderEntity(taskId: taskId);
}
