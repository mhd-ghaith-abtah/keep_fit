// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_upload_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaUploadAPIResponse _$MediaUploadAPIResponseFromJson(
        Map<String, dynamic> json) =>
    MediaUploadAPIResponse(
      result: json['result'] == null
          ? null
          : MediaUploadAPIResult.fromJson(
              json['result'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool?
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$MediaUploadAPIResponseToJson(
        MediaUploadAPIResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'message': instance.message,
      'result': instance.result,
    };

MediaUploadAPIResult _$MediaUploadAPIResultFromJson(
        Map<String, dynamic> json) =>
    MediaUploadAPIResult(
      id: json['id'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$MediaUploadAPIResultToJson(
        MediaUploadAPIResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };
