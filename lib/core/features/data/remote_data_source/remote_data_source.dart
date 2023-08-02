import 'dart:io';

import 'package:dio/dio.dart';
import 'package:keep_fit/app/app_configurations/app_configurations.dart';
import 'package:keep_fit/app/storage/app_preferences.dart';
import 'package:keep_fit/core/features/data/remote_data_source/models/params/params_model.dart';
import 'package:keep_fit/core/services/background_uploader/background_uploader.dart';
import 'package:keep_fit/core/utils/constants.dart';

abstract class RemoteDataSource {
  final Dio _dio;
  final AppPreferences _appPreferences;
  String? baseUrl;

  RemoteDataSource(
    this._dio,
    this._appPreferences, {
    this.baseUrl,
  }) {
    baseUrl ??= AppConfigurations.baseUrl;
  }

  Future<Map<String, dynamic>> get(ParamsModel model) async {
    _initHeaders();
    final url = model.baseUrl ?? baseUrl ?? _dio.options.baseUrl;
    Response response;
    response = await _dio.get(
      url + model.url.toString(),
      options: Options(
        headers: _dio.options.headers,
        responseType: _dio.options.responseType,
        receiveTimeout: _dio.options.receiveTimeout,
        sendTimeout: _dio.options.sendTimeout,
      ),
      queryParameters: model.urlParams,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(ParamsModel model) async {
    _initHeaders();
    final url = model.baseUrl ?? baseUrl ?? _dio.options.baseUrl;
    Response response;
    response = await _dio.post(
      url + model.url.toString(),
      data: model.useDataForPostRequest == true ? model.body!.toJson() : null,
      options: Options(
        headers: _dio.options.headers,
        responseType: _dio.options.responseType,
        receiveTimeout: _dio.options.receiveTimeout,
        sendTimeout: _dio.options.sendTimeout,
      ),
      queryParameters: model.urlParams,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> uploadFile(ParamsModel model) async {
    final url = model.baseUrl ?? baseUrl ?? _dio.options.baseUrl;
    final headers = _getMediaUploadHeaders();
    final response = BackgroundUploader.enqueueFile(
      filePath: model.body?.toJson()[Constants.file],
      headers: headers,
      url: url + model.url.toString(),
    );
    return response;
  }

  void _initHeaders() {
    final token = _appPreferences.getAccessToken();
    if (_dio.options.headers[Constants.authorization] != token) {
      _dio.options.headers[Constants.authorization] = token;
    }
  }

  Map<String, String> _getMediaUploadHeaders() => Platform.isAndroid
      ? {
          Constants.contentType: Constants.multipart,
          Constants.accept: Constants.applicationJson,
          Constants.authorization: _appPreferences.getAccessToken() ?? "",
        }
      : {
          Constants.accept: Constants.applicationJson,
          Constants.authorization: _appPreferences.getAccessToken() ?? "",
        };
}
