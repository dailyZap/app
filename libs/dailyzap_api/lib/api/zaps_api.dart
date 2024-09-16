//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ZapsApi {
  ZapsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'PUT /v1/zaps' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [ZapCreationParams] zapCreationParams (required):
  Future<Response> createZapWithHttpInfo(
    ZapCreationParams zapCreationParams,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/zaps';

    // ignore: prefer_final_locals
    Object? postBody = zapCreationParams;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [ZapCreationParams] zapCreationParams (required):
  Future<ZapUploadInfo?> createZap(
    ZapCreationParams zapCreationParams,
  ) async {
    final response = await createZapWithHttpInfo(
      zapCreationParams,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'ZapUploadInfo',
      ) as ZapUploadInfo;
    }
    return null;
  }

  /// Performs an HTTP 'GET /v1/zaps/{id}/picture/{side}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [ZapImageType] side (required):
  Future<Response> getProfilePictureWithHttpInfo(
    String id,
    ZapImageType side,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/zaps/{id}/picture/{side}'
        .replaceAll('{id}', id)
        .replaceAll('{side}', side.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [ZapImageType] side (required):
  Future<String?> getProfilePicture(
    String id,
    ZapImageType side,
  ) async {
    final response = await getProfilePictureWithHttpInfo(
      id,
      side,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'String',
      ) as String;
    }
    return null;
  }

  /// Performs an HTTP 'POST /v1/zaps/{id}/repost' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> repostZapWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/zaps/{id}/repost'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] id (required):
  Future<void> repostZap(
    String id,
  ) async {
    final response = await repostZapWithHttpInfo(
      id,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /v1/zaps/{id}/uploaded' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> setZapUploadedWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/zaps/{id}/uploaded'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] id (required):
  Future<void> setZapUploaded(
    String id,
  ) async {
    final response = await setZapUploadedWithHttpInfo(
      id,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
