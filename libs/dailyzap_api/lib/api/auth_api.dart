//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AuthApi {
  AuthApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /v1/auth/invite/{code}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] code (required):
  Future<Response> checkInviteWithHttpInfo(
    String code,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/auth/invite/{code}'.replaceAll('{code}', code);

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
  /// * [String] code (required):
  Future<void> checkInvite(
    String code,
  ) async {
    final response = await checkInviteWithHttpInfo(
      code,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /v1/auth/login' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [LoginParams] loginParams (required):
  Future<Response> loginWithHttpInfo(
    LoginParams loginParams,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/auth/login';

    // ignore: prefer_final_locals
    Object? postBody = loginParams;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

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
  /// * [LoginParams] loginParams (required):
  Future<LoginToken?> login(
    LoginParams loginParams,
  ) async {
    final response = await loginWithHttpInfo(
      loginParams,
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
        'LoginToken',
      ) as LoginToken;
    }
    return null;
  }

  /// Performs an HTTP 'POST /v1/auth/otp' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [OTPParams] oTPParams (required):
  Future<Response> otpWithHttpInfo(
    OTPParams oTPParams,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/auth/otp';

    // ignore: prefer_final_locals
    Object? postBody = oTPParams;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

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
  /// * [OTPParams] oTPParams (required):
  Future<Session?> otp(
    OTPParams oTPParams,
  ) async {
    final response = await otpWithHttpInfo(
      oTPParams,
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
        'Session',
      ) as Session;
    }
    return null;
  }

  /// Performs an HTTP 'PUT /v1/auth/register' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [UserCreationParams] userCreationParams (required):
  Future<Response> registerWithHttpInfo(
    UserCreationParams userCreationParams,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/auth/register';

    // ignore: prefer_final_locals
    Object? postBody = userCreationParams;

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
  /// * [UserCreationParams] userCreationParams (required):
  Future<LoginToken?> register(
    UserCreationParams userCreationParams,
  ) async {
    final response = await registerWithHttpInfo(
      userCreationParams,
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
        'LoginToken',
      ) as LoginToken;
    }
    return null;
  }
}
