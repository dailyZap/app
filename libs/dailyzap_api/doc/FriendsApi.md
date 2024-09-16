# dailyzap_api.api.FriendsApi

## Load the API package
```dart
import 'package:dailyzap_api/api.dart';
```

All URIs are relative to *http://192.168.113.54*

Method | HTTP request | Description
------------- | ------------- | -------------
[**acceptFriendship**](FriendsApi.md#acceptfriendship) | **POST** /v1/friends/requests/{senderId}/accept | 
[**deleteFriendRequest**](FriendsApi.md#deletefriendrequest) | **DELETE** /v1/friends/requests/{handle} | 
[**getFriendRequests**](FriendsApi.md#getfriendrequests) | **GET** /v1/friends/requests | 
[**getFriends**](FriendsApi.md#getfriends) | **GET** /v1/friends | 
[**rejectFriendship**](FriendsApi.md#rejectfriendship) | **POST** /v1/friends/requests/{senderId}/reject | 
[**requestFriendship**](FriendsApi.md#requestfriendship) | **PUT** /v1/friends/requests/{handle} | 


# **acceptFriendship**
> acceptFriendship(senderId)



### Example
```dart
import 'package:dailyzap_api/api.dart';
// TODO Configure HTTP Bearer authorization: sessionToken
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FriendsApi();
final senderId = senderId_example; // String | 

try {
    api_instance.acceptFriendship(senderId);
} catch (e) {
    print('Exception when calling FriendsApi->acceptFriendship: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **senderId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteFriendRequest**
> deleteFriendRequest(handle)



### Example
```dart
import 'package:dailyzap_api/api.dart';
// TODO Configure HTTP Bearer authorization: sessionToken
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FriendsApi();
final handle = handle_example; // String | 

try {
    api_instance.deleteFriendRequest(handle);
} catch (e) {
    print('Exception when calling FriendsApi->deleteFriendRequest: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **handle** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFriendRequests**
> FriendRequests getFriendRequests()



### Example
```dart
import 'package:dailyzap_api/api.dart';
// TODO Configure HTTP Bearer authorization: sessionToken
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FriendsApi();

try {
    final result = api_instance.getFriendRequests();
    print(result);
} catch (e) {
    print('Exception when calling FriendsApi->getFriendRequests: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**FriendRequests**](FriendRequests.md)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFriends**
> Friends getFriends()



### Example
```dart
import 'package:dailyzap_api/api.dart';
// TODO Configure HTTP Bearer authorization: sessionToken
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FriendsApi();

try {
    final result = api_instance.getFriends();
    print(result);
} catch (e) {
    print('Exception when calling FriendsApi->getFriends: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Friends**](Friends.md)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **rejectFriendship**
> rejectFriendship(senderId)



### Example
```dart
import 'package:dailyzap_api/api.dart';
// TODO Configure HTTP Bearer authorization: sessionToken
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FriendsApi();
final senderId = senderId_example; // String | 

try {
    api_instance.rejectFriendship(senderId);
} catch (e) {
    print('Exception when calling FriendsApi->rejectFriendship: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **senderId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **requestFriendship**
> requestFriendship(handle)



### Example
```dart
import 'package:dailyzap_api/api.dart';
// TODO Configure HTTP Bearer authorization: sessionToken
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FriendsApi();
final handle = handle_example; // String | 

try {
    api_instance.requestFriendship(handle);
} catch (e) {
    print('Exception when calling FriendsApi->requestFriendship: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **handle** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

