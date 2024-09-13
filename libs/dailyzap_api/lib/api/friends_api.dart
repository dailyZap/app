//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FriendsApi {
  FriendsApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /v1/friends/accept/{senderId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] senderId (required):
  Future<Response> acceptFriendshipWithHttpInfo(
    String senderId,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/v1/friends/accept/{senderId}'.replaceAll('{senderId}', senderId);

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
  /// * [String] senderId (required):
  Future<void> acceptFriendship(
    String senderId,
  ) async {
    final response = await acceptFriendshipWithHttpInfo(
      senderId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'DELETE /v1/friends/requests/{handle}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] handle (required):
  Future<Response> deleteFriendRequestWithHttpInfo(
    String handle,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/v1/friends/requests/{handle}'.replaceAll('{handle}', handle);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] handle (required):
  Future<void> deleteFriendRequest(
    String handle,
  ) async {
    final response = await deleteFriendRequestWithHttpInfo(
      handle,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /v1/friends/requests' operation and returns the [Response].
  Future<Response> getFriendRequestsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v1/friends/requests';

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

  Future<FriendRequestsResponseProps?> getFriendRequests() async {
    final response = await getFriendRequestsWithHttpInfo();
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
        'FriendRequestsResponseProps',
      ) as FriendRequestsResponseProps;
    }
    return null;
  }

  /// Performs an HTTP 'GET /v1/friends' operation and returns the [Response].
  Future<Response> getFriendsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v1/friends';

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

  Future<FriendsResponseProps?> getFriends() async {
    final response = await getFriendsWithHttpInfo();
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
        'FriendsResponseProps',
      ) as FriendsResponseProps;
    }
    return null;
  }

  /// Performs an HTTP 'POST /v1/friends/reject/{senderId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] senderId (required):
  Future<Response> rejectFriendshipWithHttpInfo(
    String senderId,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/v1/friends/reject/{senderId}'.replaceAll('{senderId}', senderId);

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
  /// * [String] senderId (required):
  Future<void> rejectFriendship(
    String senderId,
  ) async {
    final response = await rejectFriendshipWithHttpInfo(
      senderId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /v1/friends/requests/{handle}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] handle (required):
  Future<Response> requestFriendshipWithHttpInfo(
    String handle,
  ) async {
    // ignore: prefer_const_declarations
    final path =
        r'/v1/friends/requests/{handle}'.replaceAll('{handle}', handle);

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
  /// * [String] handle (required):
  Future<void> requestFriendship(
    String handle,
  ) async {
    final response = await requestFriendshipWithHttpInfo(
      handle,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
