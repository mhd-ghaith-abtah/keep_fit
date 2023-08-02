import 'dart:convert';

import 'package:keep_fit/app/app_management/media/domain/entities/media_upload_entity.dart';
import 'package:keep_fit/core/features/data/remote_data_source/models/responses/base_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_upload_api_response.g.dart';

@JsonSerializable()
class MediaUploadAPIResponse extends BaseResponseModel {
  @JsonKey(name: "result")
  MediaUploadAPIResult? result;

  MediaUploadAPIResponse({required this.result});

  factory MediaUploadAPIResponse.fromJson(Map<String, dynamic> json) =>
      _$MediaUploadAPIResponseFromJson(json);

  factory MediaUploadAPIResponse.fromString(String response) =>
      MediaUploadAPIResponse.fromJson(json.decode(response));

  @override
  Map<String, dynamic> toJson() => _$MediaUploadAPIResponseToJson(this);

  @override
  MediaUploadEntity toEntity() => MediaUploadEntity(
        id: result?.id,
        url: result?.url,
      );
}

@JsonSerializable()
class MediaUploadAPIResult {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "url")
  final String? url;

  MediaUploadAPIResult({required this.id, required this.url});

  factory MediaUploadAPIResult.fromJson(Map<String, dynamic> json) =>
      _$MediaUploadAPIResultFromJson(json);

  Map<String, dynamic> toJson() => _$MediaUploadAPIResultToJson(this);
}
